module alu_tb;
    
    // Señales
    logic [31:0] SrcA, SrcB;
    logic [1:0] ALUControl;
    logic [31:0] ALUResult;
    logic [3:0] ALUFlags;
    
    // Instancia de la ALU
    alu alu_inst (
        .SrcA(SrcA),
        .SrcB(SrcB),
        .ALUControl(ALUControl),
        .ALUResult(ALUResult),
        .ALUFlags(ALUFlags)
    );
	 
	 initial begin
		SrcA = 32'h0000000A;
		SrcB = 32'h00000005;
		ALUControl = 2'b00;
		#20;
		ALUControl = 2'b01;
		#20;
		ALUControl = 2'b10;
		#20;
		ALUControl = 2'b11;
		#20;
	 end
	 
endmodule