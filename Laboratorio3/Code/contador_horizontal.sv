module contador_horizontal(input logic reloj, 
									input logic reset, 
									output [0:9] numero_pixel, 
									output cambio_linea);
	
	logic reset_interno;
	logic [0:9] maxColumnas;
	
	//generate 
	contador_parametrizable #(10) contador(.reloj(reloj), 
														.reset(reset_interno), 
														.out(numero_pixel));
														
	comparador_igual #(10) comparador_igual(	.a(maxColumnas), 
															.b(numero_pixel), 
															.iguales(cambio_linea));
	
	//assign maxColumnas = 10'd799;
	assign maxColumnas = 10'd800;
	assign reset_interno = reset || cambio_linea;
		
	//endgenerate
	
endmodule 