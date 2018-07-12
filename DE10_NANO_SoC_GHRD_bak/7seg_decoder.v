/*
*  10進数のスコアを7seg×3の2進数にデコードする。
*  ダイナミック点灯させる。
*  使った7seg: http://akizukidenshi.com/download/ds/tekivi/2381BG.pdf
*
*       10
*      ____
*    9|    |6
*     | 4  |
*      ----
*    0|    |3
*     |    |
*      ----  .
*       1    2
*
*   first  digit: 7
*   second digit: 8
*   third  digit: 11
*/
module nanaseg_decoder (
  input CLOCK10M,
  input [10:0] score,
  output reg [11:0] seg_output
);
  reg [1:0] dist_digit = 0;
  function [11:0] seg_decode;
    input [3:0] d_digit;
    case(d_digit)
      4'd0: seg_decode = 12'b011001001011;
      4'd1: seg_decode = 12'b000001001000;
      4'd2: seg_decode = 12'b010001010011;
      4'd3: seg_decode = 12'b010001011010;
      4'd4: seg_decode = 12'b001001011000;
      4'd5: seg_decode = 12'b011000011010;
      4'd6: seg_decode = 12'b011000011011;
      4'd7: seg_decode = 12'b011001001000;
      4'd8: seg_decode = 12'b011001011011;
      4'd9: seg_decode = 12'b011001011010;
      default: seg_decode = 12'b000000000000;
    endcase
  endfunction

  always @ (posedge CLOCK10M) begin
    case(dist_digit)
      2'b00: begin
			seg_output = seg_decode(score%10);
			seg_output[7] = 1'b1;
		end
      2'b01: begin
			seg_output = seg_decode((score/10)%10);
		   seg_output[8] = 1'b1;
		end
      2'b10: begin
			seg_output = seg_decode((score/100)%10);
		   seg_output[11] = 1'b1;
		end
    endcase
    dist_digit = (dist_digit == 2'b10) ? 2'b0 : dist_digit+1;
  end
endmodule
