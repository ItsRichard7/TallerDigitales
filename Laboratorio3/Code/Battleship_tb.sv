module Battleship_tb

logic clk; 

always begin
		#5 clk = ~clk;
end

// Test Begin
initial begin
	// Initialice Variables
	clk = 0;
	rst = 1;
end

endmodule