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
wire pattern_keys_internal;
wire user_keys_internal;
wire seg_output_internal;
wire led_internal;

iot_system_project iot_system_project (
  clk,
  key,
  switch,
  writedata[31:15],
  writedata[7:0],
  pattern_keys_internal,
  user_keys_internal,
  seg_output_internal,
  led_internal
);
always @ (posedge clk, posedge reset ) begin
  if (reset) begin
  	 seg_output = 0;
 	 user_keys = 0;
	 led = 0;
  end
  else begin
	 if (write) begin
	   case (address)
		 2'b00: begin
		  pattern_keys <= pattern_keys_internal;
		  user_keys <= user_keys_internal;
		  seg_output <= seg_output_internal;
		  led <= led_internal;
		 end
	   endcase
	 end
  end
end
endmodule
