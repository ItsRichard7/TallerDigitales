module paramCounter #(parameter n = 5) (input logic reloj,      
																	input logic reset,              
																	output reg [n-1:0] out);  
						
	reg [n-1:0] contador = 0;
	
	always @ (posedge reloj) begin
		 if (reset)
			  contador <= 0;
		 else
		 contador <= contador + 1'd1;
	end 
	
	assign out = contador;

endmodule
