module proyecto (
	input  logic        clk, reset,
	output logic [31:0] WriteData, DataAdr,
	output logic        MemWrite
);
	
	logic [31:0] PC, Instr, ReadData;
	
	// Instanciar procesador
	arm arm(clk, reset, PC, Instr, MemWrite, DataAdr, WriteData, ReadData);
	
	// Instanciar Memoria de Instrucciones
	irom irom(PC, clk, Instr);
	
	// Instanciar Memoria de Datos
	dram dram(clk, MemWrite, DataAdr, WriteData, ReadData);
	
endmodule