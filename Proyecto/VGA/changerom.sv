// Modulo para cambiar la letra a dibujar
module changeRom(
	input logic clk, input logic [7:0] ch,
	input logic [2:0] xoff, yoff, input logic [9:0] posx, posy,
	output logic pixel);
	
	
	
logic [5:0] charrom[236:0]; // Generador del almacenador de Caracter ROM

logic [7:0] line; // Una linea leida por la ROM

logic [4:0] q, data;

logic [9:0] address = 8'h00;

logic wren;



always @* begin

	address = posx/8; //Address a leer, dependiendo de la posicion en pixel
	
end

	// Lee la informacion en el adrress
Ram1 Ram1(address, clk, data, wren, q);


// Inicializa el ROM, lo guarda en charrom
initial begin 
$readmemb("charrom.txt", charrom); end

// Quita 65 porque A es 1 en el charrom
	always @* begin
	//Impide dibujar a partir de la segunda linea
	//Esto por temas de pruebas
	if (posy < 32 ) begin
	
		if (q == 1) begin												//A
			 line = charrom[yoff + {ch-65, 3'b000 + 8 }];
			 
		end else if (q == 2) begin									//B
			 line = charrom[yoff + {ch-65, 3'b000 + 16}];
			 
		end else if (q == 3) begin  								//C
			 line = charrom[yoff + {ch-65, 3'b000 + 24}];
			 
		end else if (q == 4) begin									//D
			 line = charrom[yoff + {ch-65, 3'b000 + 32}];
			 
		end else if (q == 5) begin									//E
			 line = charrom[yoff + {ch-65, 3'b000 + 40}];
			 
		end else if (q == 6) begin									//F
			 line = charrom[yoff + {ch-65, 3'b000 + 48}];
			 
		end else if (q == 7) begin									//G
			 line = charrom[yoff + {ch-65, 3'b000 + 56}];
			 
		end else if (q == 8) begin									//H
			 line = charrom[yoff + {ch-65, 3'b000 + 64}];
			 
		end else if (q == 9) begin									//I
			 line = charrom[yoff + {ch-65, 3'b000 + 72}];
			 
		end else if (q == 10) begin								//J
			 line = charrom[yoff + {ch-65, 3'b000 + 80}];
			 
		end else if (q == 11) begin								//K
			 line = charrom[yoff + {ch-65, 3'b000 + 88}];
			 
		end else if (q == 12) begin								//L
			 line = charrom[yoff + {ch-65, 3'b000 + 96}];
			 
		end else if (q == 13) begin								//M
			 line = charrom[yoff + {ch-65, 3'b000 + 104}];
			 
		end else if (q == 14) begin								//N
			 line = charrom[yoff + {ch-65, 3'b000 + 112}];
			 
		end else if (q == 15) begin								//O
			 line = charrom[yoff + {ch-65, 3'b000 + 120}];
			 
		end else if (q == 16) begin								//P
			 line = charrom[yoff + {ch-65, 3'b000 + 128}];
			 
		end else if (q == 17) begin								//Q
			 line = charrom[yoff + {ch-65, 3'b000 + 136}];
			 
		end else if (q == 18) begin								//R
			 line = charrom[yoff + {ch-65, 3'b000 + 144}];
			 
		end else if (q == 19) begin								//S
			 line = charrom[yoff + {ch-65, 3'b000 + 152}];
			 
		end else if (q == 20) begin								//T
			 line = charrom[yoff + {ch-65, 3'b000 + 160}];
			 
		end else if (q == 21) begin								//U
			 line = charrom[yoff + {ch-65, 3'b000 + 168}];
			 
		end else if (q == 22) begin								//V
			 line = charrom[yoff + {ch-65, 3'b000 + 176}];
			 
		end else if (q == 23) begin								//W
			 line = charrom[yoff + {ch-65, 3'b000 + 184}];
			 
		end else if (q == 24) begin								//X
			 line = charrom[yoff + {ch-65, 3'b000 + 192}];
			 
		end else if (q == 25) begin								//Y
			 line = charrom[yoff + {ch-65, 3'b000 + 200}];
			 
		end else if (q == 26) begin								//Z
			 line = charrom[yoff + {ch-65, 3'b000 + 208}];
			 
		end else if (q == 27) begin								//SIMBOLO *
			 line = charrom[yoff + {ch-65, 3'b000 + 216}];
			 
		end else if (q == 28) begin								//SIMBOLO #
			 line = charrom[yoff + {ch-65, 3'b000 + 224}];
			 	 
		end else begin													//ESPACIO
			 line = charrom[yoff + {ch-65, 3'b000 + 0 }];
			 
		end
	end else begin
		line = charrom[yoff + {ch-65, 3'b000 + 0}]; //ESPACIO por defecto
	end
	
end

	
// Le damos vuelta al orden de bits
	assign pixel = line[3'd7-xoff];
	
endmodule


