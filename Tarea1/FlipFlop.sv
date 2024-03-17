module FlipFlop(
	input rst, clk, 
	input logic[1:0] nextState, 
	output logic[1:0] state
	);

//actual state logic
always_ff @ (posedge clk or posedge rst)
	if (rst) state = 2'b00;
	else
		state = nextState;

endmodule