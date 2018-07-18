// 0.1秒ごとに加算するkaウンターモジュール
// key0でリセット
module game_clock (
  input CLOCK50M,
  input KEY0,
  input [3:0] SWITCH,
  output reg [9:0] counter_out,
  output reg game_clk
);
  reg [31:0] tenm_counter = 32'h000000;
  
  always @ (posedge CLOCK50M)
  begin
    if (SWITCH[0] == 1) begin
		 if (KEY0 == 1) begin
			counter_out <= 10'b0000000000;
			tenm_counter <= 0;
		 end else begin
		 	if (tenm_counter == (32'd10000000 >> SWITCH[2:1])) begin
			  counter_out <= counter_out+1;
			  tenm_counter <= 0;
			  game_clk <= 1;
		   end else begin
			  tenm_counter <= tenm_counter+1;
			  game_clk <= 0;
		   end
		 end
	 end
  end
endmodule
