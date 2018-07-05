module input_manager (
  input [9:0] counter10h,
  input [7:0] user_input,
  output [7:0] key_out
);
  assign key_out = user_input;
endmodule
