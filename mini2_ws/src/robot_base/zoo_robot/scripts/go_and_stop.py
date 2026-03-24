#!/usr/bin/env python
import rospy
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan
import sys, select, os
if os.name == 'nt':
  import msvcrt
else:
  import tty, termios


check_forward_dist = 0.5

flag = 0
flagshow = 0

msg = """


g : for go
s : for stop

CTRL-C to quit

"""

def getKey():
    if os.name == 'nt':
      return msvcrt.getch()

    tty.setraw(sys.stdin.fileno())
    rlist, _, _ = select.select([sys.stdin], [], [], 0.1)
    if rlist:
        key = sys.stdin.read(1)
    else:
        key = ''

    termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
    return key

def vels(target_linear_vel, target_angular_vel):
    return "currently:\tlinear vel %s\t angular vel %s " % (target_linear_vel*0.2,target_angular_vel*0.2)


def callback(data):
    global flag
    global flagshow
    if flagshow:
        
        print(data.ranges[179],'falg:',flag)

	print("\r")
    if data.ranges[179]<check_forward_dist:
	flag = 1
	flagshow = 0


if __name__=="__main__":
    if os.name != 'nt':
        settings = termios.tcgetattr(sys.stdin)

    rospy.init_node('turtlebot3_teleop')
    pub = rospy.Publisher('cmd_vel', Twist, queue_size=10)

    sub = rospy.Subscriber("scan_filtered", LaserScan, callback,queue_size = 1)

    status = 0
    target_linear_vel   = 0.0
    target_angular_vel  = 0.0


    try:
        print(msg)
        while(1):
            key = getKey()
            if key == 'g' :
		flagshow = 1
		#flag = 0
                target_linear_vel = 1
                status = status + 1
                print(vels(target_linear_vel,target_angular_vel))
            
            elif key == ' ' or key == 's' :
		flagshow = 0
                target_linear_vel   = 0.0

                target_angular_vel  = 0.0

                print(vels(target_linear_vel, target_angular_vel))
            else:
                if (key == '\x03'):
                    break

            if status == 20 :
                print(msg)
                status = 0

            twist = Twist()

            control_linear_vel = 0.2*target_linear_vel
            twist.linear.x = control_linear_vel; twist.linear.y = 0.0; twist.linear.z = 0.0

          
            twist.angular.x = 0.0; twist.angular.y = 0.0; twist.angular.z = 0.0
	    if flag:
		twist.linear.x = 0
		print("STOP!!!!!!!!!!!!!!!\r\n")
	  

            pub.publish(twist)

    except:
        print(e)

    finally:
        twist = Twist()
        twist.linear.x = 0.0; twist.linear.y = 0.0; twist.linear.z = 0.0
        twist.angular.x = 0.0; twist.angular.y = 0.0; twist.angular.z = 0.0
        pub.publish(twist)

    if os.name != 'nt':
        termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
