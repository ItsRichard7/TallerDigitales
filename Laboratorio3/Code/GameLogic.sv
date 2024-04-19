module GameLogic (
    input reg clk, rst, selectButton, startState, playState, pcState, winState, loseState,
	 input reg [2:0] rowCoord, colCoord,
    output reg initGame,
    output reg [4:0] pcBoard [4:0],
    output reg [4:0] playerBoard [4:0],
    output reg [4:0] defaultBoard [4:0]
);

reg [4:0] pcBoard_internal [4:0];
reg [4:0] playerBoard_internal [4:0];
reg buttonPressed, createBords, numGenerate, playerShoot, pcShoot;
reg [2:0] ramPlayerBoard, ramPcBoard, ramRowShoot, ramColumnShoot;
reg [2:0] seedA = 3'b000;
reg [2:0] seedB = 3'b110;
reg [2:0] seedC = 3'b010;
reg [2:0] seedD = 3'b111;

randomNumGenerator playerBoardPreset (
    .clk(clk),
    .reset(rst), 
    .numGenerate(numGenerate),
    .seed(seedA), 
    .ranNum(ramPlayerBoard)
);

randomNumGenerator pcBoardPreset (
    .clk(clk),
    .reset(rst),
	 .numGenerate(numGenerate), 
    .seed(seedB), 
    .ranNum(ramPcBoard)
);

randomNumGenerator pcRowShoot (
    .clk(clk),
    .reset(rst), 
	 .numGenerate(pcShoot),
    .seed(seedC), 
    .ranNum(ramRowShoot)
);

randomNumGenerator pcColumnShoot (
    .clk(clk),
    .reset(rst), 
	 .numGenerate(pcShoot),
    .seed(seedD), 
    .ranNum(ramColumnShoot)
);

GenMatrixAlea pcTable (
    .matrixNumber(ramPcBoard),   // Número del 1 al 5 en binario
    .board(pcBoard)    // Tablero 5x5
);

GenMatrixAlea playerTable (
    .matrixNumber(ramPlayerBoard),   // Número del 1 al 5 en binario
    .board(playerBoard)    // Tablero 5x5
);

BattleshipBoard pcBoardShoot(
    .clk(clk),      // Clock
    .rst(rst),      // Reset
    .shoot(playerShoot), // Flag para disparar
    .shootRow(rowCoord),    // Fila del disparo
    .shootCol(colCoord),    // Columna del disparo
    .board(pcBoard_internal)    // Tablero 5x5
);

BattleshipBoard playerBoardShoot(
    .clk(clk),      // Clock
    .rst(rst),      // Reset
    .shoot(pcShoot), // Flag para disparar
    .shootRow(ramRowShoot),    // Fila del disparo
    .shootCol(ramColumnShoot),   // Columna del disparo    
    .board(playerBoard_internal)    // Tablero 5x5
);
	 
always @(posedge clk or posedge rst or posedge selectButton) begin
	 if (selectButton) buttonPressed <= 1; 
    else begin
		if (rst) begin
        buttonPressed <= 0;
        numGenerate <= 0;
        playerShoot <= 0;
		end else begin
			if (startState) begin
				numGenerate <= 0;
				playerShoot <= 0;
         end else if (playState) begin
				numGenerate <= 1;
         end else if (buttonPressed) begin
            playerShoot <= 1;
			end else if (pcState) begin
				playerShoot <= 0;
			end else if (winState) begin
				playerShoot <= 0;
			end else if (loseState) begin
			playerShoot <= 0;
			end
		end
	end
end

assign initGame = (startState == 1'b1) && (buttonPressed == 1'b1);
assign defaultBoard = '{5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000};

endmodule
