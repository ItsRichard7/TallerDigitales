module comparador_mayor #(parameter n = 5) (input wire [n-1:0] a,
														 input wire [n-1:0] b,
														 output reg mayor);

    always @* begin
      if (a > b) begin
        mayor = 1;
      end
      else begin
        mayor = 0;
      end
    end
	 
endmodule