`timescale 1ns / 1ps
module datapath(clk,datain,keyin1,dataout,load_in,load_r10,clr,load_key,cnt_en,out_en,done,done10);
    input clk,load_in,load_r10,clr,load_key,cnt_en,out_en;
    input [127:0] datain;
    input [127:0] keyin1;
    output reg [127:0] dataout;
    output done,done10;
    
    wire [127:0] in_data, rndout;
    wire [127:0] keyout;
	 
	assign in_data = datain^keyin1;
	 
    wire [127:0] sb,sr,mcl,fin_data,out_data,keyin,keyin2;
    reg [127:0] rndout1,rndout2;
    wire [3:0] count;
    
    mux128 	mux1 (out_data,rndout2,in_data,load_in);
    subbytes t1	(out_data,sb,~clk);
    shiftrow t2	(sb,sr);
    mixcolumn t3 (sr,mcl);
    mux128 mux2	(fin_data,mcl,sr,load_r10);
    
    KeyGeneration t0 (count,keyin,keyout,~clk);
    DFF	dff	(keyout,clk,clr,keyin2);
    mux128 mux4	(keyin,keyin1,keyin2,load_key);
    
    counter cnt1 (clk,clr,cnt_en,done,done10,count);
    
    always @(*)
    begin
        rndout1 = keyin^fin_data;
        rndout2 = rndout1;
    end
    
    DFF dff2 (rndout1,~clk,clr,rndout);
        
    always @ (posedge out_en)
    	dataout <= rndout;
     
endmodule     