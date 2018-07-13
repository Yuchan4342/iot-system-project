module input_manager (
  input CLOCK50M,
  input write,
  input [1:0] address,
  input [7:0] user_input,
  output reg [7:0] key_out
);
  always @ (posedge CLOCK50M) begin
    if (write) begin
      case (address)		
        2'b00:
			 key_out <= user_input;
		endcase
    end
  end
endmodule
