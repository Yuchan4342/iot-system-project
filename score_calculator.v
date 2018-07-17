module score_calculator (
  input clock100m,
  input write100m,
  input [7:0] pattern,
  input [7:0] user_input,
  input reset,
  output [10:0] score_out,
  output [7:0] pattern_out
);
  reg [7:0] current_pattern = 0;
  reg [3:0] current_score = 0;
  reg [10:0] global_score = 0;
  
  always @ (posedge clock100m, posedge reset) begin
    if (reset) begin
		 global_score <= 0;
		 current_score <= 0;
		 current_pattern <= 0;
	 end else begin
	    if (write100m & user_input == current_pattern) begin
			global_score <= global_score + current_score;
			current_score <= #1 3'o0;
			current_pattern <= 0;
		 end else begin
		   if (pattern == 7'b0000000) begin
			   current_score <= (current_score == 0 ? 0 : current_score - 1);
			end else begin
				current_pattern <= pattern;
				current_score <= 4'd10;
			end
		 end
	 end
  end
  assign pattern_out = current_pattern;
  assign score_out = global_score;
endmodule
