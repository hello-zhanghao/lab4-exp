`include"Macro.v"

module lab4(
	input   clk,
	input   left,
	input   right,
	input  `bit8 sw,
	output `bit8 led
	);
	wire fre_inc;
	wire fre_dec;
	wire clk_N1;
	wire clk_N2;
	wire clk_N3;
	wire clk_N4;
	wire clk_N5;
	wire clk_N6;
	wire clk_N7;
	wire clk_N8;

clk_div myclk_div(
    .clk(clk),
    .clk_N1(clk_N1),
    .clk_N2(clk_N2),
    .clk_N3(clk_N3),
    .clk_N4(clk_N4),
    .clk_N5(clk_N5),
    .clk_N6(clk_N6),
    .clk_N7(clk_N7),
    .clk_N8(clk_N8) 
    );

LED myled(
	.clk(clk),
	.clk_N1(clk_N1),
    .clk_N2(clk_N2),
    .clk_N3(clk_N3),
    .clk_N4(clk_N4),
    .clk_N5(clk_N5),
    .clk_N6(clk_N6),
    .clk_N7(clk_N7),
    .clk_N8(clk_N8), 
	.fre_inc(fre_inc),
	.fre_dec(fre_dec),
	.sw(sw),
	.led(led)
	);
	
key_test mykey1(
    .clk(clk),
    .key_in(left),
    .key_value(fre_inc)
    );
key_test mykey2(
        .clk(clk),
        .key_in(right),
        .key_value(fre_dec)
        );

        	
endmodule