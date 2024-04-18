module sincronizador(input [0:9] pixel_num,
							input [0:9] linea_num,
							output hsync,
							output vsync,
							output n_blank);
							
							
	logic hback_porch;
	logic hfront_porch;
	logic hsync_aux;
	logic vback_porch;
	logic vfront_porch;
	logic vsync_aux;
	
	//generate 
	
	//comparaciones horizontales
	comparador_mayor #(10) comparador_hfront_porch(	.a(pixel_num), 
																	//.b(10'd639), 
																	.b(10'd640),
																	.mayor(hfront_porch));
																	
	comparador_mayor #(10) comparador_hsync(	.a(pixel_num), 
															//.b(10'd655), 
															.b(10'd656), 
															.mayor(hsync_aux));
															
	comparador_mayor #(10) comparador_hback_porch(	.a(pixel_num), 
																	//.b(10'd751), 
																	.b(10'd752), 
																	.mayor(hback_porch));

	//comparaciones verticales
	comparador_mayor #(10) comparador_vfront_porch(	.a(linea_num), 
																	//.b(10'd479), 
																	.b(10'd480), 
																	.mayor(vfront_porch));
																	
	comparador_mayor #(10) comparador_vsync(	.a(linea_num), 
															//.b(10'd489), 
															.b(10'd490), 
															.mayor(vsync_aux));
															
	comparador_mayor #(10) comparador_vback_porch(	.a(linea_num), 
																	//.b(10'd491), 
																	.b(10'd492), 
																	.mayor(vback_porch));
	
	assign vsync = ~(vsync_aux ^ vback_porch);
	assign hsync = ~(hsync_aux ^ hback_porch);
	assign n_blank = ~(hfront_porch || vfront_porch);
		
	//endgenerate
	
endmodule 