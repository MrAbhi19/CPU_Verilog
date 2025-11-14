# Bidirectional Counter (with Enable)

## Overview
This module implements a **parameterized bidirectional counter** in Verilog.  
- Counts **up** when `dir = 0`  
- Counts **down** when `dir = 1`  
- Wraps around at `SIZE-1 → 0` (up) and `0 → SIZE-1` (down)  
- Includes an **enable (`en`) signal** to control whether the counter updates or holds its value.  
- Reset initializes the counter to `0`.

---
## Example Usage 

To use this module, download `bi_count.v` from this repository and place it in your project directory. Then instantiate it in your design as shown below.

```verilog
bi_count #(.SIZE(16)) u_counter (
  .clk(clk),
  .reset(rst),
  .dir(direction),
  .en(enable),
  .out(count_value)
);
