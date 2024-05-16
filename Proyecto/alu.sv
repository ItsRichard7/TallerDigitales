module alu(input  logic [31:0] SrcA, SrcB, 
			  input  logic [1:0]  ALUControl, 
			  output logic [31:0] ALUResult,
			  output logic [3:0]  ALUFlags); 
			  
	logic [31:0] condinvb; 
	logic [32:0] sum; 
	
	assign condinvb = ALUControl[0] ? ~SrcB : SrcB; 
	assign sum = SrcA + condinvb + ALUControl[0];
	
	always_comb 
		casex (ALUControl[1:0]) 
			2'b0?: ALUResult = sum; 
			2'b10: ALUResult = SrcA & SrcB; 
			2'b11: ALUResult = SrcA | SrcB; 
		endcase 
	
	assign ALUFlags[0] = ((ALUControl[0] ^ SrcA[31]) ^ SrcB[31]) & ~(sum[31] | SrcA[31]) & ALUControl[1]; // Overflow
	assign ALUFlags[1] = ~ALUControl[0] & sum[32]; // Carry
	assign ALUFlags[2] = (ALUResult == 0);
	assign ALUFlags[3] = ALUResult[31];
	
endmodule 
