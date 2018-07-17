module iot_system_project (
  input CLOCK50M,
  input write,
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
  wire update_input;
  wire [9:0] game_timer;
  wire clock100m;
  wire [7:0] pattern;
  wire [7:0] user_key;
  wire [10:0] score;
  game_clock game_clock(CLOCK50M, ~KEY[0], SWITCH, write, game_timer, clock100m, write100m);
  pattern_manager pattern_manager(CLOCK50M, write, game_timer, pattern_with_timestamp, pattern);
  input_manager input_manager(clock100m, write100m, user_input, user_key);
  score_calculator score_calculator(clock100m, write100m, pattern, user_key, ~KEY[1], score, pattern_out);
  nanaseg_decoder nanaseg_decoder(CLOCK50M, score, seg_output);
  assign user_output = user_key;
  assign led = game_timer[7:0];
endmodule
