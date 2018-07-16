module iot_system_project (
  input CLOCK50M,
  input write,
  input [1:0] address,
  input [1:0] KEY,
  input [3:0] SWITCH,
  input [17:0] pattern_with_timestamp,
  input [7:0] user_input,
  output [7:0] pattern_out,
  output [7:0] user_output,
  output [11:0] seg_output,
  output [7:0] led
);
  wire clock;
  wire [9:0] counter10h;
  wire [7:0] pattern;
  wire [7:0] user_key;
  wire [10:0] score;
  clock10m clock10m(CLOCK50M, ~KEY[0], clock);
  game_clock game_clock(clock, ~KEY[1], SWITCH[0], counter10h);
  pattern_manager pattern_manager(CLOCK50M, write, address, counter10h, pattern_with_timestamp, pattern);
  input_manager input_manager(CLOCK50M, counter10h, write, address, user_input, user_key);
  score_calculator score_calculator(counter10h, pattern, user_key, ~KEY[1], score);
  nanaseg_decoder nanaseg_decoder(clock, score, seg_output);
  assign pattern_out = pattern;
  assign user_output = user_key;
  assign led = counter10h[7:0];
endmodule
