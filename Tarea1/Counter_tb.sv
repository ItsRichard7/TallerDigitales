module Counter_tb;

logic clk, rst;
logic[7:0] count;

Clock clock(
	.clk(clk)
);

Counter counter(
	.clk(clk),
	.rst(rst),
	.count(count)
);

initial begin
	rst = 1;
	#20;
	rst = 0;
	#500;
	rst = 1;
	#20;
	rst = 0;
	$finish;
end

endmodule