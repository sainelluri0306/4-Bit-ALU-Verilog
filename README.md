# 4-Bit-ALU-in-Verilog

This project is a **4-bit Arithmetic Logic Unit (ALU)** built from basic logic modules in Verilog. The ALU performs five operations:  

- **AND**  
- **OR**  
- **XOR**  
- **ADD**  
- **SUBTRACT**  

The design is written in a **modular way**, where each operation (AND, OR, XOR, ADD, SUB) is implemented in its own Verilog file. A **top-level ALU module** (`alu4bit.v`) acts as a multiplexer, selecting which operation to perform based on a control signal (`alu_sel`).  

---

## ALU Operation Codes

The ALU uses a **3-bit selector (`alu_sel`)** to control the operation:  
- 000 → AND
- 001 → OR
- 010 → XOR
- 011 → ADD
- 100 → SUBTRACT
- others → 0000 (default output)


The result is output on a 4-bit bus (`alu_out`), with an optional carry-out signal for ADD and SUB operations.  

---

## Files

- **and4.v** – 4-bit AND gate module  
- **or4.v** – 4-bit OR gate module  
- **xor4.v** – 4-bit XOR gate module  
- **add4.v** – 4-bit ripple-carry adder  
- **sub4.v** – 4-bit subtractor (built using adder + two’s complement)  
- **alu4bit.v** – Top-level ALU module (connects all operations together)  
- **tb_alu4bit.v** – Testbench to verify ALU functionality  

---

## How It Works

1. Inputs `a` and `b` are two 4-bit values.  
2. The **selector (`alu_sel`)** chooses which operation the ALU performs.  
3. The selected operation’s output is routed to `alu_out`.  
4. The **testbench** applies a series of inputs and control signals, displaying the results for each operation.  

---

## Example Simulation Output

For `a = 0101 (5)` and `b = 0011 (3)`:  
- AND → 0001 (1)
- OR → 0111 (7)
- XOR → 0110 (6)
- ADD → 1000 (8)
- SUB → 0010 (2)

---

## Summary

This project demonstrates the **basics of digital design**, including logic gates, adders, modular design, and testbench-driven verification in Verilog.  

