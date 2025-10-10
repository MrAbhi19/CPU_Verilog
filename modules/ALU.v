module alu(       
  input [31:0] a0,b0,
  output reg [31:0] y0,
  input [2:0] sel,
  input init_a,init_b,init_y
);
  
  reg [31:0] a,b,y;

  always@(posedge init_a or init_b) begin
    if (init_a)
      a<=a0;
    if (init_b)
      b<=b0;
  end
  
  always@(*) begin
    case (sel)
      3'b000: y=a+b;
      3'b001: y=a-b;
      3'b010: y=a|b;
      3'b011: y=a&b;
      3'b100: y=a^b;
      3'b101: y=~a;
      3'b110: y= a << 1;
      3'b111: begin                      
        if (a < b)
        y = 32'd1;                      
        else if (a == b)
        y = 32'd2;                      
        else
        y = 32'd3;                     
      end
      default: y=32'd0;
    endcase
  end

  always@(posedge init_y) begin
    y0<=y;
  end 
  
endmodule
