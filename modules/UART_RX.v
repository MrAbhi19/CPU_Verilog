module uart_rx(
  parameter clk_freq=50000000,
  parameter baud_rate=9600
)(
  input wire rx_line,
