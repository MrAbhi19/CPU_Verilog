module adder #(
  parameter SIZE = 4
)(
  input  wire [SIZE-1:0] A,
  input  wire [SIZE-1:0] B,
  output reg  [SIZE:0]   Y
);
  always @(*) begin
    Y = A + B;
  end
endmodule
