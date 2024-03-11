module StateMachine_tb;

logic clk;

StateMachine stateMachine(
	.clk(clk)
);

initial begin
	clk = 0;
end

endmodule