module matrix #(parameter ancho = 4'd5) (
    input [0:9] x,
    input [0:9] y,
    input reg [1:0] matrix_player [0:4][0:4], // Matriz 5x5
	 input reg [2:0] matrix_pc [0:4][0:4], // Matriz 5x5
	 input [49:0] array_player,
	 input [49:0] array_pc,
	 input reg [4:0] select_row,
	 input reg [4:0] select_col,
	 input logic win,
	 input logic lose,
    output logic [7:0] red,
    output logic [7:0] green,
    output logic [7:0] blue
);

    logic color_blanco;
	 logic color_azul;
	 logic color_rojo;
	 logic color_verde;
	 logic color_celeste;
	 logic gano;
    logic [0:9] stepx;
    logic [0:9] stepy;
    logic [0:9] x0;
    logic [0:9] y0;
    logic [0:9] i;
    logic [0:9] j;
	 logic [0:4] ajuste_x;
	 logic [0:4] ajuste_y;
	 
	 int index;
	 
    always_comb begin
        color_blanco = 0;
		  color_azul = 0;
		  color_rojo = 0;
		  color_verde = 0;
		  color_celeste = 0;
		  index = 0;
		    
        i = 0;
        j = 0;

        stepx = (10'd640 - ancho) / 10'd10;
        stepy = (10'd480 - ancho) / 10'd5;
        x0 = stepx / 10'd2 + ancho / 10'd2;
        y0 = stepy / 5'd2 + ancho / 10'd2;
		  
		  ajuste_x = 30;
		  ajuste_y = 29;

		  if (win) begin 
				caso_win();
		  end
		  else if (lose) begin
				caso_lose();
		  end
			else begin
        for (i = 0; i < 10; i = i + 1) begin // Cambiar el límite a 10 para tener 10 columnas
				x0 = stepx / 10'd2 + ancho / 10'd2;
            for (j = 0; j < 10; j = j + 1) begin // Iterar sobre las 5 filas
				
					 x0 = x0 + (j == 5 ? 5 : 0);
					 
                if (((x + stepx / 2 + ancho / 2 > x0 && x < x0 + stepx / 2 + ancho / 2 && y + stepy / 2 + ancho / 2 > y0 && y + stepy / 2 < y0 + ancho / 2) 
                     || (x + stepx / 2 + ancho / 2 > x0 && x < x0 + stepx / 2 + ancho / 2 && y + ancho / 2 > y0 + stepy / 2 && y < y0 + stepy / 2 + ancho / 2) 
                     || (y + stepy / 2 + ancho / 2 > y0 && y < y0 + stepy / 2 + ancho / 2 && x + stepx / 2 + ancho / 2 > x0 && x + stepx / 2 < x0 + ancho / 2) 
                     || (y + stepy / 2 + ancho / 2 > y0 && y < y0 + stepy / 2 + ancho / 2 && x > x0 - ancho / 2 + stepx / 2 && x < x0 + stepx / 2 + ancho / 2)) && (j < 5)) begin
				
                        color_verde= 1;

                end else if (((x + stepx / 2 + ancho / 2 > x0 && x < x0 + stepx / 2 + ancho / 2 && y + stepy / 2 + ancho / 2 > y0 && y + stepy / 2 < y0 + ancho / 2) 
                     || (x + stepx / 2 + ancho / 2 > x0 && x < x0 + stepx / 2 + ancho / 2 && y + ancho / 2 > y0 + stepy / 2 && y < y0 + stepy / 2 + ancho / 2) 
                     || (y + stepy / 2 + ancho / 2 > y0 && y < y0 + stepy / 2 + ancho / 2 && x + stepx / 2 + ancho / 2 > x0 && x + stepx / 2 < x0 + ancho / 2) 
                     || (y + stepy / 2 + ancho / 2 > y0 && y < y0 + stepy / 2 + ancho / 2 && x > x0 - ancho / 2 + stepx / 2 && x < x0 + stepx / 2 + ancho / 2)) && (j >= 5)) begin
				
                       color_rojo = 1;
				 
										 
					 end 
                x0 = x0 + stepx;
            end
            y0 = y0 + stepy;
        end
		  
		  for (i = 0;i < 5;i = i + 1)begin
				x0 = stepx / 10'd2 + ancho / 10'd2;
				for(j=0;j < 5;j= j + 1)begin 
				
					index = (i * 10) + (j * 2);
					
						red = 8'b00000000;
						green = 8'b00000000;
						blue = 8'b00000000;

					 x0 = x0 + stepx; 
				end
				y0 = y0 + stepy;
		  end
		  end
		  

        if (color_blanco) begin
            red = 8'b11111111;
            green = 8'b11111111;
            blue = 8'b11111111; 
        end else if (color_azul)begin 
				red = 8'b00000000;
            green = 8'b00000000;
            blue = 8'b11111111;
		  end else if (color_rojo)begin 
				red = 8'b11111111;
            green = 8'b00000000;
            blue = 8'b00000000;
		  end else if (color_verde)begin 
				red = 8'b00000000;
            green = 8'b11111111;
            blue = 8'b00000000;
		  end else if (color_celeste)begin
				red = 8'b01100110;
				green = 8'b10010100;
				blue = 8'b11011000;
		  end else begin
            red = 8'b00000000;
            green = 8'b00000000;
            blue = 8'b00000000;
        end 
		  
    end
	 

	 
	 
	 function void caso_win();
	 
	 //Pantalla perder

	 endfunction
	 
	function void caso_lose();
		// Pantalla perder

	endfunction
	 
	 
endmodule
