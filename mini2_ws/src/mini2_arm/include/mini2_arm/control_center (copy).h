#ifndef CONTROL_CENTER_H
#define CONTROL_CENTER_H

#include "mini2_arm.h"
#include "ros/ros.h"
#include <math.h>

#include <geometry_msgs/Point.h>
#include <geometry_msgs/Twist.h>
#include <geometry_msgs/PoseStamped.h>
#include <std_msgs/String.h>
#include <nav_msgs/Odometry.h>
#include <actionlib_msgs/GoalStatusArray.h>
#include <tf2_msgs/TFMessage.h>
#include <tf/transform_listener.h>
#include <eigen3/Eigen/Core>
#include <eigen3/Eigen/Geometry>
#include <tf_conversions/tf_eigen.h>
#include <tf/tf.h>

using namespace std;

class ControlCenter{

public:
    ControlCenter(ros::NodeHandle& nh):nn(nh){}
    ~ControlCenter(){}
    void initROSModule();

private:
    string portName;
    float PID_Control_P;
    float Max_yaw_vel;
    float yaw_th;
    float vel_th;
    int target_id;
    Eigen::Vector2f A,B;
    float A_yaw, B_yaw;
    Eigen::Vector3d target_can_pose;
    Eigen::Vector3d base_pos;
    Eigen::Vector3d obj_pos;
    float angle_vel;
    float base_yaw;
    actionlib_msgs::GoalStatusArray movebase_state;
    tf::TransformListener ar_listener,pos_listener;
    bool reach_sign;

    bool start_move;

    bool pub_A, reach_A;
    bool grab;

    bool pub_B, reach_B;
    bool release;

    bool marker_found = false;

    ros::NodeHandle nn;
    ros::Subscriber status_sub, camera_sub, pos_sub, odom_sub, voice_sub;
    ros::Publisher cmd_pub, goal_pub, grab_pub, loose_pub;
    ros::Timer exec_timer_;

    Mini2_ARM arm;

    float quaternion_to_yaw(const Eigen::Quaterniond &q);
    Eigen::Quaterniond quaternion_from_euler(float roll, float pitch, float yaw);
    void status_cb(const actionlib_msgs::GoalStatusArray::ConstPtr &msg);
    void pos_cb(const tf2_msgs::TFMessage::ConstPtr &msg);
    void odom_cb(const nav_msgs::Odometry::ConstPtr &msg);
    void voice_cb(const std_msgs::String::ConstPtr &msg);
    void camera_cb(const geometry_msgs::Point::ConstPtr &msg);
    float satfunc(float data, float Max);
    void publishYawvel(float dyaw);
    void publishYvel(float vel);
    void publishStop();
    void pointToWoods();
    
    void execCallback(const ros::TimerEvent& e);
    bool reach_grab_point();

    void try_pick();
    void try_loose();
};

#endif