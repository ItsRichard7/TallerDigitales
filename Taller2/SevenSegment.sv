module SevenSegment #(parameter N = 4) 
(
    input logic [N-1:0] number,
    output logic [6:0] segOutput
);

// Assign output
always_comb begin
    case(number)
        4'b0000: segOutput = 7'b000_0001; // 0
        4'b0001: segOutput = 7'b100_1111; // 1
        4'b0010: segOutput = 7'b001_0010; // 2
        4'b0011: segOutput = 7'b000_0110; // 3
        4'b0100: segOutput = 7'b100_1100; // 4
        4'b0101: segOutput = 7'b010_0100; // 5
        4'b0110: segOutput = 7'b010_0000; // 6
        4'b0111: segOutput = 7'b000_1111; // 7
        4'b1000: segOutput = 7'b000_0000; // 8
        4'b1001: segOutput = 7'b000_0100; // 9
        4'b1010: segOutput = 7'b000_1000; // A
        4'b1011: segOutput = 7'b110_0000; // B
        4'b1100: segOutput = 7'b011_0001; // C
        4'b1101: segOutput = 7'b100_0010; // D
        4'b1110: segOutput = 7'b011_0000; // E
        4'b1111: segOutput = 7'b011_1000; // F
        default: segOutput = 7'b111_1111; // Blank if invalid
    endcase
end

endmodule
