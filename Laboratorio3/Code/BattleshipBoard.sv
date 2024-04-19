module BattleshipBoard(
    input reg clk,         // Reloj
    input reg rst,         // Reinicio
    input reg shoot,      // Disparo
    input reg [2:0] shootRow, // Fila del disparo
    input reg [2:0] shootCol, // Columna del disparo
    output reg [4:0] board [4:0] // Tablero 5x5
);

    // Estados de las casillas
    localparam EMPTY = 0;
    localparam SHIP = 1;
    localparam MISS = 2;
    localparam HIT = 3;

    // Proceso de juego
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reiniciar el tablero al estado inicial
            for (int i = 0; i < 5; i++) begin
                for (int j = 0; j < 5; j++) begin
                    board[i][j] <= EMPTY;
                end
            end
        end else if (shoot) begin
            // Procesar el disparo
            if (board[shootRow][shootCol] == EMPTY) begin
                board[shootRow][shootCol] <= MISS;
            end else if (board[shootRow][shootCol] == SHIP) begin
                board[shootRow][shootCol] <= HIT;
            end
        end
    end

endmodule

