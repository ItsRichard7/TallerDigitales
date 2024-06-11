module proyecto (
    input logic clk,
    input logic rst,
	 input logic switch,
    output logic vgaclk, // Clk que necesita la VGA de 25MHz
    output logic hsync, vsync,
    output logic sync_b, blank_b, // Para el monitor & DAC
    output logic [7:0] r, g, b // Para el video DAC
);

	logic [31:0] PC, Instr, ReadData;
	
	// Instanciar procesador
	arm arm(clk, reset, PC, Instr, MemWrite, DataAdr, WriteData, ReadData);
	
	// Instanciar Memoria de Instrucciones
	irom irom(PC, clk, Instr);
	
	// Instanciar Memoria de Datos
	dram dram(DataAdr, clk, WriteData, MemWrite, ReadData);
	
	// Instancias para la VGA
	pll vgaPll(.refclk(clk), .rst(rst), .outclk_0(vgaclk), .locked()); // Usar un PLL para crear el 25.175 MHz VGA pixel clock

   vgaController controller(vgaclk, hsync, vsync, sync_b, blank_b, x, y); // Generar las señales de timing del monitor

   videoGenerator video(x, y, clk, switch, r, g, b); // Modulo para determinar qué letra se dibuja
	
endmodule