// 0.1秒ごとに加算するkaウンターモジュール
// key0でリセット
module game_clock (
  input CLOCK10M,
  input KEY0,
  input [3:0] SWITCH,
  output reg [9:0] counter_out
);
  reg [23:0] tenm_counter = 24'h000000;
  always @ (posedge CLOCK10M)
  begin
    if (SWITCH[0] == 1) begin
		 if (KEY0 == 1) begin
			counter_out <= 10'b0000000000;
		 end else begin
			  tenm_counter = tenm_counter+1;
		 end
		 if (tenm_counter == (24'd2000000 >> SWITCH[2:1]) begin
			counter_out <= counter_out+1;
			tenm_counter = 24'h000000;
		 end
	 end
  end
endmodule
