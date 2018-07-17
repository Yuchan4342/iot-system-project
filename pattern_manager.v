module pattern_manager (
  input CLOCK50M,
  input write,
  input [9:0] game_timer,
  input [17:0] pattern_with_timestamp,
  output [7:0] pattern_out
);
  reg [9:0] patterns [1023:0];
  
  always @ (posedge CLOCK50M) begin
     if(write) begin
	     patterns[pattern_with_timestamp[17:8]] <= pattern_with_timestamp[7:0];
	  end
  end

  assign pattern_out = patterns[game_timer[9:0]];
endmodule
