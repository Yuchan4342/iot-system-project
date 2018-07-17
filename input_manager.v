module input_manager (
  input CLOCK50M,
  input write,
  input [7:0] user_input,
  output reg [7:0] key_out
);
  
  always @ (posedge CLOCK50M) begin
     if(write) begin
	     key_out <= user_input;
	  end
  end
  
endmodule
