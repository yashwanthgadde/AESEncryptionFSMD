`timescale 1ns / 1ps
module DFF(D,clk,clr,Q);
  input [127:0] D;
  input clk,clr;
  output reg [127:0] Q=0;
  
  always @(posedge clk, negedge clr)
    begin
      if(~clr)
        Q=D;
    end
endmodule
