# 4-Bit Array Multiplier using Verilog

<p align="left">
  <img src="https://img.shields.io/badge/Design-Verilog-blue.svg" alt="Design Language">
  <img src="https://img.shields.io/badge/Tool-Xilinx%20Vivado%202020.1-orange.svg" alt="Tool">
  <img src="https://img.shields.io/badge/FPGA-Artix--7-brightgreen.svg" alt="FPGA">
  <img src="https://img.shields.io/badge/Design%20Flow-Front--End-brightgreen.svg" alt="Flow">
</p>

---

## 📖 Design Description

### 4-Bit Array Multiplier

The 4-bit Array Multiplier performs multiplication of two 4-bit binary inputs `A` and `B`.

The multiplier generates an 8-bit product from the two 4-bit input values.

### Verification Strategy

The verification testbench applies different combinations of:

- 4-bit input `A`
- 4-bit input `B`

The resulting 8-bit `product` is observed during simulation.

---

## 🎯 Objectives

- Design a 4-bit Array Multiplier using Verilog HDL.
- Multiply two 4-bit binary inputs.
- Verify the multiplication operation using a Verilog testbench.
- Analyze the logic diagram, block diagram, and RTL schematic.
- Assign FPGA I/O pins for switches and LEDs.
- Implement the design on the EDGE Artix-7 FPGA board.
- Verify the product using the FPGA switches and LEDs.

---

## ⚙️ Target Hardware & Device Specifications

* **Target FPGA Device:** `xc7a35tftg256-1`
* **Target Board:** EDGE Artix-7 FPGA Board

| Component | Nomenclature | Technical Meaning |
| :--- | :--- | :--- |
| **`xc7`** | FPGA Family | **Xilinx 7-Series FPGA** |
| **`a35t`** | Device | **Artix-7 35T FPGA** |
| **`ftg256`** | Package | **256-pin FTG package** |
| **`-1`** | Speed Grade | **Speed Grade -1** |

---

## 🚀 Features

| Signal | Functionality |
| :--- | :--- |
| `A[3:0]` | **Input A:** 4-bit binary input. |
| `B[3:0]` | **Input B:** 4-bit binary input. |
| `product[7:0]` | **Product:** 8-bit multiplication result. |

The design includes:

- 4-bit binary multiplication
- Partial product generation
- Array multiplier structure
- Verilog HDL
- FPGA implementation

---

## 📂 Project Structure

```text
Array-Multiplier
|
├── array_multiplier.v
├── array_multiplier_tb.v
├── Logic Diagram.png
├── Block Diagram.png
├── Slide Switches.png
├── LEDs.png
├── Simulation.png
├── Schematic.png
├── Timing Summary.png
├── Power.png
├── Utilization.png
├── FPGA Board.png
│
└── README.md
```

---

## 🛠️ Tools Used

* **Verilog HDL**
* **Xilinx Vivado 2020.1**
* **Vivado Simulator**
* **EDGE Artix-7 FPGA Board**

---

## 🔄 Verification Flow

1. **Simulation:** Simulate the 4-bit Array Multiplier using the Verilog testbench.
2. **Logic Diagram:** Analyze the logic structure of the Array Multiplier.
3. **Block Diagram:** Analyze the block diagram showing the input and output connections.
4. **Schematic:** Generate and analyze the Vivado schematic.
5. **I/O Planning:** Assign the 4-bit inputs to the FPGA slide switches and the 8-bit product to the LEDs.
6. **Pin Assignment:** Assign the required FPGA package pins according to the EDGE Artix-7 board.
7. **XDC File:** Save the assigned I/O constraints in the Vivado XDC file and verify that the assignments are saved correctly.
8. **Synthesis:** Run synthesis in Vivado.
9. **Implementation:** Run implementation after successful synthesis.
10. **Bitstream:** Generate the FPGA bitstream.
11. **FPGA Programming:** Program the generated bitstream onto the EDGE Artix-7 FPGA board.
12. **Hardware Verification:** Verify the 8-bit product using the assigned switches and LEDs.

---
## 🧱 Block Design & HDL Wrapper

The Vivado Block Design is used to connect the Array Multiplier with the BCD conversion and seven-segment display logic.

### Creating the Block Design

1. Select **Create Block Design** from the Vivado IP Integrator section.
2. Enter a suitable name for the block design.
3. Set the required connections according to the block diagram.
4. For the required input signals, select **Make External**.
5. Add the `uut` design to the block design.
6. Add the `bin2bcd` module for binary-to-BCD conversion.
7. Add the `segment` module for the seven-segment display.
8. Connect the modules according to the block diagram.
9. Select **Regenerate Layout** to arrange the blocks.
10. Select **Validate Design** to check the block design connections.
11. Click on the block design name.
12. Select **Create HDL Wrapper**.
13. Select **Let Vivado manage wrapper and auto-update**.
14. Set the generated HDL wrapper as the **Top** module.
15. The design can now be **Elaborated Design** to view the complete block-level implementation.
    
### I/O Pin Assignment

For 4-bit switch operations, the pins are assigned from right to left.

The rightmost/top-side pin is considered the **LSB**, while the fourth/bottom-side pin is considered the **MSB**.

| Bit | Position |
| :--- | :--- |
| `bit[0]` | Rightmost / first pin |
| `bit[1]` | Second pin |
| `bit[2]` | Third pin |
| `bit[3]` | Fourth pin / MSB |

The first four switches are used for input `A` and the next four switches are used for input `B`.

The 8-bit `product[7:0]` output is connected to the LEDs.

### Slide Switches

The slide switches are used as the **digital inputs** to provide the two 4-bit binary values `A` and `B` to the FPGA design.

### LEDs

The LEDs are used to display the **8-bit product output** generated by the Array Multiplier.

---

## 📊 Simulation Results

The simulation verifies the multiplication operation for different combinations of `A` and `B`.

The testbench applies the input values and observes the corresponding 8-bit `product`.

### Simulation Waveform

<img width="1920" height="1080" alt="simulation" src="https://github.com/user-attachments/assets/786de1ae-a17b-4127-aba1-16ae99635302" />


---

## 🌊 Waveform Verification

The waveform is used to observe the two 4-bit inputs and the resulting 8-bit product during simulation.

The waveform verifies:

- Correct `A` input
- Correct `B` input
- Correct partial product operation
- Correct 8-bit product generation

---

## 🧩 Logic Diagram

<img width="1038" height="615" alt="logic_diagram" src="https://github.com/user-attachments/assets/0a291c09-99c7-4f4d-858a-3192b0bcc40e" />


The logic diagram shows the structure of the 4-bit Array Multiplier and its partial product generation.

---

## 🧱 Block Diagram

<img width="1920" height="1080" alt="block_diagram" src="https://github.com/user-attachments/assets/43769477-f1c5-40d8-915f-a32f4d87af1e" />


The block diagram shows the flow of the two 4-bit inputs through the Array Multiplier to produce the 8-bit product.

---

## 🔧 RTL Schematic
<img width="1920" height="1080" alt="RTLschematic" src="https://github.com/user-attachments/assets/b3aae9b2-b23c-4731-ab5a-0ac528894f3d" />


The RTL schematic generated in Vivado shows the implemented logic structure of the 4-bit Array Multiplier.

---

## ⏱️ Timing Summary

<img width="1920" height="1080" alt="timing" src="https://github.com/user-attachments/assets/ed7d2cf1-d1c3-455d-9aa2-26ff596641e0" />


The timing summary generated by Vivado provides the timing information of the implemented design.

---

## ⚡ Power Analysis

<img width="1920" height="1080" alt="power" src="https://github.com/user-attachments/assets/016caaed-cb20-467f-b047-1285c6f89bfd" />


The Vivado power report provides the power information for the implemented design.

---

## 📈 Utilization Report

<img width="1920" height="1080" alt="utilization" src="https://github.com/user-attachments/assets/0cb40333-1a68-46ee-821e-6415ddd4742b" />


The utilization report shows the FPGA resources used by the implemented Array Multiplier.

---

## 💻 FPGA Implementation

<img width="1600" height="738" alt="FPGA1" src="https://github.com/user-attachments/assets/2059a925-7886-4709-9fbd-9a7b956f2c89" />

<img width="1600" height="738" alt="FPGA2" src="https://github.com/user-attachments/assets/6665c616-d5f8-4e0f-9a62-c45ea39af487" />


The 4-bit Array Multiplier is programmed onto the EDGE Artix-7 FPGA board and verified using the slide switches and LEDs.

### Hardware Verification

The first four slide switches are used to provide the 4-bit input `A`, and the next four slide switches are used to provide the 4-bit input `B`.

The resulting 8-bit `product[7:0]` is displayed using the LEDs.

For a 4-bit multiplication:

```text
A × B = product[7:0]
```

The output LEDs display the corresponding 8-bit product.

---

## 🎯 Learning Outcomes

* Understanding the working of a 4-bit Array Multiplier.
* Implementing binary multiplication using Verilog HDL.
* Understanding partial product generation.
* Developing and simulating a Verilog testbench.
* Generating and analyzing an RTL schematic using Vivado.
* Performing FPGA I/O planning and pin assignment.
* Running synthesis and implementation in Vivado.
* Generating a bitstream and programming an Artix-7 FPGA board.

---

## 📱 Applications

- Digital Arithmetic Circuits
- ALU Design
- Processor Datapaths
- FPGA-Based Digital Systems
- Binary Multiplication Circuits

---

## 📫 Connect with Me

- **GitHub:** [github.com/sairam-jampani](https://github.com/sairam-jampani)
- **LinkedIn:** [linkedin.com/in/sai-ram-jampani04](https://linkedin.com/in/sai-ram-jampani04/)

<br>

⭐ *If you found this project useful, consider giving it a star.*
