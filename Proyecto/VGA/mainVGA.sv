module mainVGA(
    input logic clk,
    input logic rst,
	 input logic switch,
    output logic vgaclk, // Clk que necesita la VGA de 25MHz
    output logic hsync, vsync,
    output logic sync_b, blank_b, // Para el monitor & DAC
    output logic [7:0] r, g, b // Para el video DAC
);
    logic [9:0] x, y;

    // Usar un PLL para crear el 25.175 MHz VGA pixel clock
    pll vgaPll(.refclk(clk), .rst(rst), .outclk_0(vgaclk), .locked());

    // Generar las señales de timing del monitor
    vgaController controller(vgaclk, hsync, vsync, sync_b, blank_b, x, y);

    // Modulo para determinar qué letra se dibuja
    videoGenerator video(x, y, clk, switch, r, g, b);
endmodule

