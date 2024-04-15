module StateMachine(
	input logic clk, rst, initGame, timeExpired, playerMov, playerWin, pcWin,
	output logic startState, playState, pcState, winState, loseState
);

 // Define states
typedef enum logic [2:0] { START, PLAY, PC, WIN, LOSE } state_t;

/*---------------------------------------------------|
|                                                    |
|				START ----------------------> 000        |
|				PLAY -----------------------> 001        |
|				PC -------------------------> 010        |
|				WIN ------------------------> 011        |
|				LOSE -----------------------> 100        |
|                                                    |
|---------------------------------------------------*/

state_t state, nextState;

// State transition
always @(posedge clk or posedge rst) begin
   if (rst) begin
     state <= START;
   end else begin
     state <= nextState;
   end
 end

// Next State Logic

always @(*) begin
    case (state)
	 
      START: begin nextState = initGame? PLAY : START; end
		
      PLAY: begin nextState = (timeExpired || playerMov) ? PC : PLAY; end
		
      PC: begin nextState = playerWin ? WIN : pcWin ? LOSE : PLAY; end
		
      WIN, LOSE: begin nextState = state; end
		
      default: nextState = START;
		
    endcase
 end

 // Outputs Logic

  assign startState = (state == START);
  assign playState = (state == PLAY);
  assign pcState = (state == PLAY);
  assign winState = (state == WIN);
  assign loseState = (state == LOSE);
  
endmodule