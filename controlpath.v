`timescale 1ns / 1ps
module controlpath (clr,cnt_en,load_in,load_r10,load_key,out_en,clk,done,done10,rst);
    input clk,done,done10,rst;
    output reg clr,cnt_en,load_in,load_r10,load_key,out_en;
    
    reg [1:0] PS=0,NS=0;
    
    always @(posedge clk)
    begin
        if(rst)
            PS<=0;
        else
            PS<=NS;
    end
    
    always @(posedge clk)
    begin
        case(PS)
        	0:	begin
        			clr			= 1;
        			load_in		= 1;
        			load_r10	= 0;
        			load_key	= 0;
        			cnt_en		= 0;
        			out_en		= 0;
        			NS 			= 1;
        		end
        	1: begin
        			clr			= 0;
        			load_in		= 0;
        			load_r10 	= 0;
        			load_key 	= 1;
        			cnt_en		= 1;
        			out_en		= 0;
        			NS 			= 2;
        		end
        	2: begin
        			if(done)
        			begin
        				clr		= 0;
        				load_in	= 0;
        				load_r10 = 1;
        				load_key = 1;
        				cnt_en	= 0;
        				out_en	= 0;
        				NS = 2;
        			end       
        			else if(done10)
        				out_en	= 1;
        		end
        endcase
    end
endmodule
