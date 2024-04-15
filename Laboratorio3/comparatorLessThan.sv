module comparatorLessThan #(parameter n = 3) (input wire [n-1:0] a,
														 input wire [n-1:0] b,
														 output reg res);

    always @* begin
      if (a < b) begin
        res = 1;
      end
      else begin
        
		  res = 0;
      end
    end
	 
endmodule