# ROS-Based Intelligent Robot for RoboCup China Open 2023 🏆

[![YouTube Demo](https://img.shields.io/badge/YouTube-Watch%20Demo-red?logo=youtube)](https://www.youtube.com/watch?v=J3KhlBPvCa0)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

This repository contains the technical report and software implementation of our champion robot developed for the **2023 China Robot Competition & RoboCup China Open (Vision Challenge)**. Our robot achieved a perfect score and the fastest time, securing **first place** in its category, outperforming strong teams from top universities such as Beijing Institute of Technology and Hunan University.

## 🎥 Demo Video

Click the image below to watch the full demonstration:

[![Robot Demo Video](https://img.youtube.com/vi/J3KhlBPvCa0/0.jpg)](https://www.youtube.com/watch?v=J3KhlBPvCa0)

The video showcases:
- Voice command recognition
- Real-time path planning and zero-stop obstacle avoidance (A* global + DWA local)
- Face detection and tracking using OpenCV
- Full competition run

---

## 📄 Project Overview

This project developed an intelligent robot based on the **ROS (Robot Operating System)** architecture, capable of simultaneously performing three core functions: voice recognition, dynamic obstacle avoidance navigation, and face recognition. The system integrates multiple sensors including LiDAR, RGB-D camera, and microphone array, and leverages state-of-the-art path planning and computer vision algorithms.

## 🚀 Key Features

| Feature | Implementation |
|---------|----------------|
| **Navigation** | SLAM with LiDAR, Dijkstra (global planning), DWA (local planning) |
| **Voice Recognition & Synthesis** | iFlytek (科大讯飞) deep learning engine |
| **Face Recognition** | OpenCV template matching (with potential for deep learning upgrade) |
| **Hardware Control** | STM32 (GD32F103) + CAN bus motor drivers |
| **Chassis** | Mecanum wheels for omnidirectional movement |

## 🛠️ Hardware Architecture

### Sensors & Actuators
- **LiDAR**: SLAMTEC (triangulation-based) for mapping and obstacle detection
- **RGB-D Camera**: Structured-light depth camera for visual perception
- **Microphone Array**: For voice command acquisition
- **Motors**: 4x DC geared motors with 16-line encoders (131.3:1 reduction)
- **IMU**: ICM20602 gyroscope for orientation feedback

### Control Unit
- **Lower-level controller**: GD32F103RCT6 microcontroller (STM32-compatible)
- **Upper-level processor**: Onboard PC running ROS
- **Communication**: CAN bus for motor control, USB/UART for sensors

### Power System
- 12V Li-ion battery with step-down converters (12V→5V→3.3V→1.8V)

## 💻 Software Architecture

### ROS Navigation Stack
We used the ROS `move_base` framework with:
- **Global Planner**: Dijkstra's algorithm on a costmap with inflation layers
- **Local Planner**: Dynamic Window Approach (DWA) for real-time obstacle avoidance

### Face Recognition
Template matching using normalized cross-correlation. The algorithm slides a template image across the source image to find the best match.

### Voice Processing
Speech recognition and synthesis based on iFlytek's deep learning models, enabling natural language command parsing.

### Motor Control
Closed-loop PID control with encoder feedback. Four independent motor drivers communicate via CAN bus with individual IDs.

## 📁 Repository Structure

```
├── Technical_Report.pdf      # Full technical report (in Chinese)
├── LICENSE                   # License file
└── README.md                 # README file
```

## 🏆 Competition Achievement

- **Event**: 2023 China Robot Competition & RoboCup China Open – Vision Challenge
- **Result**: **First Place (Champion)** with perfect score and fastest completion time
- **Competitors**: Beat robotics teams from Beijing Institute of Technology, Hunan University, and other top universities

## 🧪 Future Improvements

Based on our post-competition analysis, potential enhancements include:
- Multi-sensor fusion to improve LiDAR accuracy
- Hybrid path planning (combining Dijkstra with A* or genetic algorithms)
- Deep learning-based face recognition (CNN) for better robustness to lighting and angle variations
- Advanced filtering (e.g., Kalman filters) for improved navigation stability

## 👥 Team

- **Captain**: Yang Changchuan (杨常川) – Hardware/Software integration
- **Member**: Wang Can (王粲) – Hardware/Software development
- **Member**: Shao Haoyang (邵昊洋) – System maintenance and debugging
- **Advisors**: Liu Andong (刘安东), Teng You (滕游)

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

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

For questions or collaborations, feel free to open an issue or contact us!
