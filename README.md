# UdeM-IFT1227-D2

# VHDL Combinational and Sequential Logic Circuits Design

## Overview

This repository contains VHDL implementations for two key projects in computer architecture: a 4-bit two's complement to 8-bit Binary Coded Decimal (BCD) converter and a sequential logic circuit designed to output 1 when the last four sequential inputs match certain patterns (0111 or 0110), and 0 otherwise. These projects are part of an academic assignment aimed at exploring the design and simulation of combinational and sequential logic circuits.

### Projects

- **Combinational Logic Circuit**
  - Design and implementation of a 4-bit two's complement to 8-bit BCD converter, alongside a display control module for 7-segment displays.
- **Sequential Logic Circuit**
  - Implementation of a sequential logic circuit utilizing a Moore state machine to detect specific sequences of inputs.

## Directory Structure

```
.
├── files
│   ├── converter.vhdl          # VHDL module for the two's complement to BCD converter
│   └── display_control.vhdl    # VHDL module for 7-segment display control
├── fsm
│   ├── state_machine.vhdl      # VHDL code for the sequential logic circuit's Moore state machine
│   └── testbench.vhdl          # VHDL testbench for verifying the Moore state machine
└── docs
    └── report.pdf              # Detailed project report
```

## Installation and Running

### Requirements

- VHDL simulator (e.g., ModelSim, GHDL)
- FPGA synthesis tool (optional for hardware implementation)

### Simulation

To simulate the VHDL code, follow the steps appropriate for your VHDL simulator. For example, using GHDL:

```bash
ghdl -a file_name.vhdl
ghdl -e module_name
ghdl -r module_name
```

Replace `file_name.vhdl` and `module_name` with the respective file and module names you wish to simulate.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details.

## Acknowledgments

- Our gratitude goes to my instructor and peers who provided valuable feedback and insights throughout the development of these projects.
- Special thanks to all resources and tutorials that guided us in VHDL programming and digital logic design.
