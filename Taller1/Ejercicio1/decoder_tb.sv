module decoder_tb();

	logic A,B,C,D,a,b,c,d,e,f,g;

	Decoder decoder(A,B,C,D,a,b,c,d,e,f,g);
	
	initial begin
		A = 0
		B = 0
		C = 0
		D = 0
		#50
		A = 0
		B = 0
		C = 0
		D = 1
		#50
		A = 0
		B = 0
		C = 1
		D = 0
		#50
		A = 0
		B = 0
		C = 1
		D = 1
		#50
		A = 0
		B = 1
		C = 0
		D = 0
		#50
		A = 0
		B = 1
		C = 0
		D = 1
		#50
		A = 0
		B = 1
		C = 1
		D = 0
		#50
		A = 0
		B = 1
		C = 1
		D = 1
	end 
endmodule
