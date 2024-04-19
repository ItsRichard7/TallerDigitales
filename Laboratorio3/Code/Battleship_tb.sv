module Battleship_tb;

reg clk, rstSwitch, rowButton, colButton, selectButton;
reg [6:0] rowSeg, colSeg, pcBoatsLeft, playerBoatsLeft;
reg [9:0] message;
reg [2:0] rowCoord, colCoord; // Declaración de las variables de coordenadas
reg [7:0] red, green, blue;
reg vgaclock, hsync, vsync, n_blank;

Battleship battleship(
    .clk(clk), .rstSwitch(rstSwitch), .rowButton(rowButton), .colButton(colButton), 
    .selectButton(selectButton), .rowSeg(rowSeg), .colSeg(colSeg), .pcBoatsLeft(pcBoatsLeft), 
    .playerBoatsLeft(playerBoatsLeft), .message(message), .red(red), .green(green),
	 .blue(blue), .vgaclock(vgaclock), .hsync(hsync), .vsync(vsync), .n_blank(n_blank)
);

always begin
    #5 clk = ~clk;
end

initial begin
    clk = 1;
    rstSwitch = 1;
    rowButton = 0;
    colButton = 0;
    selectButton = 0;
    #20;
    rstSwitch = 0;

    // Disparar a todas las casillas del juego
    for (int row = 0; row < 5; row = row + 1) begin
        for (int col = 0; col < 5; col = col + 1) begin
            // Configurar fila y columna
            rowCoord = row;
            colCoord = col;

            // Presionar el botón de fila
            rowButton = 1;
            #20;
            rowButton = 0;
            #20;

            // Presionar el botón de columna
            colButton = 1;
            #20;
            colButton = 0;
            #20;

            // Presionar el botón de selección
            selectButton = 1;
            #10;
            selectButton = 0;
            #20;
        end
    end
end

endmodule
