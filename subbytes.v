`timescale 1ns / 1ps
module subbytes(data,sb,clk);
input clk;
input [127:0] data;
output [127:0] sb;

     sbox q0(data[127:120],sb[127:120],clk);
     sbox q1(data[119:112],sb[119:112],clk);
     sbox q2(data[111:104],sb[111:104],clk);
     sbox q3(data[103:96],sb[103:96],clk);
     
     sbox q4(data[95:88],sb[95:88],clk);
     sbox q5(data[87:80],sb[87:80],clk);
     sbox q6(data[79:72],sb[79:72],clk);
     sbox q7(data[71:64],sb[71:64],clk);
     
     sbox q8(data[63:56],sb[63:56],clk);
     sbox q9(data[55:48],sb[55:48],clk);
     sbox q10(data[47:40],sb[47:40],clk);
     sbox q11(data[39:32],sb[39:32],clk);
     
     sbox q12(data[31:24],sb[31:24],clk);
     sbox q13(data[23:16],sb[23:16],clk);
     sbox q14(data[15:8],sb[15:8],clk);
     sbox q16(data[7:0],sb[7:0],clk);
	  
endmodule
