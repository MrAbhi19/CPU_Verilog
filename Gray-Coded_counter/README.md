# Gray-Coded Counter

## Overview
This module implements a **Gray-coded counter** in Verilog.  
- Internally uses a binary counter.  
- Converts the binary count to **Gray code** using `(binary >> 1) ^ binary`.  
- Only **one bit changes per step**, making it ideal for asynchronous designs, encoders, and FIFO pointers.  
- Includes an **enable (`en`) signal** to control whether the counter updates or holds its value.  
- Reset initializes both binary and Gray outputs to `0`.

---
## Example Usage
To use this module, download `gray_counter.v` from this repository and place it in your project directory. Then instantiate it in your design as shown below.

```verilog
gray_counter #(.SIZE(8)) u_gray_counter (
  .clk(clk),
  .reset(rst),
  .en(enable),
  .gray(gray_value)
);
```
