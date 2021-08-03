`timescale 1ns / 1ps
module mux128 (out, in0, in1, sel);
	input [127:0] in0,in1;
	input sel;
	output [127:0] out;
	
	assign out = sel ? in1 : in0;
endmodule
