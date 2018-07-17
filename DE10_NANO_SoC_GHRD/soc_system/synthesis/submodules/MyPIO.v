module MyPIO (
  //clock&reset of system
  input wire reset,
  input wire clk,
  
  //avalon_slave
  input wire [1:0] address,
  input wire read,
  output reg [31:0] readdata,
  input wire write,
	  // writedata[31:15] pattern_input
	  // writedata[7:0] user_input
	  //writedata[*:*] discarded
  input wire [31:0] writedata,
  
  input wire [1:0] key,
  input wire [3:0] switch,
  output reg [7:0] pattern_keys,
  output reg [7:0] user_keys,
  output reg [11:0] seg_output,
  output reg [7:0] led
);

iot_system_project iot_system_project (
  clk,
  write & (address == 2'b00),
  key,
  switch,
  writedata[31:15],
  writedata[7:0],
  pattern_keys,
  user_keys,
  seg_output,
  led
);
endmodule
