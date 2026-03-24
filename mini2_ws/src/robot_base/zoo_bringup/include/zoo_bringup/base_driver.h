#include <ros/ros.h>

#include <boost/shared_ptr.hpp>
#include "base_driver_config.h"


#include <geometry_msgs/Twist.h>
#include <tf/transform_broadcaster.h>
#include <nav_msgs/Odometry.h>
#include <std_msgs/Int16.h>
#include <std_msgs/Int32.h>
#include "zoo_bringup/transport.h"
#include "zoo_bringup/dataframe.h"
#include </home/bcsh/mini2_ws/devel/include/zoo_imu/RawImu.h>
#include <zoo_imu/Sensor.h>

class BaseDriver
{
private:
  BaseDriver();

public:
  static BaseDriver* Instance()
  {
    if (instance == NULL)
      instance = new BaseDriver();

    return instance;
  }
  ~BaseDriver();
  void work_loop();
private:
  void cmd_vel_callback(const geometry_msgs::Twist& vel_cmd);
  //void correct_pos_callback(const std_msgs::Float32MultiArray& pos);
  void init_cmd_odom();
  void init_pid_debug();
  void init_imu();
  void read_param();

  void update_param();
  //void update_encoder();
  void update_odom();
  void update_speed();
  void update_pid_debug();
  void update_imu();
////////////////////////////////////////////////  
  void reset_plant();
  void get_plant();
  void set_rgb();
  void get_sensor();
  void enable_motor();
  void get_voltage();
 /////////////////////////////////////////// 
  

public:

  BaseDriverConfig& getBaseDriverConfig(){
    return bdg;
  }

  ros::NodeHandle* getNodeHandle(){
    return &nh;
  }

  ros::NodeHandle* getPrivateNodeHandle(){
    return &pn;
  }
private:
  static BaseDriver* instance;

  //ros::NodeHandle n;
  BaseDriverConfig bdg;
  boost::shared_ptr<Transport> trans;
  boost::shared_ptr<Dataframe> frame;

  ros::Subscriber cmd_vel_sub;

  ros::Publisher odom_pub;

  
  //ros::Publisher left_encoder_pub;
  //ros::Publisher right_encoder_pub;
  
  nav_msgs::Odometry odom;
  geometry_msgs::TransformStamped odom_trans;
  tf::TransformBroadcaster odom_broadcaster;
  
  ros::NodeHandle nh;
  ros::NodeHandle pn;
  
#define MAX_MOTOR_COUNT 4
  ros::Publisher pid_debug_pub_input[MAX_MOTOR_COUNT];
  ros::Publisher pid_debug_pub_output[MAX_MOTOR_COUNT];

  std_msgs::Int32 pid_debug_msg_input[MAX_MOTOR_COUNT];
  std_msgs::Int32 pid_debug_msg_output[MAX_MOTOR_COUNT];

  bool need_update_speed;
 ////////////////////////////////////////////// 
  bool need_reset_plant;
  bool need_get_plant;
  bool need_set_rgb;
  bool need_get_sensor;
  bool need_enable_motor;
  bool need_get_voltage;
 ///////////////////////////////////////// 
  //ros::Time last_update_odom_time; 

  zoo_imu::RawImu raw_imu_msgs;

  zoo_imu::Sensor sensor_msgs;

  ros::Publisher raw_imu_pub;

  ros::Publisher sensor_pub;
};
