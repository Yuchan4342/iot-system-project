// 0.1秒ごとに加算するkaウンターモジュール
// key0でリセット
module game_clock (
  input CLOCK50M,
  input KEY0,
  input [3:0] SWITCH,
  input write,
  output reg [9:0] counter_out,
  output reg counter_update,
  output reg write_100m
);
  reg [23:0] tenm_counter = 24'h000000;
  reg write_flag = 0;
  
  always @ (posedge CLOCK50M)
  begin
    if (SWITCH[0] == 1) begin
		 if (KEY0 == 1) begin
			counter_out <= 10'b0000000000;
		 end else begin
			  tenm_counter = tenm_counter+1;
		 end
		 if (write) begin
		    write_flag = 1;
		 end
		 if (tenm_counter == (24'd400000 >> SWITCH[2:1])) begin
			counter_out <= counter_out+1;
			counter_update <= 1;
			counter_update <= #1 0;
			tenm_counter = 24'h000000;
			if (write_flag) begin
				write_100m <= 1;
				write_100m <= #1 0;
				write_flag = 0;
			end
		 end
	 end
  end
endmodule
