module uart_rx(clk,rx_line,reset,data,rx_busy,rx_done,rx_error);
  parameter clk_freq=50000000;
  parameter baud_rate=9600;
  
  input wire rx_line,clk,reset;
  output reg [7:0] data;
  output reg rx_busy,rx_done,rx_error;
  localparam clks_per_bit=clk_freq/baud_rate;
  reg [15:0] clk_count;
  reg [3:0] bit_index;
  reg [9:0] s_reg;

  always@(posedge clk or posedge reset)begin
    if(reset)begin
      rx_done<=0;
      rx_busy<=0;
      clk_count<=0;
      bit_index<=0;
      rx_error<=0;
      s_reg<=0;
    end else begin
      if (rx_line && !rx_busy) begin
        rx_busy<=1;
        rx_done<=0;
        clk_count<=0;
        bit_index<=0;
      end else if (rx_busy) begin
        if (clk_count<clks_per_bit-1)
          clk_count<=clk_count+1;
        else begin
          clk_count<=0;
          bit_index<=bit_index+1;
          s_reg[bit_index]<=rx_line;
          if (bit_index==9) begin
            rx_busy<=0;
            rx_done<=1;
            data<=s_reg[8:1];
            rx_error<= (s_reg[0]!=1'b0)||(s_reg[9]!=1'b0);
          end
        end
      end
    end
  end
endmodule
