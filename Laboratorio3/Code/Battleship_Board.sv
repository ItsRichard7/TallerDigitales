module Battleship_Board(
    input logic clk,
    input logic rst,
    input logic [4:0] row,
    input logic [4:0] col,
    input logic fire,
    output logic hit,
    output logic [7:0] state
);

    // Parámetros para definir el tamaño del tablero
    parameter ROWS = 5;
    parameter COLS = 5;

    // Declaración de variables internas
    logic [7:0] board [0:ROWS-1][0:COLS-1]; // Matriz que representa el tablero
    logic [7:0] cell_state; // Estado de la celda seleccionada

    // Proceso de inicialización del tablero
    initial begin
        // Inicializar todas las celdas del tablero sin barcos y sin disparos
        for (int i = 0; i < ROWS; i++) begin
            for (int j = 0; j < COLS; j++) begin
                board[i][j] = 8'b0000_0000; // Celda vacía (0000_0000)
            end
        end
    end

    // Proceso de disparo y actualización del estado del tablero
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reiniciar el tablero en caso de señal de reset
            for (int i = 0; i < ROWS; i++) begin
                for (int j = 0; j < COLS; j++) begin
                    board[i][j] = 8'b0000_0000; // Celda vacía (0000_0000)
                end
            end
            hit <= 1'b0;
            state <= 8'b0000_0000;
        end else if (fire) begin
            cell_state = board[row][col];
            if (cell_state[7:4] != 4'b0000) begin
                // Si la celda contiene un barco
                hit <= 1'b1;
                board[row][col] = {4'b0000, cell_state[4:0]}; // Marcar el barco como impactado
            end else begin
                // Si la celda no contiene un barco
                hit <= 1'b0;
                board[row][col] = 8'b1000_0000; // Marcar la celda como disparada
            end
            state <= board[row][col]; // Actualizar el estado de la celda
        end
    end

endmodule