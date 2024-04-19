module Battleship(
	input logic clk, rstSwitch, rowButton, colButton, selectButton,
	output logic [6:0] rowSeg, colSeg, pcBoatsLeft, playerBoatsLeft,
	output logic [9:0] message
	output logic newClk;
);

// Create variables
logic initGame, timeExpired, playerMov, playerWin, pcWin, startState, playState, pcState, winState, loseState, done;
logic [2:0] rowCoord, colCoord, pcBoats, playerBoats;
//Add other modules

StateMachine statemachine (
	.clk(clk), .rst(rstSwitch), .initGame(initGame), .timeExpired(timeExpired), 
	.playerMov(playerMov), .playerWin(playerWin), .pcWin(pcWin), .startState(startState), 
	.playState(playState), .pcState(pcState), .winState(winState), .loseState(loseState)
);

ShootCoordSelector rowSelector (
	.rst(rstSwitch), .incButton(rowButton), .shootCoord(rowCoord)
);

ShootCoordSelector colSelector (
	.rst(rstSwitch), .incButton(colButton), .shootCoord(colCoord)
);

FrecDivider secClock (
	.clk(clk), .newClk(newClk)
);

Ncounter #(4) (
	clk(newClk), rst(rstSwitch), .number(4'b1100), .done(done)
);

SevenSegment rowSegment (
	.number(rowCoord), .segOutput(rowSeg)
);

SevenSegment colSegment (
	.number(colCoord), .segOutput(colSeg)
);

SevenSegment pcSegment (
	.number(pcBoats), .segOutput(pcBoatsLeft)
);

SevenSegment playerSegment (
	.number(playerBoats), .segOutput(playerBoatsLeft)
);

endmodule