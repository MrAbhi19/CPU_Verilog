# Arithmetic Logic Unit (ALU)

## Overview
This module implements a **parameterized Arithmetic Logic Unit (ALU)** in Verilog.  
- Accepts two input operands `A` and `B` of width `SIZE`.  
- Uses a 3‑bit select signal `sel` to choose the operation.  
- Produces an output `out` that is `SIZE+1` bits wide to handle carry/borrow in arithmetic operations.  
- The ALU is **combinational** — results update immediately when inputs or `sel` change.  

Unlike other ALUs that may include shifting, multiplication, or division, **this ALU focuses on arithmetic and bitwise logic operations**. It is lightweight, modular, and easy to extend.

---

## Functionality

| `sel` | Operation | Description        |
|-------|-----------|--------------------|
| 000   | A + B     | Addition           |
| 001   | A - B     | Subtraction        |
| 010   | A \| B    | Bitwise OR         |
| 011   | A & B     | Bitwise AND        |
| 100   | A ^ B     | Bitwise XOR        |
| 101   | ~(A \| B) | Bitwise NOR        |
| 110   | ~(A & B)  | Bitwise NAND       |
| 111   | ~(A ^ B)  | Bitwise XNOR       |

This design emphasizes **basic arithmetic and logic**, making it ideal for teaching, small CPU prototypes, or FPGA experiments.  
Other ALUs may include shift/rotate, comparison, or multiplication — but this one is intentionally simple and parameterized for clarity.

---

## Example Usage

To use this module, download `ALU.v` from this repository and place it in your project directory.  
Then instantiate it in your design as shown below:

```verilog
ALU #(.SIZE(8)) u_alu (
  .A(input_a),
  .B(input_b),
  .sel(op_select),
  .out(result)
);
