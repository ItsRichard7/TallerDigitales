module StateMachine (
	input logic clk, rst, initGame, timeExpired, playerMov, playerWin, pcWin,
	output logic startState, playState, pcState, winState, LoseState
)

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
 
  
endmodule

// Next State Logic

always @(*) begin
    case (state)
	 
      START: begin nextState = initGame? PLAY : START; end
		
      PLAY: begin nextState = (timeExpired || playerMov) ? PC : PLAY; end
		
      PC: begin nextState = playerWin ? WIN : pcWin ? LOSE : PLAY; end
		
      WIN, LOSE: begin nextState = state_reg; end
		
      default: nextState = START;
		
    endcase
 end

 // Outputs Logic

  assign startState = (current_state == START)
  assign playState = (current_state == PLAY);
  assign pcState = (current_state == PLAY);
  assign winState = (current_state == WIN);
  assign loseState = (current_state == LOSE);