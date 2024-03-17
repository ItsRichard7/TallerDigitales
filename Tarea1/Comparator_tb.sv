module Comparator_tb;

logic [7:0] num;
logic higher;

Comparator Comparator(
	.num(num),
	.higher(higher)
);

initial begin
	num = 8'b11001000;
	#10;
	num = 8'b00000000;
	#10;
	num = 8'b11001011;
	#10;
	num = 8'b10001000;
	#10;
end

endmodule