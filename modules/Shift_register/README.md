# Shift Register Modules (Verilog)

This document explains the four fundamental shift regsiter modules implemented: **SISO, SIPO, PISO, and PIPO**. Each module is parameterized for flexibility and designed with enable/reset signals for integration into larger systems.

---

## 1. SISO (Serial-In Serial-Out)
- **Function:** Shifts data in serially and outputs serially.
- **Ports:**
  - `in`: Serial input bit
  - `out`: Serial output bit
  - `clk`: Clock
  - `reset`: Reset (clears register)
  - `enable`: Enables shifting
- **Use case:** Delay lines, bit storage.

---

## 2. PIPO (Parallel-In Parallel-Out)
- **Function:** Loads and outputs a parallel word directly.
- **Ports:**
  - `in [SIZE-1:0]`: Parallel input word
  - `out [SIZE-1:0]`: Parallel output word
  - `clk`, `reset`, `enable`
- **Use case:** Data buffering, temporary storage.

---

## 3. SIPO (Serial-In Parallel-Out)
- **Function:** Converts serial input into a parallel word.
- **Ports:**
  - `in`: Serial input bit
  - `out [SIZE-1:0]`: Parallel output word
  - `done`: Pulses high when word is complete
  - `busy`: High while shifting
- **Parameters:**
  - `SIZE`: Word width
  - `SHIFT_DIR`: 0 = LSB-first, 1 = MSB-first
- **Use case:** UART/SPI receivers.

---

## 4. PISO (Parallel-In Serial-Out)
- **Function:** Loads a parallel word and shifts it out serially.
- **Ports:**
  - `in [SIZE-1:0]`: Parallel input word
  - `out`: Serial output bit
  - `done`: Pulses high when word is fully shifted
  - `busy`: High while shifting
- **Parameters:**
  - `SIZE`: Word width
  - `SHIFT_DIR`: 0 = LSB-first, 1 = MSB-first
- **Use case:** UART/SPI transmitters.

---

## 4. PIPO (Parallel-In Parallel-Out)
- **Function:** Loads and outputs a parallel word directly.
- **Ports:**
  - `in [SIZE-1:0]`: Parallel input word
  - `out [SIZE-1:0]`: Parallel output word
  - `clk`, `reset`, `enable`
- **Use case:** Data buffering, temporary storage.

---

## 🔧 Notes
- All modules are **parameterized** (`SIZE`, `SHIFT_DIR`) for reusability.
- `enable` ensures controlled operation.
- `done` and `busy` provide handshake signals for integration.

---
