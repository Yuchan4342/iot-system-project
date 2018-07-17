module input_manager (
  input clock100m,
  input write100m,
  input [7:0] user_input,
  output reg [7:0] key_out
);
  
  always @ (posedge clock100m) begin
     if(write_100m) begin
	     key_out <= user_input;
		  key_out <= #1 0;
	  end
  end
  
endmodule
