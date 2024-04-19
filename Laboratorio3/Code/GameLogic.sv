module GameLogic (
    input logic clk, rst, selectButton, startState, playState, pcState, winState, loseState,
    output logic initGame,
    output reg [4:0] pcBoard [4:0],
    output reg [4:0] playerBoard [4:0],
    output reg [4:0] defaultBoard [4:0]
);

logic buttonPressed, createBords, numGenerate, shoot;
reg [2:0] ramPlayerBoard, ramPcBoard, ramRowShoot, ramColumnShoot;
wire [2:0] seedA = 3'b000;
wire [2:0] seedB = 3'b110;
wire [2:0] seedC = 3'b010;
wire [2:0] seedD = 3'b111;


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
    .seed(seedB), 
    .ranNum(ramPcBoard)
);
randomNumGenerator pcRowShoot (
     .clk(clk),
    .reset(rst), 
    .seed(seedC), 
    .ranNum(ramRowShoot)
);

randomNumGenerator pcColumnShoot (
     .clk(clk),
    .reset(rst), 
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

always @(posedge clk or posedge rst or posedge selectButton) begin
    if (rst) begin
        buttonPressed <= 0;
        numGenerate <= 0;
        shoot <= 0;
    end
    if (selectButton) begin
        buttonPressed <= 1;
    end
    if (startState) begin
        numGenerate <= 0;
    end
    if (playState) begin
        numGenerate <= 1;
        if (buttonPressed) begin
            shoot <= 1;
        end
    end
    if (pcState) begin
        shoot <= 0;
    end 
    if (winState) begin
        shoot <= 0;
    end
    if (loseState) begin
        shoot <= 0;
    end
end

assign initGame = (startState == 1'b1) && (buttonPressed == 1'b1);
assign defaultBoard = '{5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000};

endmodule
