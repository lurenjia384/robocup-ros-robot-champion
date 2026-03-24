//头文件
#include <ros/ros.h>

#include <iostream>
#include <Eigen/Eigen>
//msg 头文件
#include <geometry_msgs/Vector3.h>
#include <geometry_msgs/TwistStamped.h>
#include <geometry_msgs/PoseStamped.h>
#include <nav_msgs/Odometry.h>
#include <std_msgs/Bool.h>
#include <geometry_msgs/Pose.h>
#include <geometry_msgs/Vector3Stamped.h>
#include <geometry_msgs/Point.h>
#include <std_msgs/UInt16.h>
#include <std_msgs/Int16.h>
#include <std_msgs/Float64.h>
#include <tf2_msgs/TFMessage.h>
#include <geometry_msgs/TransformStamped.h>
#include <math_utils.h>

#include <geometry_msgs/PoseWithCovarianceStamped.h>

using namespace std;
//---------------------------------------相关参数-----------------------------------------------
bool ready_for_pub = false;

//---------------------------------------laser定位相关------------------------------------------
Eigen::Vector3d pos_drone_laser;                          //机器人当前位置 (laser)
Eigen::Quaterniond q_laser;
Eigen::Vector3d Euler_laser;                                         //机器人当前姿态(laser)

geometry_msgs::TransformStamped laser;                          //当前时刻cartorgrapher发布的数据
geometry_msgs::TransformStamped laser_last;

//---------------------------------------发布相关变量--------------------------------------------
geometry_msgs::PoseStamped position;
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>函数声明<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
float get_dt(ros::Time last);                                                        //获取时间间隔
void printf_info();     
void pose_pub_timer_cb(const ros::TimerEvent& TE);                        //ros::Timer的回调函数                                                                  //打印函数
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>回调函数<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
void laser_cb(const tf2_msgs::TFMessage::ConstPtr& msg)
{
    //确定是cartographer发出来的/tf信息
    //有的时候/tf这个消息的发布者不止一个
    //if (msg->transforms[0].header.frame_id == "map")//dyx  carto_odom
    //if (msg->transforms.size()>1 && msg->transforms[1].header.frame_id == "carto_odom")
    if (msg->transforms.size()>1 && msg->transforms[1].header.frame_id == "odom")
    {
        laser = msg->transforms[1];
        //laser = msg->transforms[0];

        float dt_laser;

        dt_laser = (laser.header.stamp.sec - laser_last.header.stamp.sec) + (laser.header.stamp.nsec - laser_last.header.stamp.nsec)/10e9;

        //这里需要做这个判断是因为cartographer发布位置时有一个小bug，ENU到NED不展开讲。
        if (dt_laser != 0)
        {
            //位置 xy  [将解算的位置从laser坐标系转换至ENU坐标系]???
            pos_drone_laser[0]  = laser.transform.translation.x;
            pos_drone_laser[1]  = laser.transform.translation.y;

            // Read the Quaternion from the Carto Package [Frame: Laser[ENU]]
            Eigen::Quaterniond q_laser_enu(laser.transform.rotation.w, laser.transform.rotation.x, laser.transform.rotation.y, laser.transform.rotation.z);

            q_laser = q_laser_enu;

            // Transform the Quaternion to Euler Angles
            Euler_laser = quaternion_to_euler(q_laser);
        }
        laser_last = laser;
    }
}


//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>主 函 数<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
int main(int argc, char **argv)
{
    ros::init(argc, argv, "robot_pos_estimator");
    ros::NodeHandle nh("~");
    // 【订阅】cartographer估计位置
    ros::Subscriber laser_sub = nh.subscribe<tf2_msgs::TFMessage>("/tf", 300, laser_cb);

    ros::Publisher pos_pub = nh.advertise<geometry_msgs::PoseStamped>("/robot/position", 100);

    ros::Timer pose_pub_timer = nh.createTimer(ros::Duration(1.0/20.0),pose_pub_timer_cb);
    // 频率
    ros::Rate rate(20.0);

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Main Loop<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    while(ros::ok())
    {
        //回调一次 更新传感器状态
        ros::spinOnce();
        if(ready_for_pub)
        {
          pos_pub.publish(position);
          ready_for_pub = false;
          printf_info();
        }
        rate.sleep();
    }
    return 0;
}

void pose_pub_timer_cb(const ros::TimerEvent& TE)
{

    position.pose.position.x = pos_drone_laser[0];
    position.pose.position.y = pos_drone_laser[1];
    position.pose.position.z = 0;

    position.pose.orientation.x = q_laser.x();
    position.pose.orientation.y = q_laser.y();
    position.pose.orientation.z = q_laser.z();
    position.pose.orientation.w = q_laser.w();
    position.header.stamp = TE.current_real;
    ready_for_pub = true;
}

//获取当前时间 单位：秒
float get_dt(ros::Time last)
{
    ros::Time time_now = ros::Time::now();
    float currTimeSec = time_now.sec-last.sec;
    float currTimenSec = time_now.nsec / 1e9 - last.nsec / 1e9;
    return (currTimeSec + currTimenSec);
}

void printf_info()
{
    cout <<">>>>>>>>>>>>>>>>>>>>>>>>UAV_POS_ESTIMATOR<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<" <<endl;

    //固定的浮点显示
    cout.setf(ios::fixed);
    //setprecision(n) 设显示小数精度为n位
    cout<<setprecision(2);
    //左对齐
    cout.setf(ios::left);
    // 强制显示小数点
    cout.setf(ios::showpoint);
    // 强制显示符号
    cout.setf(ios::showpos);
    cout << "Pos_laser [X Y] : " << position.pose.position.x << " [ m ] "<< position.pose.position.y <<" [ m ] "<<endl;
    cout << "Euler_vlaser[Yaw] : " << Euler_laser[2] * 180/M_PI<<" [deg]  "<<endl;
}

