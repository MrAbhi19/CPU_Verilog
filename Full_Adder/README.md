# Parameterized Adder

## Overview
This module implements a **parameterized adder** in Verilog.  
- Adds two input vectors `A` and `B` of width `SIZE`.  
- Produces an output `Y` that is `SIZE+1` bits wide to accommodate the carry.  
- The parameter `SIZE` allows easy scaling of the adder width.  

---
## Example Usage

To use this module, download `adder.v` from this repository and place it in your project directory.  
Then instantiate it in your design as shown below.

```verilog
adder #(.SIZE(4)) u_adder (
  .A(input_a),
  .B(input_b),
  .Y(sum_out)
);
