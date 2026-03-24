# RoboCup ROS Robot Champion

ROS-based intelligent robot project for the 2023 China Robot Competition & RoboCup China Open (Vision Challenge).

**This repository now includes the open-source codebase in addition to the technical report.**  
It contains the ROS workspace used in our competition system, including navigation, voice interaction, base bringup/control, visual tracking, and robotic arm related modules.

## Highlights

- Champion project of the 2023 China Robot Competition & RoboCup China Open (Vision Challenge)
- Full ROS workspace is now open-sourced
- Includes technical report, launch files, source code, and integrated third-party ROS packages
- Covers navigation, speech interaction, robot bringup, visual tracking, and arm control

## Project Overview

This project is an intelligent service robot system built on ROS.  
The robot was designed for RoboCup competition tasks and integrates multiple capabilities such as:

- Autonomous navigation and obstacle avoidance
- Voice recognition and speech synthesis
- Visual perception / target tracking
- Base bringup and hardware control
- Robotic arm control

In addition to the technical report, this repository now provides the **actual ROS workspace (`mini2_ws`)** used in the project, making the project easier to study, reproduce, and extend.

## Open-Sourced Code Contents

The repository contains a ROS catkin workspace:

```text
mini2_ws/
├── src/
│   ├── robot_voice/
│   ├── robot_slam/
│   ├── track_pkg/
│   ├── mini2_arm/
│   ├── robot_base/
│   ├── apriltags2/
│   ├── apriltags2_ros/
│   ├── better_astar_global_planner-main/
│   ├── openvino/
│   ├── range_sensor_layer/
│   ├── ros_astra_camera-master/
│   ├── rplidar_ros/
│   └── waterplus_map_tools/
````

### Main custom modules

#### 1. `robot_voice`

Voice interaction related package.
It includes speech recognition, speech synthesis, offline ASR, NLU-related code, and corresponding launch files.

Typical source files include:

* `iat_publish.cpp`
* `asr_offline.cpp`
* `talk_tts.cpp`
* `tts_subscribe.cpp`
* `tuling_nlu.cpp`
* `voice_assistant.cpp`

#### 2. `robot_slam`

Navigation and SLAM related package.
It contains launch files and scripts for mapping, navigation, localization, RViz visualization, and multi-goal navigation.

Typical files include:

* `gmapping.launch`
* `navigation.launch`
* `nav_cartographer.launch`
* `multi_goal.launch`
* `navigate.cpp`
* `navigation_goals.py`
* `navigation_multi_goals.py`

#### 3. `track_pkg`

Visual tracking related package.
It contains KCF-based tracking source files and OpenCV-related implementation.

Typical files include:

* `kcftracker.cpp`
* `fhog.cpp`
* `runtracker.cpp`

#### 4. `mini2_arm`

Robotic arm related package.
It includes arm control logic, serial communication code, parameters, and launch files.

Typical files include:

* `control_center.cpp`
* `mini2_arm.cpp`
* `serialport.cpp`

#### 5. `robot_base`

Base platform related packages.
This part contains bringup, control, robot description, IMU, and robot platform related components.

Sub-packages include:

* `zoo_bringup`
* `zoo_control`
* `zoo_description`
* `zoo_imu`
* `zoo_robot`

### Integrated third-party / dependency packages

The workspace also includes several integrated ROS packages and drivers, such as:

* `apriltags2`
* `apriltags2_ros`
* `better_astar_global_planner-main`
* `range_sensor_layer`
* `openvino`
* `ros_astra_camera-master`
* `rplidar_ros`
* `waterplus_map_tools`

These packages support perception, planning, sensors, and robot system integration.

## Repository Structure

```text
.
├── mini2_ws/              # ROS catkin workspace
├── Technical_Report.pdf   # Full technical report
├── LICENSE                # BSD 3-Clause License
└── README.md              # Project overview
```

## Getting Started

> Note: This repository is a competition project workspace.
> Some modules depend on specific hardware, ROS environment, sensors, SDKs, or external libraries.

### 1. Clone the repository

```bash
git clone https://github.com/lurenjia384/robocup-ros-robot-champion.git
cd robocup-ros-robot-champion/mini2_ws
```

### 2. Build the workspace

```bash
catkin_make
source devel/setup.bash
```

### 3. Example launch entry points

Depending on your environment and hardware setup, you may start from launch files such as:

```bash
# Mapping
roslaunch robot_slam gmapping.launch

# Navigation
roslaunch robot_slam navigation.launch

# Voice module
roslaunch robot_voice iat_publish.launch
roslaunch robot_voice robot_tts.launch

# Arm module
roslaunch mini2_arm control_center.launch
```

Please adjust dependencies, hardware drivers, parameters, and launch combinations according to your actual platform.

## Competition Achievement

* Event: 2023 China Robot Competition & RoboCup China Open (Vision Challenge)
* Result: Champion / First Place
* Project type: ROS-based intelligent robot system for competition tasks

## Technical Report

The repository also includes the full technical report:

* `Technical_Report.pdf`

If you are interested in the overall system design, hardware architecture, and competition background, please refer to the report first.

## Why This Repository Is Useful

This repository is suitable for:

* Students learning ROS-based robot system integration
* Developers interested in competition robot software architecture
* Researchers who want to study a complete robot workspace rather than only a paper/report
* Anyone looking for references on integrating navigation, voice, perception, and control in one ROS project

## Citation

If this project helps your work, please cite the technical report or link to this repository.

## License

This project is licensed under the **BSD 3-Clause License**.
See the `LICENSE` file for details.

## Contact

If you have questions, feel free to open an issue in this repository.
