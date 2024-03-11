module Clock( 
	output logic clk
);
	
	always begin
		#10 clk = ~clk;
	end
	
	initial begin
		clk = 0;
	end
	
endmodule