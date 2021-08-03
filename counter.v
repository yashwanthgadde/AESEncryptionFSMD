`timescale 1ns / 1ps
module counter(clk,clr,cnt_en,done,done10,count);
  input clk,clr,cnt_en;
  output done,done10;
  
  output reg [3:0] count;
  reg [3:0] count1,count2=1;
  
  and G1 (done,count[3],~count[2],~count[1],count[0]);
  and G2 (done10,count[3],~count[2],count[1],~count[0]);
  
  always @(posedge clk)
    begin
      if(cnt_en && ~clr)
        count2<=count2+4'b1;
    end
    
  always @(*)
  begin
    if(clr)
    begin
        count1<=0;
        count<=count1;
    end
    else
    	count<=count2;
  end
endmodule
