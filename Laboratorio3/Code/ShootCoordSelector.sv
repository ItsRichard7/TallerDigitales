module ShootCoordSelector (
	input logic rst, incButton,
	output logic [2:0] shootCoord
);

logic [2:0] shootCoordTMP;

always_ff @(posedge incButton or posedge rst) begin
	if (incButton) shootCoordTMP <= shootCoordTMP + 1;
	else shootCoordTMP <= 3'b001;
end

assign shootCoord = shootCoordTMP;

endmodule