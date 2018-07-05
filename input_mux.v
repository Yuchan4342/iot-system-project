module input_mux (
  input CLOCK10M,
  input counter10h,
  input [31:0] read_data,
  output [7:0] user_out,
  output [7:0] pattern_out
);
	reg pattern_end = 1'b0;
	
	always @ (posedge CLOCK10M) begin
		if (read_data == 32'hFFFF) begin
			pattern_end <= 1'b1
		end
	end
	
	assign pattern_end == 1'b0 ?
	pattern_manager pattern_manager(CLOCK10M, counter10h, pattern_with_timestamp, pattern);
	input_managerinput_manager(counter10h, pattern_with_timestamp[7:0], user_key);