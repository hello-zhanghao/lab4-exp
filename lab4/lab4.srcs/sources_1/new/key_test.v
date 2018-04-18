`include "Macro.v"

module key_test(
     input  clk,
     input  key_in,
     output reg key_value
     );

reg [1:0] key_temp;
wire pd;
reg [19:0] cnt_base;

assign pd = key_temp[0]^key_temp[1]; 

always @(posedge clk)begin
    key_temp<= {key_temp[0],key_in};
    if(pd==1'b1)
       cnt_base <= 20'd0;
    else
       cnt_base <= cnt_base + 1;
    if(cnt_base==20'hf_ffff)key_value <= key_temp[0];
end
 
endmodule