module GenMatrixAlea(
    input reg [2:0] matrixNumber,    // Número del 1 al 5 en binario
    output reg [4:0] board [4:0]    // Tablero 5x5
);

// Estados de las casillas
localparam EMPTY = 0;
localparam SHIP = 1;

// Matrices predeterminadas con barcos
reg [4:0] ship1 [4:0] = '{5'b11111, 5'b11110, 5'b00111, 5'b01100, 5'b00010};
reg [4:0] ship2 [4:0] = '{5'b11100, 5'b00100, 5'b11111, 5'b00011, 5'b01111};
reg [4:0] ship3 [4:0] = '{5'b00110, 5'b11111, 5'b01110, 5'b11110, 5'b00010};
reg [4:0] ship4 [4:0] = '{5'b00010, 5'b11100, 5'b11110, 5'b00110, 5'b11111};
reg [4:0] ship5 [4:0] = '{5'b11110, 5'b00011, 5'b11100, 5'b11110, 5'b00010};

// Asignación de matriz predeterminada según el número del barco
always @* begin
    case (matrixNumber)
        3'b001: board = ship1;
        3'b010: board = ship2;
        3'b011: board = ship3;
        3'b100: board = ship4;
        3'b101: board = ship5;
        default: board = '{default: '{5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000}}; // Caso por defecto, no debería ocurrir
    endcase
end

endmodule