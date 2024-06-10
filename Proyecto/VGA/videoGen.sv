module videoGen(
    input logic [9:0] x, y, 
    input logic clk, 
    output logic [7:0] r, g, b
);
    logic pixel, inSecondLine;

    // Detecta si la posición actual está en la segunda línea de caracteres
    assign inSecondLine = (y >= 24 && y < 32);

    // Genera el pixel correspondiente
    chargenrom chargenromb(clk, y[8:3] + 8'd65, x[2:0], y[2:0], x, y, pixel);

    // Asigna el color blanco si está en la segunda línea y el pixel está encendido
    assign {r, g, b} = inSecondLine ? {{8{pixel}}, {8{pixel}}, {8{pixel}}} : 24'h000000;
endmodule