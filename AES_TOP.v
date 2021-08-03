`timescale 1ns / 1ps

module AES_TOP(clk,rst,finalout,datain,key);
    input clk,rst; 
    input [127:0] datain,key; 
    output [127:0] finalout;

    //wire [127:0] tempout;
    wire load_in,load_r10,clr,load_key,cnt_en,out_en,done,done10;

    datapath    dataPath    (clk,datain,key,finalout,load_in,load_r10,clr,load_key,cnt_en,out_en,done,done10);
    controlpath controlPath (clr,cnt_en,load_in,load_r10,load_key,out_en,clk,done,done10,rst);

    //assign finalout = tempout[127:0];
endmodule