module StateMachine ()

 // Define states
typedef enum logic [2:0] { START, PLAY, PC, WIN, LOSE } state_t;

state_t current_state, next_state;

// State transition
always @(posedge clk or posedge rst) begin
   if (rst) begin
     state_reg <= START;
   end else begin
     state_reg <= next_state_reg;
   end
 end
  
endmodule

// Next State Logic

always @(*) begin
    case (state_reg)
	 
      START: begin next_state_reg = initGame? PLAY : START; end
		
      PLAY: begin next_state_reg = (timeExpired || playerMov) ? PC : PLAY; end
		
      PC: begin next_state_reg = playerWin ? WIN : pcWin ? LOSE : PLAY; end
		
      WIN, LOSE: begin next_state_reg = state_reg; end
		
      default: next_state_reg = START;
		
    endcase
 end
