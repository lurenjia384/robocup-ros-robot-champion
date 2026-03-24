[English](./README.md) | [简体中文](./README.zh-CN.md)

# RoboCup China Open 2023 ROS智能机器人项目 🏆

[![YouTube Demo](https://img.shields.io/badge/YouTube-观看演示-red?logo=youtube)](https://www.youtube.com/watch?v=J3KhlBPvCa0)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](LICENSE)

本仓库收录了我们在 **2023 中国机器人大赛暨 RoboCup 中国公开赛（视觉赛）** 中使用的冠军机器人项目资料。  
除了技术报告外，**现已同步开源项目代码**，包含比赛中实际使用的 ROS 工作空间、核心功能模块及部分集成依赖，便于学习、复现与二次开发。

在该赛事中，机器人以**满分成绩**和**最快完成时间**获得本赛项**冠军**，在与北京理工大学、湖南大学等高校队伍的竞争中取得第一名。

## 🎥 演示视频

点击下方图片即可观看完整演示视频：

[![Robot Demo Video](https://img.youtube.com/vi/J3KhlBPvCa0/0.jpg)](https://www.youtube.com/watch?v=J3KhlBPvCa0)

视频展示内容包括：

- 语音指令识别
- 实时路径规划与动态避障
- 人脸检测与跟踪
- 完整比赛流程演示

---

## 📄 项目简介

本项目基于 **ROS（Robot Operating System）** 构建，面向 RoboCup 视觉赛任务需求，集成了语音交互、自主导航、动态避障、视觉感知、底盘控制、机械臂控制等能力。

系统融合了多种传感器与执行机构，包括激光雷达、RGB-D 相机、麦克风阵列、电机编码器、IMU 等，并通过 ROS 框架实现模块化协同工作。

与此前仅展示技术报告不同，当前仓库已经进一步开放了实际代码，仓库现在既可以作为比赛成果展示页，也可以作为一个可学习、可参考、可扩展的 ROS 项目仓库使用。

## 🚀 项目亮点

| 功能模块 | 说明 |
|---------|------|
| **自主导航** | 基于 ROS 导航框架实现建图、定位、路径规划与动态避障 |
| **语音识别与语音合成** | 集成语音识别、语音播报、自然语言处理相关能力 |
| **视觉感知与跟踪** | 支持目标/人脸相关视觉处理与跟踪 |
| **底盘与硬件控制** | 包含底盘驱动、IMU、机器人底层控制相关模块 |
| **机械臂控制** | 提供机械臂控制与串口通信相关代码 |
| **工程可复现性** | 开源 `mini2_ws` ROS 工作空间，便于学习与复现 |

## 💻 开源代码内容

当前仓库除了技术报告外，还包含完整的 ROS catkin 工作空间：

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

### 1. `robot_voice` —— 语音交互模块

该模块主要负责机器人语音相关功能，包括：

* 语音识别
* 离线语音识别
* 语音合成
* 文本播报
* NLU / 对话相关处理
* 语音助手功能

适合用于展示机器人“听懂指令—解析语义—执行任务—语音反馈”的完整链路。

### 2. `robot_slam` —— 建图、导航与定位模块

该模块主要包含：

* 建图与定位相关 launch 文件
* 导航启动配置
* RViz 可视化配置
* 多目标导航脚本
* 导航任务执行代码

适合用于复现机器人在比赛中的自主移动、路径规划与任务点巡航流程。

### 3. `track_pkg` —— 视觉跟踪模块

该模块主要与视觉目标跟踪相关，包含目标跟踪算法实现代码，可用于目标/人脸相关跟踪任务。

### 4. `mini2_arm` —— 机械臂控制模块

该模块主要负责机械臂运动控制，包含：

* 控制中心
* 机械臂控制逻辑
* 串口通信代码
* 参数配置与启动文件

适合用于与导航或感知模块联动，实现更完整的服务机器人任务流程。

### 5. `robot_base` —— 机器人底盘与基础平台模块

该部分主要包含机器人底盘基础能力，子模块包括：

* `zoo_bringup`
* `zoo_control`
* `zoo_description`
* `zoo_imu`
* `zoo_robot`

主要用于机器人整机启动、底盘控制、模型描述、IMU 接入与平台集成。

### 6. 集成的第三方/依赖模块

仓库中也集成了一些比赛和开发中使用到的 ROS 相关包，例如：

* `apriltags2`
* `apriltags2_ros`
* `better_astar_global_planner-main`
* `openvino`
* `range_sensor_layer`
* `ros_astra_camera-master`
* `rplidar_ros`
* `waterplus_map_tools`

这些模块主要为感知、规划、驱动和系统集成提供支持。

## 🛠️ 硬件架构

### 传感器与执行机构

* **激光雷达**：用于建图、定位与障碍物检测
* **RGB-D 相机**：用于视觉感知与深度信息获取
* **麦克风阵列**：用于采集语音指令
* **电机系统**：用于底盘运动控制
* **IMU**：用于姿态信息反馈

### 控制系统

* **下位机**：负责底层电机及硬件控制
* **上位机**：运行 ROS，负责感知、决策、导航与任务调度
* **通信方式**：包括 CAN、串口、USB 等

## 🧠 软件架构说明

### ROS 导航系统

项目基于 ROS 导航框架进行开发，完成了机器人在比赛场景中的：

* 地图构建
* 自主定位
* 路径规划
* 动态避障
* 多目标点导航

### 语音处理系统

语音模块支持从语音输入到结果播报的完整处理流程，可用于比赛中的交互式任务执行。

### 视觉处理系统

视觉模块用于实现跟踪、检测等功能，支撑机器人完成与目标对象相关的比赛任务。

### 底层控制系统

机器人底层包含电机控制、反馈闭环与整机通信能力，为上层 ROS 模块提供执行基础。

## 📁 仓库结构

```text
.
├── mini2_ws/              # ROS catkin 工作空间（现已开源）
├── Technical_Report.pdf   # 技术报告
├── LICENSE                # 开源许可证
├── README.md              # 英文说明
└── README.zh-CN.md        # 中文说明
```

## 🚀 快速开始

> 注意：本项目为比赛机器人工作空间。
> 部分模块依赖特定硬件、ROS 环境、驱动、SDK 或外部库，请根据你的平台进行适配。

### 1. 克隆仓库

```bash
git clone https://github.com/lurenjia384/robocup-ros-robot-champion.git
cd robocup-ros-robot-champion/mini2_ws
```

### 2. 编译工作空间

```bash
catkin_make
source devel/setup.bash
```

### 3. 参考启动方式

可以根据具体环境，从如下模块开始尝试：

```bash
# 建图
roslaunch robot_slam gmapping.launch

# 导航
roslaunch robot_slam navigation.launch

# 语音模块
roslaunch robot_voice iat_publish.launch
roslaunch robot_voice robot_tts.launch

# 机械臂模块
roslaunch mini2_arm control_center.launch
```

不同平台的传感器、驱动、参数文件和依赖环境可能不同，请按你的实际设备进行调整。

## 🏆 比赛成绩

* **赛事名称**：2023 中国机器人大赛暨 RoboCup 中国公开赛（视觉赛）
* **比赛结果**：**冠军 / 第一名**
* **成绩表现**：满分成绩，且完成速度最快

## 📘 技术报告

仓库中同时保留了完整技术报告：

* `Technical_Report.pdf`

如果你更希望先从整体方案、硬件架构和比赛背景入手，建议先阅读技术报告，再结合代码理解实现细节。

## 🔭 后续可改进方向

基于赛后分析，项目后续仍可继续优化，例如：

* 多传感器融合，提升环境感知稳定性
* 改进全局/局部规划协同策略
* 升级视觉识别算法，提高鲁棒性
* 优化导航与控制参数，提升整体流畅性
* 完善工程文档与依赖说明，增强复现性

## 👥 团队信息

* **队长**：杨常川 —— 软硬件系统集成
* **成员**：王粲 —— 软硬件开发
* **成员**：邵昊洋 —— 系统维护与调试
* **指导老师**：刘安东、滕游

*浙江工业大学 – BOOM不了一点队*

## 📚 引用

如果本项目对你的学习或研究有所帮助，欢迎引用技术报告或标注本仓库地址：

```bibtex
@techreport{zjut_robocup2023,
  title={2023 China Robot Competition \& RoboCup China Open Technical Report},
  author={Yang, Changchuan and Wang, Can and Shao, Haoyang},
  institution={Zhejiang University of Technology},
  year={2023}
}
```

## 📝 License

本项目采用 **BSD 3-Clause License** 开源协议，详见 [LICENSE](LICENSE)。

---

如果你对项目感兴趣，欢迎提交 Issue 交流。
