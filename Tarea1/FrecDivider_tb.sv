module FrecDivider_tb;

logic clk;
logic newClk;

Clock clock(
	.clk(clk)
);

FrecDivider frecDivider(
	.clk(clk),
	.newClk(newClk)
);
	
endmodule