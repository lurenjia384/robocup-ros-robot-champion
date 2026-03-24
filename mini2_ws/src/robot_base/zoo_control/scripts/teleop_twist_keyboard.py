#!/usr/bin/env python
import roslib; roslib.load_manifest('teleop_twist_keyboard')
import rospy

from geometry_msgs.msg import Twist

import sys, select, termios, tty

msg = """
Reading from the keyboard  and Publishing to Twist!
---------------------------
Moving around:
   u    i    o
   j    k    l
   m    ,    .
For Holonomic mode (strafing), hold down the shift key:
---------------------------
   U    I    O
   J    K    L
   M    <    >
t : up (+z)
b : down (-z)
anything else : stop
q/z : increase/decrease max speeds by 10%
w/x : increase/decrease only linear speed by 10%
e/c : increase/decrease only angular speed by 10%
CTRL-C to quit
"""

moveBindings = {
		'i':(1,0,0,0),
		'o':(1,0,0,-1),
		'j':(0,0,0,1),
		'l':(0,0,0,-1),
		'u':(1,0,0,1),
		',':(-1,0,0,0),
		'.':(-1,0,0,1),
		'm':(-1,0,0,-1),
		'O':(1,-1,0,0),
		'I':(1,0,0,0),
		'J':(0,1,0,0),
		'L':(0,-1,0,0),
		'U':(1,1,0,0),
		'<':(-1,0,0,0),
		'>':(-1,-1,0,0),
		'M':(-1,1,0,0),
		't':(0,0,1,0),
		'b':(0,0,-1,0),
	       }

speedBindings={
		'q':(1.1,1.1),
		'z':(.9,.9),
		'w':(1.1,1),
		'x':(.9,1),
		'e':(1,1.1),
		'c':(1,.9),
	      }

other_order = {
		'a':(0,0,0,1,0,0),
		's':(0,0,0,2,0,0),
		'd':(0,0,0,3,0,0),
		'f':(0,0,0,4,0,0),
		'g':(0,0,0,5,0,0),
		'h':(0,0,0,6,0,0),
#		'r':(0,0,0,0,1,0),
		  }

light_order = {
		'A':(0,0,0,1,1,0),
		'S':(0,0,0,2,1,0),
		'D':(0,0,0,3,1,0),
		'F':(0,0,0,4,1,0),
		'G':(0,0,0,5,1,0),
		'H':(0,0,0,6,1,0),
		'R':(0,0,0,0,1,0),
		  }
		  		  
def getKey():
	tty.setraw(sys.stdin.fileno())
	select.select([sys.stdin], [], [], 0)
	key = sys.stdin.read(1)
	termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
	return key


def vels(speed,turn):
	return "currently:\tspeed %s\tturn %s " % (speed,turn)

if __name__=="__main__":
    	settings = termios.tcgetattr(sys.stdin)
	
	pub = rospy.Publisher('cmd_vel', Twist, queue_size = 1)
	rospy.init_node('teleop_twist_keyboard')

	speed = rospy.get_param("~speed", 0.3)
	turn = rospy.get_param("~turn", 1.0)
	x = 0
	y = 0
	z = 0
	th = 0
	status = 0
	get_order1 = 0
	get_order2 = 0

	try:
		print msg
		print vels(speed,turn)
		while(1):
			key = getKey()
			if key in moveBindings.keys():
				x = moveBindings[key][0]
				y = moveBindings[key][1]
				z = moveBindings[key][2]
				th = moveBindings[key][3]
				get_order1 = 0
				get_order2 = 0
			elif key in speedBindings.keys():
				speed = speed * speedBindings[key][0]
				turn = turn * speedBindings[key][1]
				get_order1 = 0
				get_order2 = 0

				print vels(speed,turn)
				if (status == 14):
					print msg
				status = (status + 1) % 15
			elif key in other_order.keys():
				get_order1 = other_order[key][3]
				get_order2 = other_order[key][4]
				x = other_order[key][0]
				y = other_order[key][1]
				z = other_order[key][2]
				th = other_order[key][5]
				
			elif key in light_order.keys():
				get_order1 = light_order[key][3]
				get_order2 = light_order[key][4]
				x = light_order[key][0]
				y = light_order[key][1]
				z = light_order[key][2]
				th = light_order[key][5]
				
			else:
				x = 0
				y = 0
				z = 0
				th = 0
				get_order1 = 0
				get_order2 = 0
				if (key == '\x03'):
					break

			twist = Twist()
			twist.linear.x = x*speed; twist.linear.y = y*speed; twist.linear.z = z*speed;
			twist.angular.x = get_order1; twist.angular.y = get_order2; twist.angular.z = th*turn
			pub.publish(twist)

	except:
		print e

	finally:
		twist = Twist()
		twist.linear.x = 0; twist.linear.y = 0; twist.linear.z = 0
		twist.angular.x = 0; twist.angular.y = 0; twist.angular.z = 0
		pub.publish(twist)

    		termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)

