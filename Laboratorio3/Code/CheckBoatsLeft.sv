module CheckBoatsLeft (
    input reg [4:0] board [4:0], // Tablero 5x5 de entrada
    output reg [4:0] boatsLeft // Número de filas con al menos un "1"
);

    integer count;
    reg [4:0] columnHasBoat;

    // Contar el número de filas con al menos un "1" en cada columna
    always_comb begin
        for (int col = 0; col < 5; col++) begin
            columnHasBoat[col] = 0;
            for (int row = 0; row < 5; row++) begin
                if (board[row][col] == 1) begin
                    columnHasBoat[col] = 1;
                    break;
                end
            end
        end
    end

    // Calcular el número de filas con al menos un "1" en cada columna
    always_comb begin
        count = 0;
        for (int row = 0; row < 5; row++) begin
            if (columnHasBoat == 1) begin
                count++;
            end
        end
        boatsLeft = count;
    end

endmodule