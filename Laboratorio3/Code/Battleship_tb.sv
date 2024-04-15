module Battleship_tb;

logic clk, rstSwitch, rowButton, colButton, selectButton;
logic [6:0] rowSeg, colSeg, pcBoatsLeft, playerBoatsLeft;
logic [9:0] message;

Battleship battleship(
	.clk(clk), .rstSwitch(rstSwitch), .rowButton(rstSwitch), .colButton(rstSwitch), 
	.selectButton(selectButton), .rowSeg(rowSeg), .colSeg(colSeg), .pcBoatsLeft(pcBoatsLeft), 
	.playerBoatsLeft(playerBoatsLeft), .message(message)
);

always begin
		#1000 clk = ~clk;
end

initial begin
	clk = 1;
	rstSwitch = 1;
	rowButton = 0;
	colButton = 0;
	selectButton = 0;
	#20;
	rstSwitch = 0;
end

endmodule
