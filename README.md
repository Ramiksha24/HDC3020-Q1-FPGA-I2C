# HDC3020-Q1 FPGA I²C Master (Verilog)

Fully synthesizable I²C Fast-Mode (400 kHz) master controller written in Verilog to interface with the Texas Instruments **HDC3020-Q1** automotive humidity and temperature sensor.

This implementation is built from scratch (no vendor I²C IP) and validated on FPGA hardware.

---
# 🧠 System Block Diagram

![Block Diagram](BlockDiagram.png)
## Overview

This project implements a parameterized I²C master controller capable of:

- Generating START and STOP conditions  
- Handling ACK/NACK detection  
- Managing write and repeated-start read sequences  
- Implementing measurement delay timing (15 ms)  
- Reading 6-byte sensor frames (Temperature + CRC + Humidity + CRC)  

The controller is designed for FPGA deployment and models open-drain behavior using IOBUF primitives.

---

## Features

- I²C Fast-Mode (400 kHz)
- Parameterized system clock (default: 50 MHz)
- 4-phase SCL timing architecture
- Byte-level FSM design
- Open-drain SDA/SCL implementation
- 15 ms measurement wait (Low Power Mode 0)
- 6-byte read sequence (Temp + RH + CRC)
- Hardware validated on FPGA

---

## Architecture

### SCL Timing Model

The design uses a 4-phase SCL generation scheme:

| Phase | Operation     |
|-------|--------------|
| 0     | SDA setup     |
| 1     | SCL high      |
| 2     | Data sampling |
| 3     | SCL low       |

This ensures proper setup/hold timing and edge-aligned sampling.

---

### FSM States


---

### Measurement Flow

1. START condition  
2. Send write address  
3. Send trigger command (0x24 0x00)  
4. STOP condition  
5. Wait 15 ms for conversion  
6. Repeated START  
7. Send read address  
8. Read 6 bytes from sensor  
9. STOP condition  
10. Output raw temperature and humidity  

---

## Hardware Validation

**FPGA:** Artix-7  
**System Clock:** 50 MHz  
**I²C Frequency:** 400 kHz  
**Sensor Address:** 0x44  

### Measured Output (Hardware Capture)

- Temperature ≈ 50 °C  
- Humidity ≈ 10.1 %RH  

### Conversion Formulas (Datasheet)

CRC bytes from the sensor were verified against calculated CRC-8 values  
(Polynomial 0x31, Initial value 0xFF).

---
