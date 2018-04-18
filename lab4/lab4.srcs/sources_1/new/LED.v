`include"Macro.v"

module LED(
	input   clk,
	input   clk_N1,
	input   clk_N2,
	input   clk_N3,
	input   clk_N4,
	input   clk_N5,
	input   clk_N6,
	input   clk_N7,
	input   clk_N8,
	input   fre_inc,
	input   fre_dec,
	input  `bit8 sw,
	output  reg `bit8 led
	);
	reg clk_fre;
	reg `bit3 count=0;
	reg `bit3 fre_count=4;
	wire key_down;

assign key_down=fre_inc xor fre_dec;

//根据寄存器值选择不同的频率
always @ (*) begin
	if(fre_count==0)clk_fre <= clk_N1;
	if(fre_count==1)clk_fre <= clk_N2;
	if(fre_count==2)clk_fre <= clk_N3;
	if(fre_count==3)clk_fre <= clk_N4;
	if(fre_count==4)clk_fre <= clk_N5;
	if(fre_count==5)clk_fre <= clk_N6;
	if(fre_count==6)clk_fre <= clk_N7;
	if(fre_count==7)clk_fre <= clk_N8;	
end  

//根据按键对寄存器+1/-1，改变流水灯频率
always @ (posedge key_down) begin
	if(fre_inc==1)fre_count <= fre_count + 1;
	if(fre_dec==1)fre_count <= fre_count - 1;
end

//流水等变化规律
always @ (posedge clk_fre) begin
	case(count)
		0:begin
		    if(sw[0]==1) led <= 8'h01;
		    else led <= 8'h00;
		    if(sw[7]==1) count<=7;
		   	else if(sw[6]==1) count<=6;
			    else if(sw[5]==1) count <= 5;
			    	else if(sw[4]==1) count <= 4;
			    		else if(sw[3]==1) count <= 3;
			    			else if(sw[2]==1) count <=2;
			    				else if(sw[1]==1) count <=1;
		  end
		1:begin
			if(sw[1]==1) led <= 8'h02;
		    else led <= 8'h00;
			if(sw[0]==1) count <=0;
		    else if(sw[7]==1) count<=7;
		   		else if(sw[6]==1) count <= 6;
		   			else if(sw[5]==1) count <= 5;
		   				else if(sw[4]==1) count <= 4;
		   					else if(sw[3]==1) count <= 3;
		   						else if(sw[2]==1) count <=2;
		    				
		  end
		2:begin
		    if(sw[2]==1) led <= 8'h04;
		    else led <= 8'h00;
		    if(sw[1]==1) count <=1;
		    else if(sw[0]==1) count <=0;
		   		else if(sw[7]==1) count<=7;
				    else if(sw[6]==1) count <= 6;
				    	else if(sw[5]==1) count <= 5;
				    		else if(sw[4]==1) count <= 4;
				    			else if(sw[3]==1) count <=3;
					    				
          end
		3:begin
		    if(sw[3]==1) led <= 8'h08;
		    else led <= 8'h00;
		    if(sw[2]==1) count <=2;
		    else if(sw[1]==1) count <=1;
				else if(sw[0]==1) count <=0;
		   			else if(sw[7]==1) count<=7;
		   				else if(sw[6]==1) count <= 6;
		   					else if(sw[5]==1) count <= 5;
		   						else if(sw[4]==1) count <= 4;
		    			
		  end
		4:begin
		    if(sw[4]==1) led <= 8'h10;
		    else led <= 8'h00;
		    if(sw[3]==1) count <= 3;
		    else if(sw[2]==1) count <=2;
		   		else if(sw[1]==1) count <=1;
		    		else if(sw[0]==1) count <=0;
		    			else if(sw[7]==1) count<=7;
		    				else if(sw[6]==1) count <= 6;
		    					else if(sw[5]==1) count <= 5;
		    		
		  end
		5:begin
		    if(sw[5]==1) led <= 8'h20;
		    else led <= 8'h00;
		    if(sw[4]==1) count <= 4;
		   	else if(sw[3]==1) count <= 3;
		   		else if(sw[2]==1) count <=2;
	    			else if(sw[1]==1) count <=1;
	    				else if(sw[0]==1) count <=0;
	    					else if(sw[7]==1) count<=7;
								else if(sw[6]==1) count <= 6;
		    		
		  end
		6:begin
		    if(sw[6]==1) led <= 8'h40;
		    else led <= 8'h00;
		    if(sw[5]==1) count <= 5;
		    else if(sw[4]==1) count <= 4;
		    	else if(sw[3]==1) count <= 3;
		   			else if(sw[2]==1) count <= 2;
		  				else if(sw[1]==1) count <= 1;
		   					else if(sw[0]==1) count <= 0;
	    						else if(sw[7]==1) count <= 7;
		  
		  end
		7:begin
		    if(sw[7]==1)led<=8'h80;
		    else led <= 8'h00;
		    if(sw[6]==1) count <= 6;
		    else if(sw[5]==1) count <= 5;
		    	else if(sw[4]==1) count <= 4;
		    		else if(sw[3]==1) count <= 3;
		    			else if(sw[2]==1) count <=2;
		    				else if(sw[1]==1) count <=0;
		    					else if(sw[0]==1) count <=1;
		    						
		  end
		default:count <= 0;
	endcase
end

endmodule
