[English](./README.md) | [简体中文](./README.zh-CN.md)

# ROS-Based Intelligent Robot for RoboCup China Open 2023 🏆

[![YouTube Demo](https://img.shields.io/badge/YouTube-Watch%20Demo-red?logo=youtube)](https://www.youtube.com/watch?v=J3KhlBPvCa0)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](LICENSE)

This repository contains the technical report and the **open-sourced software implementation** of our champion robot developed for the **2023 China Robot Competition & RoboCup China Open (Vision Challenge)**.

Our robot achieved a **perfect score** and the **fastest completion time**, securing **first place** in its category and outperforming strong teams from top universities such as Beijing Institute of Technology and Hunan University.

In addition to the technical report, this repository now provides the actual ROS workspace used in the competition project, making it easier to study, reproduce, and extend.

## 🎥 Demo Video

Click the image below to watch the full demonstration:

[![Robot Demo Video](https://img.youtube.com/vi/J3KhlBPvCa0/0.jpg)](https://www.youtube.com/watch?v=J3KhlBPvCa0)

The video showcases:

- Voice command recognition
- Real-time path planning and dynamic obstacle avoidance
- Face detection and tracking
- Full competition run

---

## 📄 Project Overview

This project is an intelligent robot system developed on **ROS (Robot Operating System)** for RoboCup competition tasks.  
It integrates multiple capabilities, including:

- Autonomous navigation
- Dynamic obstacle avoidance
- Voice recognition and speech synthesis
- Visual perception and tracking
- Base bringup and control
- Robotic arm control

The system combines multiple sensors and hardware modules such as LiDAR, RGB-D camera, microphone array, motors, encoders, and IMU, and organizes them through a modular ROS-based software architecture.

Unlike the previous version of the repository, which mainly focused on the technical report, the project code is now also open-sourced in this repository.

## 🚀 Key Features

| Feature | Description |
|---------|-------------|
| **Navigation** | Mapping, localization, path planning, and obstacle avoidance based on ROS navigation framework |
| **Voice Interaction** | Speech recognition, speech synthesis, and voice assistant related functions |
| **Visual Perception** | Tracking and visual processing for competition-related tasks |
| **Hardware Control** | Robot base bringup, control, IMU integration, and platform-level modules |
| **Arm Control** | Robotic arm control logic and communication support |
| **Open-Source Workspace** | Full ROS catkin workspace included for learning and reproduction |

## 💻 Open-Sourced Code Contents

The repository now includes a full ROS catkin workspace:

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

#### `robot_voice`

Voice interaction related package, including:

* Speech recognition
* Offline ASR
* Speech synthesis
* Text-to-speech playback
* NLU / dialogue related processing
* Voice assistant functions

#### `robot_slam`

Navigation and SLAM related package, including:

* Mapping and localization launch files
* Navigation startup configuration
* RViz-related files
* Multi-goal navigation scripts
* Navigation task execution code

#### `track_pkg`

Visual tracking related package, containing tracking algorithm implementation for competition-related perception tasks.

#### `mini2_arm`

Robotic arm related package, including:

* Arm control logic
* Serial communication code
* Parameter files
* Launch files

#### `robot_base`

Robot base platform related packages, including:

* `zoo_bringup`
* `zoo_control`
* `zoo_description`
* `zoo_imu`
* `zoo_robot`

These packages are mainly used for bringup, base control, robot description, IMU access, and overall platform integration.

### Integrated third-party / dependency packages

The workspace also includes several integrated ROS packages and drivers, such as:

* `apriltags2`
* `apriltags2_ros`
* `better_astar_global_planner-main`
* `openvino`
* `range_sensor_layer`
* `ros_astra_camera-master`
* `rplidar_ros`
* `waterplus_map_tools`

These packages support perception, planning, sensors, and system integration.

## 🛠️ Hardware Architecture

### Sensors & Actuators

* **LiDAR**: Used for mapping, localization, and obstacle detection
* **RGB-D Camera**: Used for visual perception and depth acquisition
* **Microphone Array**: Used for voice command capture
* **Motor System**: Used for robot base motion control
* **IMU**: Used for orientation and motion feedback

### Control System

* **Lower-level controller**: Responsible for low-level hardware and motor control
* **Upper-level processor**: Runs ROS and handles perception, planning, decision-making, and task execution
* **Communication**: Includes CAN, serial, USB, and other interfaces depending on hardware setup

## 🧠 Software Architecture

### ROS Navigation System

The project is built on the ROS navigation framework to support:

* Map building
* Localization
* Path planning
* Dynamic obstacle avoidance
* Multi-goal navigation

### Voice Processing System

The voice module supports the complete pipeline from speech input to command parsing and voice feedback.

### Visual Processing System

The visual module is used for tracking and perception-related competition tasks.

### Low-Level Control System

The low-level system provides motor control, feedback loops, and communication support for upper-level ROS modules.

## 📁 Repository Structure

```text
.
├── mini2_ws/              # ROS catkin workspace (open-sourced)
├── Technical_Report.pdf   # Full technical report
├── LICENSE                # License file
├── README.md              # English README
└── README.zh-CN.md        # Chinese README
```

## 🚀 Getting Started

> Note: This repository is a competition robot workspace.
> Some modules depend on specific hardware, ROS versions, drivers, SDKs, or external libraries.

### 1. Clone the repository

```bash
git clone https://github.com/lurenjia384/robocup-ros-robot-champion.git
cd robocup-ros-robot-champion/mini2_ws
```

### 2. Install dependencies

If `rosdep` has not been initialized on your machine, run:

```bash
sudo rosdep init
rosdep update
```

Then install workspace dependencies:

```bash
rosdep install --from-paths src --ignore-src -r -y
```

### 3. Build the workspace

If you are building on a different machine, it is usually safer to remove the pre-generated `build/` and `devel/` directories first:

```bash
rm -rf build devel
```

```bash
catkin_make
source devel/setup.bash
```

### 4. Example entry points

Depending on your hardware and environment, you may start with launch files such as:

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

Please adjust dependencies, hardware drivers, and parameters according to your own platform.

## 🏆 Competition Achievement

* **Event**: 2023 China Robot Competition & RoboCup China Open – Vision Challenge
* **Result**: **First Place (Champion)** with perfect score and fastest completion time
* **Project Type**: ROS-based intelligent robot system for competition tasks

## 📘 Technical Report

The repository also includes the full technical report:

* `Technical_Report.pdf`

If you are interested in the overall system design, competition background, and hardware/software architecture, you may start with the report first.

## 🔭 Future Improvements

Based on post-competition analysis, possible future improvements include:

* Multi-sensor fusion for more robust perception
* Better coordination between global and local planning
* Upgraded visual recognition algorithms
* Better engineering documentation and dependency instructions
* Improved reproducibility on different hardware platforms

## 👥 Team

* **Captain**: Yang Changchuan – Hardware/Software integration
* **Member**: Wang Can – Hardware/Software development
* **Member**: Shao Haoyang – System maintenance and debugging
* **Advisors**: Liu Andong, Teng You

*Zhejiang University of Technology – BOOM不了一点队*

## 📚 Citation

If you find this work useful, please cite our technical report:

```bibtex
@techreport{zjut_robocup2023,
  title={2023 China Robot Competition \& RoboCup China Open Technical Report},
  author={Yang, Changchuan and Wang, Can and Shao, Haoyang},
  institution={Zhejiang University of Technology},
  year={2023}
}
```

## 📝 License

This project is licensed under the **BSD 3-Clause License**. See the [LICENSE](LICENSE) file for details.

---

For questions or collaborations, feel free to open an issue.
