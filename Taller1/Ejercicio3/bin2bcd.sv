module bin2bcd(
   input [5:0] bin,
   output reg [7:0] bcd
);

integer i;

always @(bin) begin
   bcd = 0;         
   for (i = 0; i < 6; i = i + 1) begin             // Itera por cada bit de entrada
      if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;  // If BCD digit is >= 5, + 3
      if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
      bcd = {bcd[6:0], bin[5-i]};                  // Shift un bit, y shift por cada bit del input 
   end
end

endmodule