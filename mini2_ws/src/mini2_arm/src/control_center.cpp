#include "../include/mini2_arm/control_center.h"
#include "../include/mini2_arm/mini2_arm.h"
#include <cmath>

int grab_flag = 0;
int get_cube_flag =0;
int loose_flag = 0;
int loose_cube_flag = 0 ;
int get_goal_flag = 0 ;
string cube_color;
void ControlCenter::initROSModule()
{
    reach_sign = false;
    arm_sub = nn.subscribe<std_msgs::String>("/arm_control", 100, &ControlCenter::arm_cb, this);
    cube_color_sub = nn.subscribe<std_msgs::String>("/cube_choose", 100, &ControlCenter::cube_color_cb, this);
    chat_pub =nn.advertise<std_msgs::String>("/robot_voice/tts_topic",1000);
    //odom_sub = nn.subscribe<nav_msgs::Odometry>("/odom", 10);
    cmd_pub = nn.advertise<geometry_msgs::Twist>("/cmd_vel",10);
    goal_pub = nn.advertise<geometry_msgs::PoseStamped>("/move_base_simple/goal",10);
    status_sub = nn.subscribe<actionlib_msgs::GoalStatusArray>("/move_base/status",10,&ControlCenter::status_cb,this);
    ROS_INFO("Init Mini2 Arm!!!!");
    char portname[20];
    sprintf(portname,"/dev/arm");
    arm.init(portname, 115200);
    arm.armSetZeroCal();
    ros::Duration(10.0).sleep();
    arm.armSetValve(true);
    ros::Duration(2.0).sleep();
    arm.armSetPump(false);

    exec_timer_ = nn.createTimer(ros::Duration(0.05), &ControlCenter::execCallback, this);
}

void ControlCenter::status_cb(const actionlib_msgs::GoalStatusArray::ConstPtr &msg)
{
    movebase_state = *msg;
    if(movebase_state.status_list.size() == 0 ) return;
    if(movebase_state.status_list[0].status == 3)
    {
        reach_sign = true;
        get_goal_flag = 1 ;
    }
    else reach_sign = false;
}

void ControlCenter::arm_cb(const std_msgs::String::ConstPtr &msg)
{       
    std::string dataString = msg->data;
    if(dataString.compare("grab") == 0)
    {
        grab_flag = 1;
    }
    if(dataString.compare("loose") == 0)
    {
        loose_flag = 1;
    }
    
    //grab_flag = 1;   
}

void ControlCenter::cube_color_cb(const std_msgs::String::ConstPtr &msg)
{       
    std::string dataString = msg->data;
    if(dataString.compare("red") == 0)
    {
        cube_color="红色运输完成";
    }
    if(dataString.compare("green") == 0)
    {
        cube_color ="绿色运输完成";
    } 
    if(dataString.compare("blue") == 0)
    {
        cube_color ="蓝色运输完成";
    } 
}

void ControlCenter::try_pick()
{
        ROS_INFO("Move to grab pose!!!!!");
        int init_pos[3] = {0, 6000, 0};
        arm.armSetAbsSteps(init_pos);
        ros::Duration(3.0).sleep();
        int init_1_pos[3] = {0, 6000, -3500};
        arm.armSetAbsSteps(init_1_pos);
        ros::Duration(3.0).sleep();
        ROS_INFO("Grab woods!!!!!!");
        arm.armSetPump(true);
        ros::Duration(2.0).sleep();
        arm.armSetValve(false);
        ros::Duration(2.0).sleep();
        //arm.armSetPump(false);
        //ros::Duration(2.0).sleep();
        ROS_INFO("Move to end pos!!!!!!");
        int end_pos[3] = {0, 6000, 0};
        arm.armSetAbsSteps(end_pos);
        ros::Duration(3.0).sleep();  
        get_cube_flag=1;
        //grab = true;
}

void ControlCenter::try_loose()
{
        ROS_INFO("Release Woods!!!!!");
        int release_pos[3] = {0, 6000, -3500};
        arm.armSetAbsSteps(release_pos);
        ros::Duration(2.0).sleep();
        arm.armSetValve(true);
        ros::Duration(2.0).sleep();
        arm.armSetPump(false);
        ros::Duration(2.0).sleep();
        int release_pos1[3] = {0, 6000, 0};
        arm.armSetAbsSteps(release_pos1);
        loose_cube_flag=1;
}

void ControlCenter::execCallback(const ros::TimerEvent& e)
{    
    if (grab_flag==1 && get_cube_flag==0)
    {
        //pointToWoods();
        try_pick();
        geometry_msgs::Twist cmd_vel;
        cmd_vel.linear.x=-0.05;
        cmd_pub.publish(cmd_vel);
        ros::Duration(2.0).sleep();
        cmd_vel.linear.x=0;
        cmd_pub.publish(cmd_vel);
        geometry_msgs::PoseStamped A_goal;
        A_goal.header.frame_id = "map";
        A_goal.header.stamp = ros::Time::now();
        A_goal.pose.position.x = 2.27;
        A_goal.pose.position.y = 0.47;
        A_goal.pose.orientation.x = 0;
        A_goal.pose.orientation.y = 0;
        A_goal.pose.orientation.z = -0.693;
        A_goal.pose.orientation.w = 0.72;
        goal_pub.publish(A_goal);
        ros::Duration(3.0).sleep();
       
    }

    else if  (loose_flag==1 && get_cube_flag==1 && loose_cube_flag==0)
    {
        try_loose();
    }
    else if  (get_goal_flag == 1  && get_cube_flag==1  && loose_cube_flag==0 )
    {
        try_loose();
        std_msgs::String msg;
	  	//std::stringstream ss;
	 	//ss<<"红色运输完成";
	 	//msg.data=ss.str();
        msg.data=cube_color;
	 	chat_pub.publish(msg);
    }
    else
    {
       ROS_INFO("Moving to loose position!!!!!");
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
