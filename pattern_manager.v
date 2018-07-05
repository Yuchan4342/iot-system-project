module pattern_manager (
  input CLOCK10M,
  input [9:0] counter10h,
  input [17:0] pattern_with_timestamp,
  output [7:0] pattern_out
);
  reg [9:0] patterns [1023:0];
  
  always @ (posedge CLOCK10M) begin
    patterns[pattern_with_timestamp[17:8]] <= pattern_with_timestamp[7:0];
  end

  assign pattern_out = patterns[counter10h[9:0]];
endmodule
