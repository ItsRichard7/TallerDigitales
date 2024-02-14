module decoder (input A,B,C,D, output a,b,c,d,e,f,g);
	
	assign a = ~A & ~B | ~B & ~C | ~A & D | B & C | A & ~D|;
	
	assign b = ~A & ~B | ~B & ~D | ~A & ~C & ~D | ~A & C & D | A & ~C & D;
	
	assign c = ~A & B | A & ~B | ~A & ~C & ~D | ~A & C & D | B & ~C & D;
	
	assign d = A & ~C | ~A & ~B & ~D | ~B & C & D | B & ~C & D | B & C & ~D;
	
	assign e = ~B & ~D | C & ~D | A & C | A & B;
	
	assign f = ~C & ~D | B & ~D | A & ~B | A & C | ~A & B & ~C;
	
	assign g = ~B & C | C & ~D | A & ~B | A & D |  ~A & B & ~C;
	
endmodule