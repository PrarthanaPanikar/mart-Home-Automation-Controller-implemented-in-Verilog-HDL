# 🏠 Smart Home Automation Controller on FPGA

A Verilog HDL based Smart Home Automation Controller that automates lighting, temperature control, security monitoring, and energy-saving operations. The design is verified using Icarus Verilog & GTKWave and synthesized using Yosys.

---

## 📌 Table of Contents

* [Overview](#-overview)
* [Problem Statement](#-problem-statement)
* [Project Objectives](#-project-objectives)
* [System Architecture](#-system-architecture)
* [Automation Logic](#-automation-logic)
* [Input Signals](#-input-signals)
* [Output Signals](#-output-signals)
* [RTL Design](#-rtl-design)
* [Testbench Verification](#-testbench-verification)
* [Simulation Results](#-simulation-results)
* [Yosys Synthesis Results](#-yosys-synthesis-results)
* [RTL Schematic](#-rtl-schematic)
* [Tools Used](#-tools-used)
* [Project Structure](#-project-structure)
* [How to Run](#-how-to-run)
* [Applications](#-applications)
* [Future Improvements](#-future-improvements)
* [Learning Outcomes](#-learning-outcomes)
* [Author](#-author)
* [Acknowledgements](#-acknowledgements)

---

# 📖 Overview

This project implements a Smart Home Automation Controller using Verilog HDL. The controller monitors multiple sensor inputs and automatically controls household appliances such as lights, fans, air conditioning systems, and security alarms.

The design demonstrates key FPGA and VLSI concepts including:

* RTL Design
* Sequential Logic
* Combinational Logic
* Priority-Based Control Logic
* Testbench Verification
* Waveform Analysis
* Logic Synthesis using Yosys

---

# 🎯 Problem Statement

Traditional home systems require manual control of appliances, leading to energy wastage and limited security.

This project automates appliance control using sensor-based decision making and security monitoring to improve:

* Energy Efficiency
* User Convenience
* Home Security
* Automated Control

---

# 🎯 Project Objectives

* Design a Smart Home Controller using Verilog HDL
* Automate lighting and temperature control
* Implement security alarm functionality
* Support manual override operation
* Verify functionality using simulation
* Synthesize the design using Yosys

---

# 🏗️ System Architecture

```text
Motion Sensor ----\
Dark Sensor -------> Smart Home Controller -----> Light
Temp Sensor ------/                             -> Fan
                                                 -> AC

Door Sensor ------\
Security Mode -----> Alarm Logic -------------> Alarm

Manual Override --> Priority Control

No Motion -------> Energy Saving Logic
```

---

# ⚙️ Automation Logic

| Condition                          | Action                |
| ---------------------------------- | --------------------- |
| Motion Detected + Dark Environment | Light ON              |
| Temperature High                   | Fan ON + AC ON        |
| Security Mode + Door Open          | Alarm ON              |
| Manual Override Enabled            | User Control Priority |
| No Motion Detected                 | Energy Save ON        |

---

# 📥 Input Signals

| Signal          | Description                |
| --------------- | -------------------------- |
| clk             | System Clock               |
| reset           | Reset Signal               |
| motion_sensor   | Motion Detection Input     |
| dark_sensor     | Low Light Detection        |
| temp_high       | High Temperature Indicator |
| door_open       | Door Status Input          |
| manual_override | Manual User Control        |
| security_mode   | Security System Enable     |

---

# 📤 Output Signals

| Signal      | Description             |
| ----------- | ----------------------- |
| light       | Light Control           |
| fan         | Fan Control             |
| ac          | Air Conditioner Control |
| alarm       | Security Alarm          |
| energy_save | Energy Saving Indicator |

---

# 🔧 RTL Design

The controller is implemented using synchronous Verilog RTL.

Main features:

* Priority-based decision making
* Sensor-driven automation
* Security monitoring
* Energy-saving functionality
* Reset handling

---

# 🧪 Testbench Verification

The testbench verifies:

* Motion + Dark Condition
* Temperature High Condition
* Security Alarm Condition
* Manual Override Condition
* Energy Saving Condition

Waveforms are generated using GTKWave.

---

# 📈 Simulation Results

Simulation was performed using:

* Icarus Verilog
* GTKWave

Generated Output:

```bash
iverilog -o home_sim rtl/smart_home_controller.v tb/smart_home_tb.v
vvp home_sim
```

---

# 📊 Yosys Synthesis Results

### Synthesis Statistics

```text
24 wires
13 ports
16 cells

5  $adff
2  $logic_and
9  $mux
```

The synthesis confirms successful conversion of RTL logic into FPGA-implementable hardware resources.

---

# 🔲 RTL Schematic

Generated using Yosys Graphviz backend.

The schematic illustrates:

* Input Logic
* Multiplexers
* Flip-Flops
* Control Paths
* Output Logic

---

# 🛠️ Tools Used

| Tool           | Purpose                  |
| -------------- | ------------------------ |
| Verilog HDL    | RTL Design               |
| Icarus Verilog | Simulation               |
| GTKWave        | Waveform Analysis        |
| Yosys          | Logic Synthesis          |
| Graphviz       | RTL Schematic Generation |
| GitHub         | Version Control          |

---

# 📂 Project Structure

```text
Smart-Home-Automation-FPGA
│
├── rtl/
│   └── smart_home_controller.v
│
├── tb/
│   └── smart_home_tb.v
│
├── simulation/
│   └── synth.ys
│
├── waveforms/
│   └── home.vcd
│
├── reports/
│   └── rtl_schematic.png
│
├── images/
│   ├── 02_rtl_code.png
│   ├── 03_testbench_code.png
│   ├── 05_waveform_full.png
│   ├── 08_yosys_synthesis.png
│   └── 09_rtl_schematic.png
│
├── docs/
│   └── Smart_Home_Automation_Controller_Report.pdf
│
└── README.md
```

---

# ▶️ How to Run

### Compile

```bash
iverilog -o home_sim rtl/smart_home_controller.v tb/smart_home_tb.v
```

### Simulate

```bash
vvp home_sim
```

### Open Waveform

```bash
gtkwave home.vcd
```

### Synthesis

```bash
yosys -s simulation/synth.ys
```

---

# 🌍 Applications

* Smart Homes
* Building Automation
* Energy Management
* Security Systems
* Industrial Automation
* IoT Control Platforms

---

# 🚀 Future Improvements

* FSM-Based Controller
* PWM-Based Dimming
* UART Communication
* ESP32 Integration
* MQTT Support
* Home Assistant Integration
* Real FPGA Deployment

---

# 📚 Learning Outcomes

* Verilog HDL Design
* RTL Development
* Testbench Creation
* Waveform Analysis
* Logic Synthesis
* FPGA Design Flow
* Hardware Verification

---

# 👩‍💻 Author

**Prarthana Panikar**

Computer Science Engineering Student

Interested in:

* VLSI Design
* FPGA Development
* Digital Design
* Embedded Systems
* IoT Systems

---

# 🙏 Acknowledgements

Special thanks to **Umesh Yadhav Sir** for guidance and support throughout the learning journey.

#EDCIITDelhi
