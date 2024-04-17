module FrecDivider(
	input logic clk,
	output logic newClk
);

logic [26:0] count;

logic newClkTMP;

always_ff @ (posedge clk) begin
		if (count == 50_000_000) begin// Si el contador llega a 50,000,000, se resetea
				newClkTMP <= ~newClkTMP;
            count <= 0;
		end
      else begin
            count <= count + 1;
		end
end

assign newClk = newClkTMP;

endmodule