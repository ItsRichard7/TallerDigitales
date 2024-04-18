module update_matrix_pc(
    input [4:0] row,
    input [4:0] col,
	 input logic clock,
	 input logic reset,
    input logic [2:0] matrix_pc [0:4][0:4],
	 output logic [2:0] matrix [0:4][0:4],
	 output reg [4:0] actual_row,
	 output reg [4:0] actual_col  
);
	always @(posedge clock) begin
        if (reset) begin
            actual_row <= 0;
            actual_col <= 0;
        end else begin
                actual_row <= row;
                actual_col <= col;
            
        end
    end
	 
    always_comb begin 
	 
		for (int i = 0; i < 5;i++) begin
			for(int j = 0; j < 5;j++) begin 
				matrix[i][j] = matrix_pc[i][j];
				if (matrix[i][j] == 3'b001) begin
					matrix[i][j] = 3'b000;
				end
				else if (matrix[i][j] == 3'b011) begin
					matrix[i][j] = 3'b010;
				end
			end
		end
		
		matrix[row][col] = 3'b001;
	 end
	 
	   
	 
    
	 
endmodule
