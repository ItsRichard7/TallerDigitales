module Battleship(
	input logic clk, rstSwitch, rowButton, colButton, selectButton,
	output logic [6:0] rowSeg, columnSeg, pcBoatsLeft, playerBoatsLeft,
	output logic [9:0] message
);

// Create variables
logic initGame, timeExpired, playerMov, playerWin, pcWin, startState, playState, pcState, winState, loseState;
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