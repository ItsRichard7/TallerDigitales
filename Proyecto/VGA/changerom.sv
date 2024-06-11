module changeRom(
    input logic clk,
    input logic [7:0] ch,
    input logic [2:0] xoff, yoff,
    input logic [9:0] posx, posy,
    input logic switch,
    output logic pixel
);

logic [7:0] charrom[0:2399]; // Generador del almacenador de Caracter ROM unidimensional

logic [7:0] line; // Una línea leída por la ROM
logic [4:0] q;
logic [9:0] address;

logic [7:0] s, r; // Outputs de las RAMs

logic wren = 1'b0;

// Inicializa el ROM, lo guarda en charrom
initial begin 
    $readmemb("charrom.txt", charrom);
end

// Address a leer, dependiendo de la posición en píxeles
always @* begin
    address = (posx / 8) + (posy / 8) * 80; // Calcula la dirección en base a la posición x e y
end

// Instancias de RAM
RamMemory ram1(.address(address), .clock(clk), .data(), .wren(wren), .q(s));
SecondRam ram2(.address(address), .clock(clk), .data(), .wren(wren), .q(r));

// Multiplexor para seleccionar la salida de la RAM en función del switch
always_comb begin
    if (switch) begin
        q = r[4:0];
    end else begin
        q = s[4:0];
    end
end

// Quita 65 porque A es 1 en el charrom
always_comb begin
    if (posy >= 0 && posy < 64) begin
        case (q)
            5'd1: line = charrom[yoff + {ch-65, 3'b000 + 8*1 }];  // A
            5'd2: line = charrom[yoff + {ch-65, 3'b000 + 8*2 }];  // B
            5'd3: line = charrom[yoff + {ch-65, 3'b000 + 8*3 }];  // C
            5'd4: line = charrom[yoff + {ch-65, 3'b000 + 8*4 }];  // D
            5'd5: line = charrom[yoff + {ch-65, 3'b000 + 8*5 }];  // E
            5'd6: line = charrom[yoff + {ch-65, 3'b000 + 8*6 }];  // F
            5'd7: line = charrom[yoff + {ch-65, 3'b000 + 8*7 }];  // G
            5'd8: line = charrom[yoff + {ch-65, 3'b000 + 8*8 }];  // H
            5'd9: line = charrom[yoff + {ch-65, 3'b000 + 8*9 }];  // I
            5'd10: line = charrom[yoff + {ch-65, 3'b000 + 8*10 }]; // J
            5'd11: line = charrom[yoff + {ch-65, 3'b000 + 8*11 }]; // K
            5'd12: line = charrom[yoff + {ch-65, 3'b000 + 8*12 }]; // L
            5'd13: line = charrom[yoff + {ch-65, 3'b000 + 8*13 }]; // M
            5'd14: line = charrom[yoff + {ch-65, 3'b000 + 8*14 }]; // N
            5'd15: line = charrom[yoff + {ch-65, 3'b000 + 8*15 }]; // O
            5'd16: line = charrom[yoff + {ch-65, 3'b000 + 8*16 }]; // P
            5'd17: line = charrom[yoff + {ch-65, 3'b000 + 8*17 }]; // Q
            5'd18: line = charrom[yoff + {ch-65, 3'b000 + 8*18 }]; // R
            5'd19: line = charrom[yoff + {ch-65, 3'b000 + 8*19 }]; // S
            5'd20: line = charrom[yoff + {ch-65, 3'b000 + 8*20 }]; // T
            5'd21: line = charrom[yoff + {ch-65, 3'b000 + 8*21 }]; // U
            5'd22: line = charrom[yoff + {ch-65, 3'b000 + 8*22 }]; // V
            5'd23: line = charrom[yoff + {ch-65, 3'b000 + 8*23 }]; // W
            5'd24: line = charrom[yoff + {ch-65, 3'b000 + 8*24 }]; // X
            5'd25: line = charrom[yoff + {ch-65, 3'b000 + 8*25 }]; // Y
            5'd26: line = charrom[yoff + {ch-65, 3'b000 + 8*26 }]; // Z
            5'd27: line = charrom[yoff + {ch-65, 3'b000 + 8*27 }]; // *
            5'd28: line = charrom[yoff + {ch-65, 3'b000 + 8*28 }]; // #
            default: line = charrom[yoff + {ch-65, 3'b000 + 8*0 }]; // ESPACIO
        endcase
    end else begin
        line = charrom[yoff + {ch-65, 3'b000 + 8*0 }]; // ESPACIO por defecto
    end
end

// Le damos vuelta al orden de bits
assign pixel = line[3'd7 - xoff];

endmodule
