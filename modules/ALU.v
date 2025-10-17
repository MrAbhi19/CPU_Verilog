module uartx(
  input [7:0] data,
  input tx_ready,
  input s_clk,
  output tx_line,
  output busy_flag
);
  reg [3:0] q;
  reg [9:0] s_reg=10'b1111111111;
  reg n_clk;
  reg [9:0] tx_wire=10'b0000000000;
  
  assign busy_flag=(q!=0);
  
  always@(posedge s_clk)begin
    if (q==4'd9)begin
      n_clk=1;
      q<=0;
    end
    else begin 
      q<=q+1;
      n_clk=0;
    end
  end

  always@(*) begin
    if (tx_ready)begin
      if (busy_flag) begin
        s_reg={1'b1,data,1'b1};
      end
    end
  end
  
  always@(posedge n_clk)begin
    tx_wire<={s_reg[6:0],0};
  end 
endmodule
