module FlipFlop_tb;

logic clk, rst;
logic[1:0] nextState, state;

Clock clock(
	.clk(clk)
	);
	
FlipFlop flipFlop(
	.clk(clk),
	.rst(rst),
	.nextState(nextState),
	.state(state)
	);
	
initial begin
	rst = 1;
	#20;
	rst = 0;
	nextState = 2'b10;
	#20;
	nextState = 2'b11;
	#20;
	nextState = 2'b01;
	#20;
	rst = 1;
	#20;
	$finish;
end
	
endmodule