#include "../include/mini2_arm/control_center.h"
#include "../include/mini2_arm/mini2_arm.h"
#include <cmath>

int grab_flag = 0;
int get_cube_flag =0;
int loose_flag = 0;
int loose_cube_flag = 0 ;
void ControlCenter::initROSModule()
{

    arm_sub = nn.subscribe<std_msgs::String>("/arm_control", 100, &ControlCenter::arm_cb, this);
    //camera_sub = nn.subscribe<geometry_msgs::Point>("/cube_target", 1000, &ControlCenter::camera_cb, this);
    //arm_sub = nn.subscribe<std_msgs::String>("arm_control",10, &ControlCenter::arm_cb, this); 
    //voice_sub = nn.subscribe<std_msgs::String>("/cube_choose", 100, &ControlCenter::voice_cb, this);

    ROS_INFO("Init Mini2 Arm!!!!");
    char portname[20];
    sprintf(portname,"/dev/arm");
    arm.init(portname, 115200);
    arm.armSetZeroCal();
    ros::Duration(10.0).sleep(); 

    exec_timer_ = nn.createTimer(ros::Duration(0.05), &ControlCenter::execCallback, this);
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


void ControlCenter::try_pick()
{
        ROS_INFO("Move to grab pose!!!!!");
        int init_pos[3] = {0, 6400, 0};
        arm.armSetAbsSteps(init_pos);
        ros::Duration(3.0).sleep();
        int init_1_pos[3] = {0, 6400, -4000};
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
        int end_pos[3] = {0, 6400, 0};
        arm.armSetAbsSteps(end_pos);
        ros::Duration(3.0).sleep();  
        get_cube_flag=1;
        //grab = true;
}

void ControlCenter::try_loose()
{
        ROS_INFO("Release Woods!!!!!");
        int release_pos[3] = {0, 6400, -4000};
        arm.armSetAbsSteps(release_pos);
        ros::Duration(2.0).sleep();
        arm.armSetValve(true);
        ros::Duration(2.0).sleep();
        arm.armSetPump(false);
        ros::Duration(2.0).sleep();
        int release_pos1[3] = {0, 6400, 0};
        arm.armSetAbsSteps(release_pos1);
        loose_cube_flag=1;
}

void ControlCenter::execCallback(const ros::TimerEvent& e)
{    
    if (grab_flag==1 && get_cube_flag==0)
    {
        //pointToWoods();
        try_pick();
    }

    else if  (loose_flag==1 && get_cube_flag==1 && loose_cube_flag==0)
    {
        try_loose();
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
