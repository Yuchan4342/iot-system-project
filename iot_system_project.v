module iot_system_project (
  input CLOCK50M,
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
  clock10m clock10m(CLOCK50M, 1, clock);
  game_clock game_clock(clock, ~KEY[0], counter10h);
  pattern_manager pattern_manager(clock, counter10h, pattern_with_timestamp, pattern);
  input_manager input_manager(counter10h, user_input, user_key);
  score_calculator score_calculator(counter10h, pattern, user_key, score);
  nanaseg_decoder nanaseg_decoder(clock, score, seg_output);
  assign pattern_out = pattern;
  assign user_output = user_input;
  assign led = counter10h[9:2];
endmodule
