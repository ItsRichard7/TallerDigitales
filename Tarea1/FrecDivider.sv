module FrecDivider(
	input logic clk,
	output logic newClk
);

logic [25:0] count = 26'b0;
logic tempClk = 0;

always_ff @ (posedge clk) begin
    if (count >= 1_000) begin
        tempClk = ~tempClk;
        count = 26'b0;  // Reiniciar el contador después de invertir newClk
    end else begin
        count <= count + 1;  // Incrementar el contador en todos los ciclos, excepto cuando count == 1000
    end
end

assign newClk = tempClk;

endmodule