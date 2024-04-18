module contador_vertical(input logic reloj, 
								input logic reset, 
								output [0:9] numero_linea);
								
	logic cambio_linea;
	logic reset_interno;
	logic [0:9] maxFilas;
	logic maxAlcanzado;
	
	//generate 
	contador_parametrizable #(10) contador(.reloj(reloj), 
														.reset(reset_interno), 
														.out(numero_linea));
														
	comparador_igual #(10) comparador_igual(	.a(maxFilas), 
															.b(numero_linea), 
															.iguales(maxAlcanzado));
															
	//assign maxFilas = 10'd523;
	assign maxFilas = 10'd525;
	assign reset_interno = reset || maxAlcanzado;
	//endgenerate
	
endmodule 