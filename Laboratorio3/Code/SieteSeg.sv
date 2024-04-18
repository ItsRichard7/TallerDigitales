module SieteSeg #(parameter N=3)(input reg [N-1:0] count,
											output reg [0:6] segA // 7-seg A
					);  // 7-segm B

	  
	  reg [2:0] bin;
	  wire [3:0] bcd;
	  
	  bin2bcd dut(
		 .bin(count),
		 .bcd(bcd)
	  );
	  
	  always @(*) begin

		 case (count)
			3'b000: segA = 7'b1000000;
			3'b001: segA = 7'b1111001;
			3'b010: segA = 7'b0100100;
			3'b011: segA = 7'b0110000;
			3'b100: segA = 7'b0011001;
			3'b101: segA = 7'b0010010;
			default: segA = 7'b1000000;
		 endcase
	end

  
endmodule