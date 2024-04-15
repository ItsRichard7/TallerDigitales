module SevenSegment(
    input logic [2:0] number, 
    output logic [6:0] segOutput
);

always_comb begin
    case(number)
        3'b000: segOutput = 7'b000_0001; // 0
        3'b001: segOutput = 7'b100_1111; // 1
        3'b010: segOutput = 7'b001_0010; // 2
        3'b011: segOutput = 7'b000_0110; // 3
        3'b100: segOutput = 7'b100_1100; // 4
        3'b101: segOutput = 7'b010_0100; // 5
        3'b110: segOutput = 7'b010_0000; // 6
        3'b111: segOutput = 7'b000_1111; // 7
        default: segOutput = 7'b111_1111; // Invalid Case
    endcase
end

endmodule
