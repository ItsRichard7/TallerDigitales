module StateMachine (
	output logic clk
);

logic tempClk;
logic newClk;

Clock clock(
	.clk(tempClk)
);

FrecDivider frecDivider(
	.clk(tempClk),
	.newClk(newClk)
	);
	
assign clk = newClk;

endmodule