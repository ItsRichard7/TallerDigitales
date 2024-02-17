module decoder(input logic A,B,C,D, output logic a,b,c,d,e,f,g);
	
	assign a = ~(~B & ~D | ~A & C | B & C | A & ~D | ~A & B & D | A & ~B & ~C);
	
	assign b = ~(~A & ~B | ~B & ~D | ~A & ~C & ~D | ~A & C & D | A & ~C & D);
	
	assign c = ~(~A & ~C | ~A & D | ~C & D | ~A & B | A & ~B);
	
	assign d = ~(A & ~C | ~A & ~B & ~D | ~B & C & D | B & ~C & D | B & C & ~D);
	
	assign e = ~(~B & ~D | C & ~D | A & C | A & B);
	
	assign f = ~(~C & ~D | B & ~D | A & ~B | A & C | ~A & B & ~C);
	
	assign g = ~(~B & C | C & ~D | A & ~B | A & D |  ~A & B & ~C);
	
endmodule
