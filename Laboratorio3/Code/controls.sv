module controls(
    input logic direction,
    input logic move_h,
    input logic move_v,
	 input reg [2:0] matrix_pc [0:4][0:4],
    output logic [4:0] row,
	 output logic [4:0] col
);

always_comb begin 
    integer i, j;
    logic [4:0] temp_row;
    logic [4:0] temp_col;

    // Inicializar variables temporales
    temp_row = 5'b0;
    temp_col = 5'b0;

     for (i = 0; i < 5; i++) begin
            for (j = 3; j >= 0; j--) begin
                if (direction && move_h && (matrix_pc[i][j] == 3'b001 || matrix_pc[i][j] == 3'b011) && matrix_pc[i][j+1] == 3'b000) begin
                    temp_row = j + 1;
                    temp_col = i;
                end
            end
        end
		  
     for (j = 0; j < 5; j++) begin
            for (i = 3; i >= 0; i--) begin
                if (!direction && move_v && (matrix_pc[i][j] == 3'b001 || matrix_pc[i][j] == 3'b011) && matrix_pc[i+1][j] == 3'b000) begin
                    temp_row = j;
                    temp_col = i + 1;
                end
            end
        end
    // Determinar el movimiento horizontal inverso
    for (i = 0; i < 5; i++) begin
        for (j = 1; j < 5; j++) begin
            if (!direction && move_h && (matrix_pc[i][j] == 3'b001 || matrix_pc[i][j] == 3'b011) && matrix_pc[i][j-1] == 3'b000) begin
                temp_row = j - 1;
                temp_col = i;
            end
        end
    end
	 
	 for (j = 0; j < 5; j++) begin
            for (i = 1; i < 5; i++) begin
                if (direction && move_v && (matrix_pc[i][j] == 3'b001 || matrix_pc[i][j] == 3'b011) && matrix_pc[i-1][j] == 3'b000) begin
                    temp_row = j;
                    temp_col = i - 1;
                end
            end
        end

    
	 
	 for (i = 0;i < 5;i++) begin
				for (j = 0;j < 5;j++)begin
					if (!move_h && !move_v && (matrix_pc[i][j] == 3'b001 || matrix_pc[i][j] == 3'b011)) begin
						temp_row = i;
						temp_col = j;
					end
				end
			end
			
	// Asignar valores temporales a las salidas
    row = temp_row;
    col = temp_col;

end

endmodule
