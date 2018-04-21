`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/18 21:32:17
// Design Name: 
// Module Name: lab4_sim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab4_sim(

    );
    reg clk;
    reg left;
    reg right;
    reg [7:0] sw;
    wire [7:0] led;
initial
begin 
    clk=0;    
    left=1;
    right=1;
    sw=8'h0f;
end
always #1 clk<=~clk;

lab4 mylab4(
    .clk(clk),
    .left(left),
   .right(right),
   .sw(sw),
   .led(led)
    );
    
    
endmodule
