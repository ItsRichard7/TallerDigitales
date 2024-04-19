module GameLogic (
	input logic clk, rst, selectButton, startState, playState, pcState, winState, loseState,
	output logic initGame 
);

logic buttonPressed;

always_ff (posegde clk or posedge rst or posedge selectButton) begin
	if (rst) begin
		buttonPressed <= 0;
	end
	if (selectButton) begin
		buttonPressed <= 1;
	end
	if (startState) begin
	end
	if (playState) begin
	end
	if (pcState) begin
	end 
	if (winState) begin
	end
	if (loseState) begin
	end
end

assign initGame = (startState and buttonPressed);

	
endmodule