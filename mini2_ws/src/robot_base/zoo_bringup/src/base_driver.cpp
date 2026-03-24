#include "base_driver.h"
#include "data_holder.h"

#include <std_msgs/Float32MultiArray.h>
#include "serial_transport.h"
#include "simple_dataframe_master.h"
#include <boost/assign/list_of.hpp>




BaseDriver* BaseDriver::instance = NULL;

BaseDriver::BaseDriver() : pn("~"), bdg(pn)
{
    //init config
    bdg.init(&Data_holder::get()->parameter);

    trans = boost::make_shared<Serial_transport>(bdg.port, bdg.buadrate);
    frame = boost::make_shared<Simple_dataframe>(trans.get());


    ROS_INFO("BaseDriver startup");
    if (trans->init())
    {
        ROS_INFO("connected to main board");
    } else
    {
        ROS_ERROR("oops!!! can't connect to main board");
        return;
    }

    ros::Duration(2).sleep(); //wait for device
    ROS_INFO("end sleep");
    
    frame->init();

    frame->interact(ID_GET_VERSION);

    ROS_INFO("robot version:%s build time:%s", Data_holder::get()->firmware_info.version,
                                        Data_holder::get()->firmware_info.time);
    
    init_cmd_odom();

    init_pid_debug();

    read_param();

    init_imu();

    get_sensor();
}

BaseDriver::~BaseDriver()
{
if (instance != NULL)
    delete instance;
}

void BaseDriver::init_cmd_odom()
{
    frame->interact(ID_INIT_ODOM);

    ROS_INFO_STREAM("subscribe cmd topic on [" << bdg.cmd_vel_topic << "]");
    cmd_vel_sub = nh.subscribe(bdg.cmd_vel_topic, 1000, &BaseDriver::cmd_vel_callback, this);

    ROS_INFO_STREAM("advertise odom topic on [" << bdg.odom_topic << "]");
    odom_pub = nh.advertise<nav_msgs::Odometry>(bdg.odom_topic, 50);

    //init odom_trans
    odom_trans.header.frame_id = bdg.odom_frame;  
    odom_trans.child_frame_id = bdg.base_frame;  

    odom_trans.transform.translation.z = 0;  

    //init odom
    odom.header.frame_id = bdg.odom_frame;  
    odom.pose.pose.position.z = 0.0;
    odom.child_frame_id = bdg.base_frame;  
    odom.twist.twist.linear.y = 0;  

    if (!bdg.publish_tf){
        odom.pose.covariance =  boost::assign::list_of(1e-3) (0) (0)  (0)  (0)  (0)
                                                    (0) (1e-3)  (0)  (0)  (0)  (0)
                                                    (0)   (0)  (1e6) (0)  (0)  (0)
                                                    (0)   (0)   (0) (1e6) (0)  (0)
                                                    (0)   (0)   (0)  (0) (1e6) (0)
                                                    (0)   (0)   (0)  (0)  (0)  (1e3) ;
    
        odom.twist.covariance =  boost::assign::list_of(1e-3) (0)   (0)  (0)  (0)  (0)
                                                    (0) (1e-3)  (0)  (0)  (0)  (0)
                                                    (0)   (0)  (1e6) (0)  (0)  (0)
                                                    (0)   (0)   (0) (1e6) (0)  (0)
                                                    (0)   (0)   (0)  (0) (1e6) (0)
                                                    (0)   (0)   (0)  (0)  (0)  (1e3) ; 
    }

    need_update_speed = false;

    //ROS_INFO_STREAM("subscribe cmd topic on [correct_pos]");
    //correct_pos_sub = nh.subscribe("correct_pos", 1000, &BaseDriver::correct_pos_callback, this);
}

void BaseDriver::init_pid_debug()
{
    if (bdg.out_pid_debug_enable)
    {
        const char* input_topic_name[MAX_MOTOR_COUNT]={"motor1_input", "motor2_input", "motor3_input", "motor4_input"};
        const char* output_topic_name[MAX_MOTOR_COUNT]={"motor1_output", "motor2_output", "motor3_output", "motor4_output"};
        for (size_t i = 0; i < MAX_MOTOR_COUNT; i++)
        {
            pid_debug_pub_input[i] = nh.advertise<std_msgs::Int32>(input_topic_name[i], 1000);
            pid_debug_pub_output[i] = nh.advertise<std_msgs::Int32>(output_topic_name[i], 1000);
        }
    }
}

void BaseDriver::init_imu()
{
    raw_imu_pub = nh.advertise<zoo_imu::RawImu>("raw_imu", 50);
    sensor_pub = nh.advertise<zoo_imu::Sensor>("sensor", 50);
    raw_imu_msgs.header.frame_id = "imu_link";
    raw_imu_msgs.accelerometer = true;
    raw_imu_msgs.gyroscope = true;
    raw_imu_msgs.magnetometer = true;
}
void BaseDriver::read_param()
{
    Robot_parameter* param = &Data_holder::get()->parameter;
    memset(param,0, sizeof(Robot_parameter));

    frame->interact(ID_GET_ROBOT_PARAMTER);

    ROS_INFO("RobotParameters: %d %d %d %d %d %d %d %d %d %d %d %d %d", 
        param->wheel_diameter, param->wheel_track,  param->encoder_resolution, 
        param->do_pid_interval, param->kp, param->ki, param->kd, param->ko, 
        param->cmd_last_time, param->max_v_liner_x, param->max_v_liner_y, param->max_v_angular_z,
        param->imu_type);

    bdg.SetRobotParameters();
}

void BaseDriver::cmd_vel_callback(const geometry_msgs::Twist& vel_cmd)
{
    ROS_INFO_STREAM("cmd_vel:[" << vel_cmd.linear.x << " " << vel_cmd.linear.y << " " << vel_cmd.linear.z << " " << vel_cmd.angular.z << "]");
///////////////////////////////////////////////////////////////////////////////////////////////////////	

	int id_number1 = vel_cmd.angular.x;
	int id_number2 = vel_cmd.angular.y;
	ROS_INFO_STREAM("idnumber:[" <<id_number1<<" "<< id_number2<< "]");
	if(id_number1==0)
	{
		Data_holder::get()->velocity.v_liner_x = vel_cmd.linear.x*800;
		Data_holder::get()->velocity.v_liner_y = vel_cmd.linear.y*800;
		//Data_holder::get()->velocity.v_liner_z = vel_cmd.linear.z*100;
		
		Data_holder::get()->velocity.v_angular_z = vel_cmd.angular.z*100;

		need_update_speed = true;
	}
	else
	{
		if(id_number2==0)
		{
			//ROS_INFO_STREAM("order");
			switch (id_number1){
			case 1:
				need_reset_plant = true;//order 8
				//ROS_INFO_STREAM("order8");
				//read_param();
				break;
			case 2:
				need_get_plant = true;//order 9
				break;
			case 3:
				need_set_rgb = true;//order 10
				break;
			case 4:
				need_get_sensor = true;//order 11
				break;
			
			case 5:
				need_enable_motor = true;//order 12
				break;
			case 6:
				need_get_voltage = true;//order 13
				break;
			default:
				break;
			}
		}
		
	}
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////
}

void BaseDriver::work_loop()
{
    ros::Rate loop(1000);
    while (ros::ok())
    {
        //boost::posix_time::ptime my_posix_time = ros::Time::now().toBoost();
        update_param();

        update_odom();

        update_pid_debug();
        
 //////////////////////////////////////////       
        reset_plant();
        get_plant();
        set_rgb();
        get_sensor();
        enable_motor();
        get_voltage();
 //////////////////////////////////////////////////

        update_speed();
		
        //if (Data_holder::get()->parameter.imu_type == 'E')
        update_imu();
		
        loop.sleep();

	    ros::spinOnce();
    }
}

void BaseDriver::update_param()
{
#ifdef USE_DYNAMIC_RECONFIG
    if (bdg.get_param_update_flag())
    {
        frame->interact(ID_SET_ROBOT_PARAMTER);
        ros::Rate loop(5);
        loop.sleep();
    }
#endif
}

void BaseDriver::update_odom()
{
    //ROS_INFO_STREAM("get_odom");
    frame->interact(ID_GET_ODOM);
    
    ros::Time current_time = ros::Time::now(); 

    float x = Data_holder::get()->odom.x*0.001;
    float y = Data_holder::get()->odom.y*0.001;
    float th = Data_holder::get()->odom.yaw*0.01;

    float vxy = Data_holder::get()->odom.v_liner_x*0.001;
    float vth = Data_holder::get()->odom.v_angular_z*0.001;

    //ROS_INFO("odom: x=%.2f y=%.2f th=%.2f vxy=%.2f vth=%.2f", x, y ,th, vxy,vth);
    
    geometry_msgs::Quaternion odom_quat = tf::createQuaternionMsgFromYaw(th);

    //publish_tf
    if (bdg.publish_tf){
        odom_trans.header.stamp = current_time;  
        odom_trans.transform.translation.x = x;  
        odom_trans.transform.translation.y = y;  
        odom_trans.transform.rotation = odom_quat; 
        odom_broadcaster.sendTransform(odom_trans);  
    }

    //publish the message  
    odom.header.stamp = current_time;  
    odom.pose.pose.position.x = x;  
    odom.pose.pose.position.y = y;  
    odom.pose.pose.orientation = odom_quat;    
    odom.twist.twist.linear.x = vxy;  
    odom.twist.twist.angular.z = vth;  
    
    odom_pub.publish(odom);
}

void BaseDriver::update_speed()
{
	//ROS_INFO_STREAM("before:[" <<need_update_speed<< "]");
    if (need_update_speed)
    {
        ROS_INFO_STREAM("update_speed");
        need_update_speed = !(frame->interact(ID_SET_VELOCITY));
        //ROS_INFO_STREAM("after:[" <<need_update_speed<< "]");
    }
}
/////////////////////////////////////////////////////////////////////////////////////////////////////
void BaseDriver::reset_plant()  //ID8
{
	//ROS_INFO_STREAM("before:[" <<need_reset_plant<< "]");
    if (need_reset_plant)
    {
        ROS_INFO_STREAM("reset_plant");
        need_reset_plant = !(frame->interact(ID_RESET_PLANT));
       // ROS_INFO_STREAM("after:[" <<need_reset_plant<< "]");
    }
}
//*****************************************************
void BaseDriver::get_plant()   //ID9
{
    if (need_get_plant)
    {	
        ROS_INFO_STREAM("get_plant");
        need_get_plant = !(frame->interact(ID_GET_PLANT));
        
        Plant_position* position = &Data_holder::get()->highth;
		memset(position,1, sizeof(Plant_position));
        ROS_INFO("Plant position: %d %d %d %d", position->a1, position->a2,  position->a3, position->a4);
        
    }
}

void BaseDriver::set_rgb()      //ID10
{
    if (need_set_rgb)
    {
        ROS_INFO_STREAM("set_rgb");
        need_set_rgb = !(frame->interact(ID_SET_RGB));

    }
}

void BaseDriver::get_sensor()     //ID11
{
    Sensor_state* sen = &Data_holder::get()->sensor;
    need_get_sensor = !(frame->interact(ID_GET_SENSOR));


    sensor_msgs.ultra1 = (int16)sen->ultra_array[0];
    sensor_msgs.ultra2 = (int16)sen->ultra_array[1];
    sensor_msgs.ultra3 = (int16)sen->ultra_array[2];
    sensor_msgs.ultra4 = (int16)sen->ultra_array[3];

    sensor_msgs.grey_sensor = (int) sen->gery_sensor;
    sensor_msgs.collision = (int) sen->conllision;
    sensor_msgs.voltage = (int) sen->sys_voltage;
    sensor_msgs.current = (int) sen->sys_current;

    sensor_pub.publish(sensor_msgs);

}

void BaseDriver::enable_motor()     //ID12
{
    if (need_enable_motor)
    {
        ROS_INFO_STREAM("enable_motor");
        
        need_enable_motor = !(frame->interact(ID_ENABLE_MOTOR));
    }
}
//**********************************************************
void BaseDriver::get_voltage()      //ID13
{
    if (need_get_voltage)
    {
        //ROS_INFO_STREAM("get_voltage");
        Battery_voltage* vol = &Data_holder::get()->voltage;
        memset(vol,2, sizeof(Battery_voltage));	
        
        need_get_voltage = !(frame->interact(ID_GET_VOLTAGE));			
		ROS_INFO("Robot Voltage: %d V", vol->V1/10);
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////

void BaseDriver::update_pid_debug()
{
    if (bdg.out_pid_debug_enable)
    {
        frame->interact(ID_GET_PID_DATA);
        
        for (size_t i = 0; i < MAX_MOTOR_COUNT; i++)
        {
            pid_debug_msg_input[i].data = Data_holder::get()->pid_data.input[i];
            pid_debug_msg_output[i].data = Data_holder::get()->pid_data.output[i];

            pid_debug_pub_input[i].publish(pid_debug_msg_input[i]);
            pid_debug_pub_output[i].publish(pid_debug_msg_output[i]);
        }
    }
}

void BaseDriver::update_imu()
{
    //ROS_INFO_STREAM("get_imu");
    frame->interact(ID_GET_IMU_DATA);
    raw_imu_msgs.header.stamp = ros::Time::now();
    raw_imu_msgs.raw_linear_acceleration.x = Data_holder::get()->imu_data[0];
    raw_imu_msgs.raw_linear_acceleration.y = Data_holder::get()->imu_data[1];
    raw_imu_msgs.raw_linear_acceleration.z= Data_holder::get()->imu_data[2];
    raw_imu_msgs.raw_angular_velocity.x = Data_holder::get()->imu_data[3];
    raw_imu_msgs.raw_angular_velocity.y = Data_holder::get()->imu_data[4];
    raw_imu_msgs.raw_angular_velocity.z = Data_holder::get()->imu_data[5];
    raw_imu_msgs.raw_magnetic_field.x = Data_holder::get()->imu_data[6];
    raw_imu_msgs.raw_magnetic_field.y = Data_holder::get()->imu_data[7];
    raw_imu_msgs.raw_magnetic_field.z = Data_holder::get()->imu_data[8];
    raw_imu_pub.publish(raw_imu_msgs);
}
