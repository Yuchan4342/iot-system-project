module score_calculator (
  input counter10h,
  input [7:0] pattern,
  input [7:0] user_input,
  input reset,
  output [10:0] score_out
);
  reg [7:0] current_pattern = 7'h00;
  reg [2:0] current_score = 0;
  reg [10:0] global_score = 0;
  reg rev_flag = 0;
  always @ (posedge counter10h, posedge reset) begin
    if (reset) begin
		 global_score = 0;
		 current_score = 0;
	 end else begin
		 if (pattern != current_pattern) begin
			current_pattern <= pattern;
			current_score <= 3'o0;
			rev_flag <= 0;
		 end else if (user_input == current_pattern) begin
			global_score <= global_score + current_score;
			current_score <= 3'o0;
			rev_flag <= 0;
		 end else begin
			current_score <= ~rev_flag ? current_score + 1 : (current_score == 8'o0 ? 8'o0 : current_score - 1);
			rev_flag <= current_score == 8'o4 ? 1 : rev_flag;
		 end
	 end
  end
  
  assign score_out = global_score;
endmodule
