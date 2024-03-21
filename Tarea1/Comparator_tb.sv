module Comparator_tb;

logic [7:0] num;
logic higher;
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

Comparator Comparator(
	.num(count),
	.higher(higher)
);

initial begin
	rst = 1;
	#100;
	rst = 0;
end

endmodule