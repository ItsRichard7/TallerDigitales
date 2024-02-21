module SieteSeg
#(parameter N=6)
(
  input reg [N-1:0] count,
  output reg [6:0] segA, // 7-seg A
  output reg [6:0] segB  // 7-segm B
);

  reg [3:0] digito1; // Dígito menos significativo
  reg [3:0] digito2; // Dígito más significativo
  
  reg [5:0] bin;
  wire [7:0] bcd;
  
  bin2bcd dut(
    .bin(count),
    .bcd(bcd)
  );
  
  always @(*) begin
    digito1 = bcd[3:0];
    digito2 = bcd[7:4];

    case (digito1)
      4'b0000: segA = 7'b0000001;
      4'b0001: segA = 7'b1001111;
      4'b0010: segA = 7'b0010010;
      4'b0011: segA = 7'b0000110;
      4'b0100: segA = 7'b1001100;
      4'b0101: segA = 7'b0100100;
      4'b0110: segA = 7'b0100000;
      4'b0111: segA = 7'b0001111;
      4'b1000: segA = 7'b0000000;
      4'b1001: segA = 7'b0000100;
      default: segA = 7'b0000001;
    endcase

    case (digito2)
      4'b0000: segB = 7'b0000001;
      4'b0001: segB = 7'b1001111;
      4'b0010: segB = 7'b0010010;
      4'b0011: segB = 7'b0000110;
      4'b0100: segB = 7'b1001100;
      4'b0101: segB = 7'b0100100;
      4'b0110: segB = 7'b0100000;
      4'b0111: segB = 7'b0001111;
      4'b1000: segB = 7'b0000000;
      4'b1001: segB = 7'b0000100;
      default: segB = 7'b0000001;
    endcase
  end
endmodule