`include "Macro.v"
module clk_div(
     input  clk,
     output reg clk_N1,
     output reg clk_N2,
     output reg clk_N3,
     output reg clk_N4,
     output reg clk_N5,
     output reg clk_N6,
     output reg clk_N7,
     output reg clk_N8    
     );
parameter N1 =30'd1000000; 
parameter N2 =30'd2000000; 
parameter N3 =30'd3000000; 
parameter N4 =30'd4000000; 
parameter N5 =30'd5000000; 
parameter N6 =30'd6000000; 
parameter N7 =30'd7000000; 
parameter N8 =30'd8000000; 
reg `bit30 cnt1 =20'd0;
reg `bit30 cnt2 =20'd0;
reg `bit30 cnt3 =20'd0;
reg `bit30 cnt4 =20'd0;
reg `bit30 cnt5 =20'd0;
reg `bit30 cnt6 =20'd0;
reg `bit30 cnt7 =20'd0;
reg `bit30 cnt8 =20'd0;


//definate several timers,period is N1,N2......//
always@(posedge clk)
begin 
	//cnt1
    if(cnt1 == (N1-1) )
       	cnt1 <= 20'd0;
    else
       	cnt1 <= cnt1 + 1'b1;
    //cnt2
    if(cnt2 == (N2-1) )
       	cnt2 <= 20'd0;
    else
       	cnt2 <= cnt2 + 1'b1;
    //cnt3
    if(cnt3 == (N3-1) )
       	cnt3 <= 20'd0;
    else
       	cnt3 <= cnt3 + 1'b1;
    //cnt4
    if(cnt4 == (N4-1) )
       	cnt4 <= 20'd0;
    else
       	cnt4 <= cnt4 + 1'b1;
    //cnt5
    if(cnt5 == (N5-1) )
       	cnt5 <= 20'd0;
    else
       	cnt5 <= cnt5 + 1'b1;
    //cnt6
    if(cnt6 == (N6-1) )
       	cnt6 <= 20'd0;
    else
       	cnt6 <= cnt6 + 1'b1;
    //cnt7
   	if(cnt7 == (N7-1) )
       	cnt7 <= 20'd0;
    else
      	cnt7 <= cnt7 + 1'b1;
    //cnt8
    if(cnt8 == (N8-1) )
    	cnt8 <= 20'd0;
    else
       	cnt8 <= cnt8 + 1'b1;
end
 

always@(posedge clk)
begin
	//clk_N1
	if(cnt1 == 20'd0)
    	clk_N1 <= 1'b1;
  	else if(cnt1 == (N1/2))
    	clk_N1 <= 1'b0;
   	//clk_N2
	if(cnt2 == 20'd0)
    	clk_N2 <= 1'b1;
  	else if(cnt2 == (N2/2))
    	clk_N2 <= 1'b0;
   //clk_N3
	if(cnt3 == 20'd0)
    	clk_N3 <= 1'b1;
  	else if(cnt3 == (N3/2))
    	clk_N3 <= 1'b0;
   	//clk_N4
	if(cnt4 == 20'd0)
    	clk_N4 <= 1'b1;
  	else if(cnt4 == (N4/2))
    	clk_N4 <= 1'b0;
    //clk_N5
	if(cnt5 == 20'd0)
    	clk_N5 <= 1'b1;
  	else if(cnt5 == (N5/2))
    	clk_N5 <= 1'b0;
    //clk_N6
	if(cnt6 == 20'd0)
    	clk_N6 <= 1'b1;
  	else if(cnt6 == (N6/2))
    	clk_N6 <= 1'b0;
    //clk_N7
	if(cnt7 == 20'd0)
    	clk_N7 <= 1'b1;
  	else if(cnt7 == (N7/2))
    	clk_N7 <= 1'b0;
    //clk_N8
	if(cnt8 == 20'd0)
    	clk_N8 <= 1'b1;
  	else if(cnt8 == (N8/2))
    	clk_N8 <= 1'b0;
end
 
endmodule