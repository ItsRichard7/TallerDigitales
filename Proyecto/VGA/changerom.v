// Modulo para cambiar la letra a dibujar
module chargenrom(input logic clk, input logic [7:0] ch,
input logic [2:0] xoff, yoff, input logic [9:0] posx, posy,
output logic pixel);
logic [5:0] charrom[224:0]; // Generador del almacenador de Caracter ROM
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

	if (posy < 16 ) begin //Impide dibujar a partir de la segunda linea
		if (q == 65 | q == 97) begin								//A
			 line = charrom[yoff + {ch-65, 3'b000 + 8 }];
		end else if (q == 66 | q == 98) begin					//B
			 line = charrom[yoff + {ch-65, 3'b000 + 16}];
		end else if (q == 67 | q == 99) begin  				//C
			 line = charrom[yoff + {ch-65, 3'b000 + 24}];
		end else if (q == 68 | q == 100) begin				//D
			 line = charrom[yoff + {ch-65, 3'b000 + 32}];
		end else if (q == 69 | q == 101) begin				//E
			 line = charrom[yoff + {ch-65, 3'b000 + 40}];
		end else if (q == 70 | q == 102) begin				//F
			 line = charrom[yoff + {ch-65, 3'b000 + 48}];
		end else if (q == 71 | q == 103) begin				//G
			 line = charrom[yoff + {ch-65, 3'b000 + 56}];
		end else if (q == 72 | q == 104) begin				//H
			 line = charrom[yoff + {ch-65, 3'b000 + 64}];
		end else if (q == 73 | q == 105) begin				//I
			 line = charrom[yoff + {ch-65, 3'b000 + 72}];
		end else if (q == 74 | q == 106) begin				//J
			 line = charrom[yoff + {ch-65, 3'b000 + 80}];
		end else if (q == 75 | q == 107) begin				//K
			 line = charrom[yoff + {ch-65, 3'b000 + 88}];
		end else if (q == 76 | q == 108) begin				//L
			 line = charrom[yoff + {ch-65, 3'b000 + 96}];
		end else if (q == 77 | q == 109) begin				//M
			 line = charrom[yoff + {ch-65, 3'b000 + 104}];
		end else if (q == 78 | q == 110) begin				//N
			 line = charrom[yoff + {ch-65, 3'b000 + 112}];
		end else if (q == 79 | q == 111) begin				//O
			 line = charrom[yoff + {ch-65, 3'b000 + 120}];
		end else if (q == 80 | q == 112) begin				//P
			 line = charrom[yoff + {ch-65, 3'b000 + 128}];
		end else if (q == 81 | q == 113) begin				//Q
			 line = charrom[yoff + {ch-65, 3'b000 + 136}];
		end else if (q == 82 | q == 114) begin				//R
			 line = charrom[yoff + {ch-65, 3'b000 + 144}];
		end else if (q == 83 | q == 115) begin				//S
			 line = charrom[yoff + {ch-65, 3'b000 + 152}];
		end else if (q == 84 | q == 116) begin				//T
			 line = charrom[yoff + {ch-65, 3'b000 + 160}];
		end else if (q == 85 | q == 117) begin				//U
			 line = charrom[yoff + {ch-65, 3'b000 + 168}];
		end else if (q == 86 | q == 118) begin				//V
			 line = charrom[yoff + {ch-65, 3'b000 + 176}];
		end else if (q == 87 | q == 119) begin				//W
			 line = charrom[yoff + {ch-65, 3'b000 + 184}];
		end else if (q == 88 | q == 120) begin				//X
			 line = charrom[yoff + {ch-65, 3'b000 + 192}];
		end else if (q == 89 | q == 121) begin				//Y
			 line = charrom[yoff + {ch-65, 3'b000 + 200}];
		end else if (q == 90 | q == 122) begin				//Z
			 line = charrom[yoff + {ch-65, 3'b000 + 208}];
		end else if (q == 35) begin								//SIMBOL
			 line = charrom[yoff + {ch-65, 3'b000 + 216}];
		end else begin
			 line = charrom[yoff + {ch-65, 3'b000 + 0 }];   //ESPACIO
		end
	end else begin
		line = charrom[yoff + {ch-65, 3'b000 + 0}]; //ESPACIO por defecto
	end
	end
	
// Le damos vuelta al orden de bits
	assign pixel = line[3'd7-xoff];
endmodule
