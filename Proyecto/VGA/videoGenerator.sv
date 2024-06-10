module videoGenerator(
    input logic [9:0] x, y, 
    input logic clk, button,
    output logic [7:0] r, g, b
);
    logic pixel, inSecondLine;

    // Detecta si la posición actual está en la segunda línea de caracteres
    assign inSecondLine = (y >= 0 && y < 64);

    // Genera el pixel correspondiente
    changeRom changeRomInstance(clk, button, y[8:3] + 8'd65, x[2:0], y[2:0], x, y, pixel);

    // Asigna el color blanco si está en la segunda línea y el pixel está encendido
    assign {r, g, b} = inSecondLine ? {{8{pixel}}, {8{pixel}}, {8{pixel}}} : 24'h000000;
endmodule