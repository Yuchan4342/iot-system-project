module input_manager (
  input CLOCK50M,
  input clock10h,
  input write,
  input [1:0] address,
  input [7:0] user_input,
  output [7:0] key_out
);

  reg [7:0] key_out_internal;
  
  always @ (posedge CLOCK50M) begin
    if (write) begin
      case (address)		
        2'b00:
			 key_out_internal <= user_input;
		endcase
    end else if (clock10h) begin
		key_out_internal <= 8'b00000000;
	 end
  end
  
  assign key_out = key_out_internal;
  
endmodule
