module Counter(
	input logic clk, rst,
	output logic[7:0] count
);

logic[7:0] countTemp;

always @(posedge clk or posedge rst)
	if (rst) countTemp <= 0; else countTemp <= countTemp + 1;

assign count = countTemp;
 
endmodule