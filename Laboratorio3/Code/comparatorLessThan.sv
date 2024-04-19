<<<<<<< HEAD
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
	 
=======
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
	 
>>>>>>> parent of 4520d45 (Modificaciones)
endmodule