module comparatorLessThan #(parameter n = 3) (
input logic[2:0] a, b, output logic res);

logic resTMP;

    always @* begin
      if (a < b) begin
         resTMP = 1;
      end
      else begin
        
		   resTMP = 0;
      end
    end
	 
	 assign res = resTMP;
	 
endmodule