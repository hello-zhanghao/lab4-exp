`include"Macro.v"

module LED(
	input   clk,
	input   fre_inc,
	input   fre_dec,
	input  `bit8 sw,
	output  reg `bit8 led
	);
	reg clk_fre;
	integer count_fre=0;
	reg `bit3 count=0;
	integer fre=1000000;
	integer max_fre=100000000;
	integer min_fre=100000;

always @ (posedge clk) begin
	if(count_fre>=fre) clk_fre<=1;
	if(count_fre<fre) clk_fre<=0;
	count_fre<=count_fre+1;
	if(count_fre>=2*fre)count_fre<=0;
end  

always @ (posedge clk_fre) begin
	count<=count-1;
	case(count)
		0:begin
		      if(sw[0]==1)led<=8'h01;
		      else led<=8'h00;
		  end
		1:begin
		      if(sw[1]==1)led<=8'h02;
		      else led<=8'h00;
		  end
		2:begin
		      if(sw[2]==1)led<=8'h04;
		      else led<=8'h00;
          end
		3:begin
		      if(sw[3]==1)led<=8'h08;
		      else led<=8'h00;
		  end
		4:begin
		      if(sw[4]==1)led<=8'h10;
		      else led<=8'h00;
		  end
		5:begin
		      if(sw[5]==1)led<=8'h20;
		      else led<=8'h00;
		  end
		6:begin
		      if(sw[6]==1)led<=8'h40;
		      else led<=8'h00;
		  end
		7:begin
		      if(sw[7]==1)led<=8'h80;
		      else led<=8'h00;
		  end
		default:led<=8'h00;
	endcase
end
always @ (posedge fre_inc )begin
	if(fre_inc==1)
		begin
			if(fre<=max_fre/5)fre=5*fre;
		end
    if(fre_dec==1)
        begin
            if(fre>=min_fre*5)fre=fre/5;
        end
end

endmodule
