module Comparator (
	input logic[7:0] num,
	output logic higher
);

always_comb higher = (num >= 8'b11001000);

endmodule