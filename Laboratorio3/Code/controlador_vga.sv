module controlador_vga(	input  clock,
								input  reset,
								input  [2:0] matrix_pc [0:4][0:4],
								input  [2:0] matrix_player [0:4][0:4],
								input logic win,
								input logic lose,
								output [7:0] red,
								output [7:0] green,
								output [7:0] blue,
								output vgaclock,
								output hsync,
								output vsync,
								output n_blank);
							  
	logic [0:9] pixel_num;
	logic [0:9] linea_num;
	logic cambio_linea;
	logic clock_25;

   //generate
	clock25mh clock_iml(clock, clock_25);
	
	
	contador_horizontal contador_horizontal (	.reloj(clock_25), 
															.reset(reset), 
															.numero_pixel(pixel_num), 
															.cambio_linea(cambio_linea));
														
										
	contador_vertical contador_vertical (	.reloj(cambio_linea),
														.reset(reset),
														.numero_linea(linea_num));
								
			
	sincronizador sincronizador(.pixel_num(pixel_num),
										.linea_num(linea_num),
										.hsync(hsync), 
										.vsync(vsync), 
										.n_blank(n_blank));
										
										
	generadorMatriz generadorCuadricula (
        .x(pixel_num),
        .y(linea_num),
		  .matrix_player(matrix_player),
		  .matrix_pc(matrix_pc),
		  .win(win),
		  .lose(lose),
        .red(red),
        .green(green),
        .blue(blue));
	 
	assign vgaclock = clock_25;
	//endgenerate
	
endmodule 