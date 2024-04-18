module move(
	input logic move_h, 
	input logic move_v, 
	input logic direction, 
	output [4:0] actual_row, 
	output [4:0] actual_col, 
	output [4:0] row, 
	output [4:0] col
);
	
	always_comb begin
		row = 0;
		col = 0;
		if (!move_h && direction && col < 5) begin
			col = actual_col + 1;
		end
		 else if (!move_h && !direction && col > 0) begin
			col = actual_col - 1;
		end
		
		else if (!move_v && direction && row > 0) begin
			row = actual_row - 1;
		end
		
		else if (!move_v && !direction && row < 5) begin
			row = actual_row + 1;
		end
	
	
	end
	
endmodule 