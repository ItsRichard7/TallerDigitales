module Clock( 
	output logic clk
);

	initial begin
	clk = 0;
	end
	
	always begin
		#10 clk = ~clk;
	end
	
endmodule