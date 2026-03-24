#include "../include/mini2_arm/control_center.h"
#include "../include/mini2_arm/mini2_arm.h"
#include <cmath>


void ControlCenter::initROSModule()
{
    nn.param<float>("PID_Control_P", PID_Control_P, 0.5);
    nn.param<float>("Max_yaw_vel", Max_yaw_vel, 0.2);
    nn.param<float>("Yaw_th", yaw_th, 0.02);
    nn.param<string>("Port_name", portName, "/dev/arm");
    nn.param<int>("target_id", target_id, 0);
    switch (target_id)
    {
    case 0:
        nn.param<float>("A_0_x", A[0], 0.0);
        nn.param<float>("A_0_y", A[1], 0.0);
        nn.param<float>("A_0_yaw", A_yaw, 0.0);
        break;
    case 1:
        nn.param<float>("A_1_x", A[0], 0.0);
        nn.param<float>("A_1_y", A[1], 0.5);
        nn.param<float>("A_1_yaw", A_yaw, 0.0);
    case 2:
        nn.param<float>("A_2_x", A[0], 0.0);
        nn.param<float>("A_2_y", A[1], 0.0);
        nn.param<float>("A_2_yaw", A_yaw, 0.0);
    default:
        break;
    }

    nn.param<float>("B_x", B[0], 0.0);
    nn.param<float>("B_y", B[1], 0.0);
    nn.param<float>("B_yaw", B_yaw, 0.0);

    start_move = false;
    pub_A = reach_A = grab = false;
    pub_B = reach_B = release = false;

    status_sub = nn.subscribe<actionlib_msgs::GoalStatusArray>("/move_base/status",10,&ControlCenter::status_cb,this);
    pos_sub = nn.subscribe<tf2_msgs::TFMessage>("/tf",1000,&ControlCenter::pos_cb,this);
    voice_sub = nn.subscribe<std_msgs::String>("/cube_choose", 100, &ControlCenter::voice_cb, this);
    camera_sub = nn.subscribe<geometry_msgs::Point>("/cube_target", 1000, &ControlCenter::camera_cb, this);
    odom_sub = nn.subscribe<nav_msgs::Odometry>("/odom", 1000, &ControlCenter::odom_cb, this);

    cmd_pub = nn.advertise<geometry_msgs::Twist>("/cmd_vel",10);
    goal_pub = nn.advertise<geometry_msgs::PoseStamped>("/move_base_simple/goal",10);
    grab_pub = nn.advertise<std_msgs::String>("/grab",10); 

    ROS_INFO("Init Mini2 Arm!!!!");
    char portname[20];
    sprintf(portname,"/dev/arm");
    arm.init(portname, 115200);
    arm.armSetZeroCal();
    ros::Duration(10.0).sleep(); 

    exec_timer_ = nn.createTimer(ros::Duration(0.05), &ControlCenter::execCallback, this);
}

float ControlCenter::quaternion_to_yaw(const Eigen::Quaterniond &q)
{
    float quat[4];
    quat[0] = q.w();
    quat[1] = q.x();
    quat[2] = q.y();
    quat[3] = q.z();

    Eigen::Vector3d ans;
    ans[0] = atan2(2.0 * (quat[3] * quat[2] + quat[0] * quat[1]), 1.0 - 2.0 * (quat[1] * quat[1] + quat[2] * quat[2]));
    ans[1] = asin(2.0 * (quat[2] * quat[0] - quat[3] * quat[1]));
    ans[2] = atan2(2.0 * (quat[3] * quat[0] + quat[1] * quat[2]), 1.0 - 2.0 * (quat[2] * quat[2] + quat[3] * quat[3]));
    return ans[2];
}

Eigen::Quaterniond ControlCenter::quaternion_from_euler(float roll, float pitch, float yaw)
{
    Eigen::Quaterniond q;
    geometry_msgs::Quaternion qt;
    qt = tf::createQuaternionMsgFromRollPitchYaw(roll,pitch,yaw);
    q.w() = qt.w;
    q.x() = qt.x;
    q.y() = qt.y;
    q.z() = qt.z;
    return q;
}

void ControlCenter::status_cb(const actionlib_msgs::GoalStatusArray::ConstPtr &msg)
{
    movebase_state = *msg;
    if(movebase_state.status_list.size() == 0 ) return;
    if(movebase_state.status_list[0].status == 3)
    {
        reach_sign = true;
    }
    else reach_sign = false;
}

void ControlCenter::voice_cb(const std_msgs::String::ConstPtr &msg)
{   
    /*
    std::string dataString = msg->data;
    if(dataString.compare("开始导航。") == 0)
    {
        start_move = true;
    } 
    */
    start_move = true;   
}

void ControlCenter::camera_cb(const geometry_msgs::Point::ConstPtr &msg)
{
    obj_pos[0] = msg->x;
    obj_pos[1] = msg->y;
    obj_pos[2] = msg->z; 
    if (obj_pos[0] != 0)
    {
        marker_found = true;
    }   
}

void ControlCenter::pos_cb(const tf2_msgs::TFMessage::ConstPtr &msg)
{
    tf::StampedTransform transform;
    try{
        pos_listener.lookupTransform("map","base_link",ros::Time(0),transform);
    }
    catch (tf::TransformException &ex)
    {
        //ROS_INFO("Couldn't get transform");
        //ROS_WARN("%s",ex.what());
        return;
    }
    base_pos[0] = transform.getOrigin().x();
    base_pos[1] = transform.getOrigin().y();
    base_pos[2] = transform.getOrigin().z();
    Eigen::Quaterniond q;
    tf::quaternionTFToEigen(transform.getRotation(),q);
    base_yaw = quaternion_to_yaw(q);
    //cout<<"X: "<<base_pos[0]<<" Y: "<<base_pos[1]<<" Yaw: "<<base_yaw<<endl;
}

void ControlCenter::odom_cb(const nav_msgs::Odometry::ConstPtr &msg)
{
    angle_vel = msg->twist.twist.linear.y;
}

float ControlCenter::satfunc(float data, float Max)
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

void ControlCenter::publishYawvel(float dyaw)
{
    geometry_msgs::Twist cmd_vel;
    float yaw_vel =  satfunc(PID_Control_P*dyaw,Max_yaw_vel);
    //cout<<"Max: "<<Max_yaw_vel<<endl;
    //cout<<"~~~~~~~~~"<<endl;
    //cout<<"yaw vel: "<<yaw_vel*180/M_PI<<endl;
    cmd_vel.angular.z = yaw_vel;
    cmd_pub.publish(cmd_vel);
}

void ControlCenter::publishYvel(float vel)
{
    geometry_msgs::Twist cmd_vel;
    float y_vel =  satfunc(PID_Control_P*vel,Max_yaw_vel);
    //cout<<"Max: "<<Max_yaw_vel<<endl;
    //cout<<"~~~~~~~~~"<<endl;
    //cout<<"yaw vel: "<<yaw_vel*180/M_PI<<endl;
    cmd_vel.linear.y = vel;
    cmd_pub.publish(cmd_vel);   
}

void ControlCenter::publishStop()
{
    geometry_msgs::Twist cmd_vel;
    cmd_pub.publish(cmd_vel);
}

bool ControlCenter::reach_grab_point()
{
    float abs_distance, abs_yaw;
    abs_distance = sqrt((A[0]-base_pos[0])*(A[0]-base_pos[0]) + (A[1]-base_pos[1])*(A[1]-base_pos[1]));
    abs_yaw = abs(base_yaw);
    if (abs_distance<0.1 && abs_yaw<0.1)
    {
        reach_A = true;
    }
}

void ControlCenter::pointToWoods()
{
    publishYvel(0.2);
    /*
    if (!marker_found)
    {
        publishYvel(0.2);
    }
    else
    {
        float dyaw = obj_pos[0];
        if(abs(dyaw) > yaw_th)
        {
            publishYvel(satfunc(-PID_Control_P * dyaw, 0.2));
            cout<<"dyaw: "<<dyaw<<endl;
        }
        else
        {
            publishStop();
            cout<<"angel_vel: "<<angle_vel<<endl;
        //TODO:odom twist angle z < 0.000x
            if(abs(angle_vel)<vel_th)
            {
                cout<<"angel_vel: "<<angle_vel<<endl;
                try_pick();
            }
        }
    } 
    */   
}

void ControlCenter::try_pick()
{
        ROS_INFO("Move to grab pose!!!!!");
        int init_pos[3] = {0, 6400, 0};
        arm.armSetAbsSteps(init_pos);
        ros::Duration(3.0).sleep();
        int init_1_pos[3] = {0, 6400, -8000};
        arm.armSetAbsSteps(init_1_pos);
        ros::Duration(3.0).sleep();
        ROS_INFO("Grab woods!!!!!!");
        arm.armSetPump(true);
        ros::Duration(2.0).sleep();
        arm.armSetValve(false);
        ros::Duration(2.0).sleep();

        ROS_INFO("Move to end pos!!!!!!");
        int end_pos[3] = {0, 6400, 0};
        arm.armSetAbsSteps(end_pos);
        ros::Duration(3.0).sleep();  
        
        //grab = true;
}

void ControlCenter::try_loose()
{
        ROS_INFO("Release Woods!!!!!");
        int release_pos[3] = {0, 2000, -8000};
        arm.armSetAbsSteps(release_pos);
        ros::Duration(2.0).sleep();
        arm.armSetValve(true);
        ros::Duration(2.0).sleep();
        arm.armSetPump(false);
        ros::Duration(2.0).sleep();
}

void ControlCenter::execCallback(const ros::TimerEvent& e)
{   
    if (!start_move) return;
    if (!grab)
    {
        pointToWoods();
    }
    /*
    if (!grab)
    {
        try_pick();
        ros::Duration(10.0).sleep();
        try_loose();
        ros::Duration(10.0).sleep();
    }
    */
    /*
    if (!pub_A && !grab)
    {  
        ROS_INFO("Moving to grab woods at X: %f, Y:%f, Yaw: %f......", A[0], A[1], A_yaw);
        geometry_msgs::PoseStamped A_goal;
        A_goal.header.frame_id = "map";
        A_goal.header.stamp = ros::Time::now();
        A_goal.pose.position.x = A[0];
        A_goal.pose.position.y = A[1];
        Eigen::Quaterniond A_q = quaternion_from_euler(0.0, 0.0, A_yaw);
        A_goal.pose.orientation.x = A_q.x();
        A_goal.pose.orientation.y = A_q.y();
        A_goal.pose.orientation.z = A_q.z();
        A_goal.pose.orientation.w = A_q.w();
        goal_pub.publish(A_goal);
        pub_A = true;
    }
    */
    if (grab && !pub_B && !release)
    {
        ROS_INFO("Moving to release woods at X: %f, Y:%f, Yaw: %f......", B[0], B[1], B_yaw);
        geometry_msgs::PoseStamped B_goal;
        B_goal.header.frame_id = "map";
        B_goal.header.stamp = ros::Time::now();
        B_goal.pose.position.x = B[0];
        B_goal.pose.position.y = B[1];
        Eigen::Quaterniond B_q = quaternion_from_euler(0.0, 0.0, B_yaw);
        B_goal.pose.orientation.x = B_q.x();
        B_goal.pose.orientation.y = B_q.y();
        B_goal.pose.orientation.z = B_q.z();
        B_goal.pose.orientation.w = B_q.w();
        goal_pub.publish(B_goal);
        pub_B = true;        
    }

    if (!reach_sign) return;
    
    if (pub_A && !grab)
    {
        //pointToWoods();
        try_pick();
    }

    if (pub_B && !release)
    {
        try_loose();
    }
}


int main(int argc, char** argv)
{
    ros::init(argc,argv,"control_center");
    ros::NodeHandle nh("~");
    ControlCenter control_center(nh);
    control_center.initROSModule();
    ros::spin();
    return 0;

}
