module boats(input [0:2] amount_boats, input [0:2] boats_placed, output wire full_boat_placed);
	
	always_comb begin
		if (amount_boats == boats_placed) begin
			full_boat_placed = 1;
		end else begin
			full_boat_placed = 0;
		end
	end

endmodule 