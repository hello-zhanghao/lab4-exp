`include"Macro.v"

module lab4(
	input   clk,
	input   left,
	input   right,
	input  `bit8 sw,
	output `bit8 led
	);
	wire `bit2 fre_mode;

LED myled(
	.clk(clk),
	.fre_inc(fre_mode[0]),
	.fre_dec(fre_mode[1]),
	.sw(sw),
	.led(led)
	);
	
key_test mykey1(
    .clk(clk),
    .key_in(left),
    .key_value(fre_mode[0])
    );
key_test2 mykey2(
    .clk(clk),
    .key_in(left),
    .key_value(fre_mode[1])
    );
        	
endmodule