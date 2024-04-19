module comparador_igual #(parameter n = 5) (input wire [n-1:0] a,
														 input wire [n-1:0] b,
														 output reg iguales);

    always @* begin
      if (a == b) begin
        iguales = 1;
      end
      else begin
        iguales = 0;
      end
    end
	 
endmodule