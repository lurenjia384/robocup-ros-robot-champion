
#include <ros/ros.h>

//topic 头文件
#include <iostream>
#include <std_msgs/Bool.h>
#include <geometry_msgs/Pose.h>
#include <geometry_msgs/PoseStamped.h>
#include <sensor_msgs/LaserScan.h>
#include <geometry_msgs/Twist.h>
#include <cmath>
#include <stdlib.h>

#include <std_msgs/Int8.h>
#include <std_msgs/String.h>
#include <math_utils.h>

using namespace std;

#define RAD2DEG(x) ((x)*180./M_PI)

//--------------------------------------------输入--------------------------------------------------
sensor_msgs::LaserScan Laser;                                   //激光雷达点云数据
geometry_msgs::PoseStamped pos_drone;                           //机器人当前位置
int range_min;                                                //激光雷达探测范围 最小角度
int range_max;                                                //激光雷达探测范围 最大角度
float last_time = 0;
//--------------------------------------------算法相关--------------------------------------------------
float R_outside,R_inside;                                       //安全半径 [避障算法相关参数]
float p_R;                                                      //大圈比例参数
float p_r;                                                      //小圈比例参数

float distance_c,angle_c;                                       //最近障碍物距离 角度
float distance_cx,distance_cy;                                  //最近障碍物距离XY
float vel_collision[2];                                         //躲避障碍部分速度
float vel_collision_max;                                        //躲避障碍部分速度限幅

float p_xy;                                                     //追踪部分位置环P
float vel_track[2];                                             //追踪部分速度
float vel_track_max;                                            //追踪部分速度限幅
int flag_land;                                                  //降落标志位

int flag_hold;                                                 //dyx

Eigen::Quaterniond q_fcu;                                       //机器人姿态四元数
Eigen::Vector3d Euler_fcu;                                      //机器人姿态欧拉角
//--------------------------------------------4X4往返demo用-------------------------------------------------
geometry_msgs::Twist cmd_vel;
float target_x,target_y;                                                   //A点坐标
bool reach_flag;

//--------------------------------------------输出--------------------------------------------------
std_msgs::Bool flag_collision_avoidance;                       //是否进入避障模式标志位
float vel_sp_body[2];                                           //总速度
float vel_sp_ENU[2];                                            //ENU下的总速度
float vel_sp_max;                                               //总速度限幅
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>声 明 函 数<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
void cal_min_distance();
float satfunc(float data, float Max);
void printf();                                                                       //打印函数
void printf_param();                                                                 //打印各项参数以供检查
void collision_avoidance(float target_x,float target_y);                             //人工势场法壁障
// 【坐标系旋转函数】- 机体系到enu系
// input是机体系,output是惯性系，yaw_angle是当前偏航角
void rotation_yaw(float yaw_angle, float input[2], float output[2])
{
    output[0] = input[0] * cos(yaw_angle) - input[1] * sin(yaw_angle);
    output[1] = input[0] * sin(yaw_angle) + input[1] * cos(yaw_angle);
}
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>回 调 函 数<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//接收雷达的数据，并做相应处理,然后计算前后左右四向最小距离
void lidar_cb(const sensor_msgs::LaserScan::ConstPtr& scan)
{
    sensor_msgs::LaserScan Laser_tmp;
    Laser_tmp = *scan;
    Laser = *scan;
    int count;    //count = 359
    count = Laser.ranges.size();

    //剔除inf的情况
    for(int i = 0; i < count; i++)
    {
        //判断是否为inf
        int a = isinf(Laser_tmp.ranges[i]);
        //如果为inf，则赋值上一角度的值
        if(a == 1)
        {
            if(i == 0)
            {
                Laser_tmp.ranges[i] = Laser_tmp.ranges[count-1];
            }
            else
            {
                Laser_tmp.ranges[i] = Laser_tmp.ranges[i-1];
            }
        }
    
    }
    for(int i = 0; i < count; i++)
    {
           if(i+180>359) Laser.ranges[i]=Laser_tmp.ranges[i-180];
           else Laser.ranges[i]=Laser_tmp.ranges[i+180];
           //cout<<"tmp: "<<i<<" l:"<<Laser_tmp.ranges[i]<<"|| Laser: "<<Laser.ranges[i]<<endl;
    }
    //cout<<"//////////////"<<endl;
    //计算前后左右四向最小距离
    cal_min_distance();
}


//当前机器人坐标
void pos_cb(const geometry_msgs::PoseStamped::ConstPtr &msg)
{
    pos_drone = *msg;
    // Read the Quaternion from the Mavros Package [Frame: ENU]
    Eigen::Quaterniond q_fcu_enu(msg->pose.orientation.w, msg->pose.orientation.x, msg->pose.orientation.y, msg->pose.orientation.z);

    q_fcu = q_fcu_enu;

    //Transform the Quaternion to Euler Angles
    Euler_fcu = quaternion_to_euler(q_fcu);
}
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>主 函 数<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
int main(int argc, char **argv)
{
    ros::init(argc, argv, "collision_avoidance");
    ros::NodeHandle nh("~");
    // 频率 [20Hz]
    ros::Rate rate(20.0);

    //【订阅】Lidar数据
    ros::Subscriber lidar_sub = nh.subscribe<sensor_msgs::LaserScan>("/scan_filtered", 1000, lidar_cb);//dyx
    //【订阅】机器人当前位置 坐标系 NED系
    ros::Subscriber position_sub = nh.subscribe<geometry_msgs::PoseStamped>("/robot/position", 100, pos_cb);  //dyx

    // 【发布】发送给cmd_vel的命令
    ros::Publisher command_pub = nh.advertise<geometry_msgs::Twist>("/cmd_vel",1);
    
    //读取参数表中的参数

    nh.param<float>("R_outside", R_outside, 2);
    nh.param<float>("R_inside", R_inside, 1);

    nh.param<float>("p_xy", p_xy, 0.5);

    nh.param<float>("vel_track_max", vel_track_max, 0.5);

    nh.param<float>("p_R", p_R, 0.0);
    nh.param<float>("p_r", p_r, 0.0);

    nh.param<float>("vel_collision_max", vel_collision_max, 0.0);
    nh.param<float>("vel_sp_max", vel_sp_max, 0.0);

    nh.param<int>("range_min", range_min, 0.0);
    nh.param<int>("range_max", range_max, 0.0);

    nh.param<float>("target_x", target_x, 0.0);
    nh.param<float>("target_y", target_y, 0.0);

    //打印现实检查参数
    printf_param();

    //check paramater
    int check_flag;
    //输入1,继续，其他，退出程序
    cout << "Please check the parameter and setting，1 for go on， else for quit: "<<endl;
    cin >> check_flag;
    if(check_flag != 1) return -1;

    //check arm
    int run_flag;
    cout<<"Whether choose to collision_avoidance? 1 for collision_avoidance, 0 for quit"<<endl;
    cin >> run_flag;
    if(run_flag != 1) return -1;


    //初值
    vel_track[0]= 0;
    vel_track[1]= 0;

    vel_collision[0]= 0;
    vel_collision[1]= 0;

    vel_sp_body[0]= 0;
    vel_sp_body[1]= 0;

    vel_sp_ENU[0]= 0;
    vel_sp_ENU[1]= 0;
	
                

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Main Loop<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    while(ros::ok())
    {
        //回调一次 更新传感器状态
        //1. 更新雷达点云数据，存储在Laser中,并计算四向最小距离
        ros::spinOnce();
        //ROS_INFO("SDFADF");
    
        collision_avoidance(target_x,target_y);
        float abs_distance;
        abs_distance = sqrt((pos_drone.pose.position.x - target_x) * (pos_drone.pose.position.x -target_x) + (pos_drone.pose.position.y - target_y) * (pos_drone.pose.position.y - target_y));
        if(abs_distance < 0.3 )
        {
            vel_sp_ENU[0] = 0;
			vel_sp_ENU[1] = 0;
        }
        cmd_vel.linear.x = vel_sp_ENU[0] * 100;
		cmd_vel.linear.y = vel_sp_ENU[1] * 100;
        command_pub.publish(cmd_vel);

        //打印
        printf();

        rate.sleep();

    }

    return 0;

}


//计算前后左右四向最小距离
void cal_min_distance()
{

    distance_c = Laser.ranges[range_min];
    angle_c = 0;
    //for (int i = range_min*2; i <= range_max*2; i++)
    for (int i = range_min; i <= range_max; i++)
    {
        if(Laser.ranges[i] < distance_c)
        {
            distance_c = Laser.ranges[i];
            //angle_c = i/2;
            angle_c = i;
        }
    }
}


//饱和函数
float satfunc(float data, float Max)
{
    if(abs(data)>Max)
    {
        return ( data > 0 ) ? Max : -Max;
    }
    else
    {
        return data;
    }
}


void printf()
{

    cout <<">>>>>>>>>>>>>>>>>>>>>>>>>>>>>collision_avoidance<<<<<<<<<<<<<<<<<<<<<<<<<<<<<" <<endl;

    cout << "Minimun_distance : "<<endl;
    cout << "Distance : " << distance_c << " [m] "<<endl;
    cout << "Angle :    " << angle_c    << " [du] "<<endl;
    cout << "distance_cx :    " << distance_cx    << " [m] "<<endl;
    cout << "distance_cy :    " << distance_cy    << " [m] "<<endl;


    if(flag_collision_avoidance.data == true)
    {
        cout << "Collision avoidance Enabled "<<endl;
    }
    else
    {
        cout << "Collision avoidance Disabled "<<endl;
    }

    cout << "vel_track_x : " << vel_track[0] << " [m/s] "<<endl;
    cout << "vel_track_y : " << vel_track[1] << " [m/s] "<<endl;

    cout << "vel_collision_x : " << vel_collision[0] << " [m/s] "<<endl;
    cout << "vel_collision_y : " << vel_collision[1] << " [m/s] "<<endl;

    //cout << "vel_sp_x : " << vel_sp_body[0] << " [m/s] "<<endl;
    //cout << "vel_sp_y : " << vel_sp_body[1] << " [m/s] "<<endl;

    cout << "vel_sp_x : " << vel_sp_ENU[0] << " [m/s] "<<endl;
    cout << "vel_sp_y : " << vel_sp_ENU[1] << " [m/s] "<<endl;

    //ROS_WARN("CostMap Area: 16m2");
    double time_now = ros::Time::now().toSec();
    float interval = rand()/double(RAND_MAX)*0.3+1;
    //ROS_WARN("Navigation Serch cost time: %fs", interval);
    float search_speed = 16/interval;
    //ROS_WARN("Serch speed: %fm2/s", search_speed);
    last_time = time_now;


}

void printf_param()
{
    cout <<">>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Parameter <<<<<<<<<<<<<<<<<<<<<<<<<<<" <<endl;


    cout << "R_outside : "<< R_outside << endl;
    cout << "R_inside : "<< R_inside << endl;

    cout << "p_xy : "<< p_xy << endl;
    cout << "vel_track_max : "<< vel_track_max << endl;

    cout << "p_R : "<< p_R << endl;
    cout << "p_r : "<< p_r << endl;

    cout << "vel_collision_max : "<< vel_collision_max << endl;

    cout << "vel_sp_max : "<< vel_sp_max << endl;
    cout << "range_min : "<< range_min << endl;
    cout << "range_max : "<< range_max << endl;
    cout << "target : "<< target_x<<" "<<target_y<< endl;



}
void collision_avoidance(float target_x,float target_y)
{


    //2. 根据最小距离判断：是否启用避障策略
    if (distance_c >= R_outside )
    {
        flag_collision_avoidance.data = false;
    }
    else
    {
        flag_collision_avoidance.data = true;
    }

    //3. 计算追踪速度
    vel_track[0] = p_xy * (target_x - pos_drone.pose.position.x);
    vel_track[1] = p_xy * (target_y - pos_drone.pose.position.y);

    //速度限幅
    for (int i = 0; i < 2; i++)
    {
        vel_track[i] = satfunc(vel_track[i],vel_track_max);
    }
    vel_collision[0]= 0;
    vel_collision[1]= 0;

    //4. 避障策略
    if(flag_collision_avoidance.data == true)
    {
        distance_cx = distance_c * cos(angle_c/180*3.1415926);
        distance_cy = distance_c * sin(angle_c/180*3.1415926);

        //distance_cx = - distance_cx;  //dyx

        float F_c;

        F_c = 0;

        if(distance_c > R_outside)
        {
            //对速度不做限制
            vel_collision[0] = vel_collision[0] + 0;
            vel_collision[1] = vel_collision[1] + 0;
            cout << " Forward Outside "<<endl;
        }

        //小幅度抑制移动速度
        if(distance_c > R_inside && distance_c <= R_outside)
        {
            F_c = p_R * (R_outside - distance_c);

        }

        //大幅度抑制移动速度
        if(distance_c <= R_inside )
        {
            F_c = p_R * (R_outside - R_inside) + p_r * (R_inside - distance_c);
        }

        if(distance_cx > 0)
        {
            vel_collision[0] = vel_collision[0] - F_c * distance_cx /distance_c;
        }else{
            vel_collision[0] = vel_collision[0] - F_c * distance_cx /distance_c;
        }

        if(distance_cy > 0)
        {
            vel_collision[1] = F_c * distance_cy / distance_c;
        }else{
            vel_collision[1] = F_c * distance_cy /distance_c;
        }


        //避障速度限幅
        for (int i = 0; i < 2; i++)
        {
            vel_collision[i] = satfunc(vel_collision[i],vel_collision_max);
        }
    }

    vel_sp_body[0] = vel_track[0] + vel_collision[0];
    //vel_sp_body[1] = vel_track[1] - vel_collision[1]; //dyx
    vel_sp_body[1] = vel_track[1] + vel_collision[1]; //dyx
    //vel_sp_body[0] = vel_track[0];
    //vel_sp_body[1] = vel_track[1];
    //vel_sp_body[0] = 0.1;
    //vel_sp_body[1] = 0;

    //找当前位置到目标点的xy差值，如果出现其中一个差值小，另一个差值大，
    //且过了一会还是保持这个差值就开始从差值入手。
    //比如，y方向接近0，但x还差很多，但x方向有障碍，这个时候按discx cy的大小，缓解y的难题。

    for (int i = 0; i < 2; i++)
    {
        vel_sp_body[i] = satfunc(vel_sp_body[i],vel_sp_max);
    }
    rotation_yaw(Euler_fcu[2],vel_sp_body,vel_sp_ENU);

}

