module Battleship (
	input logic clk, rstSwitch, colButton, rowButton, selectButton,
	output [6:0] rowSegment, columnSegment, pcBoatsLeft, playerBoatsLeft,
	output [9:0] message
);

// Create variables
logic initGame, timeExpired, playerMov, playerWin, pcWin, startState, playState, pcState, winState, loseState
//Add other modules

StateMachine statemachine (
	.clk(clk), .rst(rstSwitch), .initGame(initGame), .timeExpired(timeExpired), 
	.playerMov(playerMov), .playerWin(playerWin), .pcWin(pcWin), .startState(startState), 
	.playState(playState), .pcState(pcState), .winState(winState), .loseState(loseState)
)

endmodule