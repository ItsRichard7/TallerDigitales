module Battleship(
	input logic clk, rstSwitch, rowButton, colButton, selectButton,
	output logic [6:0] rowSeg, colSeg, pcBoatsLeft, playerBoatsLeft,
	output logic [9:0] message,
	output logic newClk,
	output [7:0] red,
	output [7:0] green,
	output [7:0] blue,
	output vgaclock,
	output hsync,
	output vsync,
	output n_blank
);

// Create variables
logic initGame, timeExpired, playerMov, playerWin, pcWin, startState, playState, pcState, winState, loseState, done;
logic [2:0] rowCoord, colCoord, pcBoats, playerBoats;
//Add other modules

reg [4:0] actual_row;
reg [4:0] actual_col;

wire logic [4:0] row;
wire logic [4:0] col;


reg [2:0] matrix_player [0:4][0:4] = '{'{0, 0, 0, 2, 0}, '{3, 3, 0, 1, 1}, '{0, 0, 0, 0, 0}, '{0, 0, 0, 0, 0}, '{0, 0, 0, 0, 0}};
reg [2:0] matrix_pc [0:4][0:4] = '{'{3'b000, 3'b000, 3'b000, 3'b000, 3'b000}, '{3'b000, 3'b000, 3'b000, 3'b000, 3'b000}, '{3'b000, 3'b000, 3'b000, 3'b000, 3'b000}, '{3'b000, 3'b000, 3'b000, 3'b000, 3'b000}, '{3'b000, 3'b000, 3'b000, 3'b000, 3'b000}};
reg [2:0] matrix [0:4][0:4];


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

NCounter #(4) ncounter (
	.clk(newClk), .rst(rstSwitch), .number(4'b1100), .done(done)
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

vgaController controladorVga(
				.clock(clk),
				.reset(rstSwitch),
				.matrix_pc(matrix),
				.matrix_player(matrix_player),
				.win(win),
				.lose(lose),
				.red(red),
				.green(green),
				.blue(blue),
				.vgaclock(vgaclock),
				.hsync(hsync),
				.vsync(vsync),
				.n_blank(n_blank)
	);

endmodule