module adder(     //Adder module
  input [7:0] a,
  input [7:0] b,
  output [8:0] sum
);
  assign sum=a+b;
endmodule  

module sub(         //Subtractor module
  input [7:0] a,
  input [7:0] b,
  output [8:0] diff
);
  assign diff=a-b;
endmodule

module and_gate(    //AND module
  input [7:0] a,
  input [7:0] b,
  output [7:0] y
);
  assign y=a&b;
endmodule

module or_gate(      //OR module
  input [7:0] a,
  input [7:0] b,
  output [7:0] y
);
  assign y=a|b;
endmodule

module shift(         //Shift module
  input [7:0] a,
  output [7:0] y
);
  assign y=a<<1;
endmodule

module compare(        //Comparator module
  input [7:0] a,
  input [7:0] b,
  output gt,
  output lt,
  output eq
);
  assign gt= (a>b)?1'b1 : 1'b0;
  assign lt = (a < b) ? 1'b1 : 1'b0;
  assign eq = (a == b) ? 1'b1 : 1'b0;
endmodule

module alu (
  input [7:0] a, b,
  input [2:0] op_code,  // 3-bit control signal
  output reg [8:0] result,
  output reg gt, lt, eq
);
  wire [8:0] sum, diff;
  wire [7:0] and_out, or_out, shift_out;

  adder u_add (.a(a), .b(b), .sum(sum));
  sub u_sub (.a(a), .b(b), .diff(diff));
  and_gate u_and (.a(a), .b(b), .y(and_out));
  or_gate u_or (.a(a), .b(b), .y(or_out));
  shift u_shift (.a(a), .y(shift_out));
  compare u_cmp (.a(a), .b(b), .gt(gt), .lt(lt), .eq(eq));

  always @(*) begin
    case (op_code)
      3'b000: result = sum;
      3'b001: result = diff;
      3'b010: result = {1'b0, and_out};
      3'b011: result = {1'b0, or_out};
      3'b100: result = {1'b0, shift_out};
      3'b101: result = {8'b0, gt};  // example: just output gt flag
      default: result = 9'b0;
    endcase
  end
endmodule
