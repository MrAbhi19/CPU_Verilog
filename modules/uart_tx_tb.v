`timescale 1ns/1ps

module uart_tx_tb;

  // Parameters
  parameter clk_freq = 1000000;  // 1 MHz for simulation
  parameter baud_rate = 9600;
  localparam clks_per_bit = clk_freq / baud_rate;

  // DUT I/O
  reg clk, reset, tx_start;
  reg [7:0] data;
  wire tx_line, tx_busy, tx_done;

  // Instantiate DUT
  uart_tx #(.clk_freq(clk_freq), .baud_rate(baud_rate)) dut (
    .clk(clk),
    .reset(reset),
    .tx_start(tx_start),
    .data(data),
    .tx_line(tx_line),
    .tx_busy(tx_busy),
    .tx_done(tx_done)
  );

  // Clock generation
  initial clk = 0;
  always #500 clk = ~clk;  // 1 MHz → 500 ns period

  // Dump waveform
  initial begin
    $dumpfile("uart_tx_tb.vcd");
    $dumpvars(0, uart_tx_tb);
  end

  // Main test sequence
  initial begin
    // Initialize
    reset = 1;
    tx_start = 0;
    data = 8'h00;
    #2000;

    // Release reset
    reset = 0;
    #1000;

    // Send first byte
    data = 8'hA5;  // 10100101
    tx_start = 1;
    #1000;
    tx_start = 0;

    // Wait for transmission to complete
    wait (tx_done);
    #2000;

    // Send second byte
    data = 8'h3C;  // 00111100
    tx_start = 1;
    #1000;
    tx_start = 0;

    wait (tx_done);
    #2000;

    // Finish simulation
    $finish;
  end

endmodule
