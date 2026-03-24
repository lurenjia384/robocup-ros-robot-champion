#include <ros/ros.h>
#include <actionlib_msgs/GoalStatusArray.h>
#include <math.h>
#include <cmath>

#include <geometry_msgs/Twist.h>
#include <geometry_msgs/PoseStamped.h>
#include <std_msgs/String.h>
#include <nav_msgs/Odometry.h>

#include <eigen3/Eigen/Core>
#include <eigen3/Eigen/Geometry>
#include <tf_conversions/tf_eigen.h>
#include <tf2_msgs/TFMessage.h>
#include <tf/transform_listener.h>

using namespace std;

class Navigation{

public:
    Navigation(ros::NodeHandle& nh) : nh(nh){}
    ~Navigation(){}
    void initROSModule(){
        nh.param<float>("A_x", A[0], 0.0);
        nh.param<float>("A_y", A[1], 0.0);
        nh.param<float>("B_x", B[0], 0.0);
        nh.param<float>("B_y", B[1], 0.0);

        pub_A = false;
        pub_B = false;
        grab_A = false;
        grab_B = false;

        start_nav = false;

        status_sub = nh.subscribe<actionlib_msgs::GoalStatusArray>("/move_base/status",10,&Navigation::status_cb, this);
        nav_sub = nh.subscribe<std_msgs::String>("/robot_voice/nav_topic", 10, &Navigation::nav_cb, this);
        pos_sub = nh.subscribe<tf2_msgs::TFMessage>("/tf",1000,&Navigation::pose_cb,this);
        exec_timer = nh.createTimer(ros::Duration(0.05),&Navigation::execCallback,this);

        goal_pub = nh.advertise<geometry_msgs::PoseStamped>("/move_base_simple/goal",10);
        chat_pub = nh.advertise<std_msgs::String>("/robot_voice/tts_topic", 1000);
    }

private:
    ros::NodeHandle nh;
    ros::Publisher pose_pub, chat_pub, goal_pub;
    ros::Subscriber status_sub, vision_sub, pos_sub, odom_sub, nav_sub;
    ros::Timer exec_timer;
    Eigen::Vector2f A,B;

    float current_target_X;
    float current_target_Y;
    float current_target_Yaw;

    Eigen::Vector3d base_pos;
    float base_yaw;
    bool start_nav;
    bool pub_A, pub_B;
    bool grab_A, grab_B;

    actionlib_msgs::GoalStatusArray move_base_state;
    tf::TransformListener pose_listener;
    bool reach_sign;
    float quaternion_to_yaw(const Eigen::Quaterniond &q){
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

    void status_cb(const actionlib_msgs::GoalStatusArray::ConstPtr &msg){
        move_base_state = *msg;
        if( move_base_state.status_list.size() == 0)return;
        if( move_base_state.status_list[0].status == 3){
            reach_sign = true;
        }
        else reach_sign = false;
    }

    void nav_cb(const std_msgs::String::ConstPtr &msg){
        start_nav = true;
    }

    void pose_cb(const tf2_msgs::TFMessage::ConstPtr &msg){
        tf::StampedTransform transform;
        try{
            pose_listener.lookupTransform("map", "base_link", ros::Time(0), transform); 
        }catch(tf::TransformException &ex){
            //ROS_INFO("Couldnt get transform");
            return;
        }
        base_pos[0] = transform.getOrigin().x();
        base_pos[1] = transform.getOrigin().y();
        base_pos[2] = transform.getOrigin().z();

        Eigen::Quaterniond q;
        tf::quaternionTFToEigen(transform.getRotation(),q);
        base_yaw = quaternion_to_yaw(q);    
    }

    bool close_enough(){
        float abs_distance;
        abs_distance = sqrt((base_pos[0]-current_target_X)*(base_pos[0]-current_target_X) + (base_pos[1]-current_target_Y)*(base_pos[1]-current_target_Y));
        if (abs_distance <= 0.03)
            return true;
        else
            return false;
    }

    void grab_and_get( int i){
        std_msgs::String msg;
	  	std::stringstream ss;
        if (i == 0) {
            ss<<"到达目标点A";
            grab_A = true;
        }
        else if (i == 1){
            ss<<"到达目标点B";
            grab_B = true;
        } 
	 	msg.data=ss.str();
	 	chat_pub.publish(msg);
    }

    void execCallback(const ros::TimerEvent& e){
        if (start_nav == false) return;
        if (!pub_A && !grab_A )
        {
            ROS_INFO("Exec mission to A");

            current_target_X = A[0];
            current_target_Y = A[1];

            geometry_msgs::PoseStamped A_goal;
            A_goal.header.frame_id = "map";
            A_goal.header.stamp = ros::Time::now();
            A_goal.pose.position.x = A[0];
            A_goal.pose.position.y = A[1];
            A_goal.pose.orientation.x = 0;
            A_goal.pose.orientation.y = 0;
            A_goal.pose.orientation.z = 0;
            A_goal.pose.orientation.w = 1.0;
            goal_pub.publish(A_goal);
            pub_A = true;            
        }

        if (grab_A && !pub_B)
        {
            ROS_INFO("Exec mission to B");

            current_target_X = B[0];
            current_target_Y = B[1];

            geometry_msgs::PoseStamped B_goal;
            B_goal.header.frame_id = "map";
            B_goal.header.stamp = ros::Time::now();
            B_goal.pose.position.x = B[0];
            B_goal.pose.position.y = B[1];
            B_goal.pose.orientation.x = 0;
            B_goal.pose.orientation.y = 0;
            B_goal.pose.orientation.z = 0;
            B_goal.pose.orientation.w = 1.0;
            goal_pub.publish(B_goal);
            pub_B = true;          
        }

        if(!reach_sign) return;

        cout<<"==============================="<<endl;
        cout<<"base yaw: "<<base_yaw*180/M_PI<<endl;

        if( !grab_A ){
            grab_and_get(0);
        }
        else if (!grab_B){
            grab_and_get(1);
        }

    }
    /*
    void execCallback(const ros::TimerEvent& e){
    if (start_nav == false) return;

    if (!pub_A && !grab_A )
    {
        ROS_INFO("Exec mission to A");

        current_target_X = A[0];
        current_target_Y = A[1];

        geometry_msgs::PoseStamped A_goal;
        A_goal.header.frame_id = "map";
        A_goal.header.stamp = ros::Time::now();
        A_goal.pose.position.x = A[0];
        A_goal.pose.position.y = A[1];

        float target_yaw = atan2(A[1] - base_pos[1], A[0] - base_pos[0]);
        tf::Quaternion q = tf::createQuaternionFromYaw(target_yaw);
        A_goal.pose.orientation.x = q.x();
        A_goal.pose.orientation.y = q.y();
        A_goal.pose.orientation.z = q.z();
        A_goal.pose.orientation.w = q.w();

        goal_pub.publish(A_goal);
        pub_A = true;            
    }

    if (grab_A && !pub_B)
    {
        ROS_INFO("Exec mission to B");

        current_target_X = B[0];
        current_target_Y = B[1];

        geometry_msgs::PoseStamped B_goal;
        B_goal.header.frame_id = "map";
        B_goal.header.stamp = ros::Time::now();
        B_goal.pose.position.x = B[0];
        B_goal.pose.position.y = B[1];

        float target_yaw = atan2(B[1] - base_pos[1], B[0] - base_pos[0]);
        tf::Quaternion q = tf::createQuaternionFromYaw(target_yaw);
        B_goal.pose.orientation.x = q.x();
        B_goal.pose.orientation.y = q.y();
        B_goal.pose.orientation.z = q.z();
        B_goal.pose.orientation.w = q.w();

        goal_pub.publish(B_goal);
        pub_B = true;          
    }

    if(!reach_sign) return;

    cout<<"==============================="<<endl;
    cout<<"base yaw: "<<base_yaw*180/M_PI<<endl;

    if( !grab_A ){
        grab_and_get(0);
    }
    else if (!grab_B){
        grab_and_get(1);
    }
}

    */
};

int main(int argc, char** argv){
    ros::init(argc, argv, "navigation_node");
    ros::NodeHandle nh("~");
    Navigation navigation(nh);
    navigation.initROSModule();
    ros::spin();
    return 0;
}
