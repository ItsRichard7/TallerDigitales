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
logic [6:0] q;
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
        q = r[6:0];
    end else begin
        q = s[6:0];
    end
end

// Quita 65 porque A es 1 en el charrom
always_comb begin
    if (posy >= 0 && posy < 64) begin
        case (q)
            6'd1: line = charrom[yoff + {ch-65, 3'b000 + 8*1 }];  // A
            6'd2: line = charrom[yoff + {ch-65, 3'b000 + 8*2 }];  // B
            6'd3: line = charrom[yoff + {ch-65, 3'b000 + 8*3 }];  // C
            6'd4: line = charrom[yoff + {ch-65, 3'b000 + 8*4 }];  // D
            6'd5: line = charrom[yoff + {ch-65, 3'b000 + 8*5 }];  // E
            6'd6: line = charrom[yoff + {ch-65, 3'b000 + 8*6 }];  // F
            6'd7: line = charrom[yoff + {ch-65, 3'b000 + 8*7 }];  // G
            6'd8: line = charrom[yoff + {ch-65, 3'b000 + 8*8 }];  // H
            6'd9: line = charrom[yoff + {ch-65, 3'b000 + 8*9 }];  // I
            6'd10: line = charrom[yoff + {ch-65, 3'b000 + 8*10 }]; // J
            6'd11: line = charrom[yoff + {ch-65, 3'b000 + 8*11 }]; // K
            6'd12: line = charrom[yoff + {ch-65, 3'b000 + 8*12 }]; // L
            6'd13: line = charrom[yoff + {ch-65, 3'b000 + 8*13 }]; // M
            6'd14: line = charrom[yoff + {ch-65, 3'b000 + 8*14 }]; // N
            6'd15: line = charrom[yoff + {ch-65, 3'b000 + 8*15 }]; // O
            6'd16: line = charrom[yoff + {ch-65, 3'b000 + 8*16 }]; // P
            6'd17: line = charrom[yoff + {ch-65, 3'b000 + 8*17 }]; // Q
            6'd18: line = charrom[yoff + {ch-65, 3'b000 + 8*18 }]; // R
            6'd19: line = charrom[yoff + {ch-65, 3'b000 + 8*19 }]; // S
            6'd20: line = charrom[yoff + {ch-65, 3'b000 + 8*20 }]; // T
            6'd21: line = charrom[yoff + {ch-65, 3'b000 + 8*21 }]; // U
            6'd22: line = charrom[yoff + {ch-65, 3'b000 + 8*22 }]; // V
            6'd23: line = charrom[yoff + {ch-65, 3'b000 + 8*23 }]; // W
            6'd24: line = charrom[yoff + {ch-65, 3'b000 + 8*24 }]; // X
            6'd25: line = charrom[yoff + {ch-65, 3'b000 + 8*25 }]; // Y
            6'd26: line = charrom[yoff + {ch-65, 3'b000 + 8*26 }]; // Z
            6'd27: line = charrom[yoff + {ch-65, 3'b000 + 8*27 }]; // *
            6'd28: line = charrom[yoff + {ch-65, 3'b000 + 8*28 }]; // #
				
				6'd29: line = charrom[yoff + {ch-65, 3'b000 + 8*29 }]; // A underlined
            6'd30: line = charrom[yoff + {ch-65, 3'b000 + 8*30 }]; // B underlined
            6'd31: line = charrom[yoff + {ch-65, 3'b000 + 8*31 }]; // C underlined
            6'd32: line = charrom[yoff + {ch-65, 3'b000 + 8*32 }]; // D underlined
            6'd33: line = charrom[yoff + {ch-65, 3'b000 + 8*33 }]; // E underlined
            6'd34: line = charrom[yoff + {ch-65, 3'b000 + 8*34 }]; // F underlined
            6'd35: line = charrom[yoff + {ch-65, 3'b000 + 8*35 }]; // G underlined
            6'd36: line = charrom[yoff + {ch-65, 3'b000 + 8*36 }]; // H underlined
            6'd37: line = charrom[yoff + {ch-65, 3'b000 + 8*37 }]; // I underlined
            6'd38: line = charrom[yoff + {ch-65, 3'b000 + 8*38 }]; // J underlined
            6'd39: line = charrom[yoff + {ch-65, 3'b000 + 8*39 }]; // K underlined
            6'd40: line = charrom[yoff + {ch-65, 3'b000 + 8*40 }]; // L underlined
            6'd41: line = charrom[yoff + {ch-65, 3'b000 + 8*41 }]; // M underlined
            6'd42: line = charrom[yoff + {ch-65, 3'b000 + 8*42 }]; // N underlined
            6'd43: line = charrom[yoff + {ch-65, 3'b000 + 8*43 }]; // O underlined
            6'd44: line = charrom[yoff + {ch-65, 3'b000 + 8*44 }]; // P underlined
            6'd45: line = charrom[yoff + {ch-65, 3'b000 + 8*45 }]; // Q underlined
            6'd46: line = charrom[yoff + {ch-65, 3'b000 + 8*46 }]; // R underlined
            6'd47: line = charrom[yoff + {ch-65, 3'b000 + 8*47 }]; // S underlined
            6'd48: line = charrom[yoff + {ch-65, 3'b000 + 8*48 }]; // T underlined
            6'd49: line = charrom[yoff + {ch-65, 3'b000 + 8*49 }]; // U underlined
            6'd50: line = charrom[yoff + {ch-65, 3'b000 + 8*50 }]; // V underlined
            6'd51: line = charrom[yoff + {ch-65, 3'b000 + 8*51 }]; // W underlined
            6'd52: line = charrom[yoff + {ch-65, 3'b000 + 8*52 }]; // X underlined
            6'd53: line = charrom[yoff + {ch-65, 3'b000 + 8*53 }]; // Y underlined
            6'd54: line = charrom[yoff + {ch-65, 3'b000 + 8*54 }]; // Z underlined
            6'd55: line = charrom[yoff + {ch-65, 3'b000 + 8*55 }]; // * underlined
            default: line = charrom[yoff + {ch-65, 3'b000 + 8*0 }]; // ESPACIO
        endcase
    end else begin
        line = charrom[yoff + {ch-65, 3'b000 + 8*0 }]; // ESPACIO por defecto
    end
end

// Le damos vuelta al orden de bits
assign pixel = line[3'd7 - xoff];

endmodule
