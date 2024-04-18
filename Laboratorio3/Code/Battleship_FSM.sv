module Battleship_FSM (
  input wire clk, // Entrada de reloj
  input wire rst, // Entrada de reinicio
  input wire start, // Señal de inicio para comenzar el juego
  input wire full_boat_placed, // Señal que indica si el jugador colocó un barco completo
  input wire time_expired, // Señal que indica si se agotó el límite de tiempo
  input wire boats_player,
  input wire boats_pc,
  input wire player_mov,
  output wire play,
  output wire win, // Señal que indica victoria
  output wire lose // Señal que indica derrota
);

  // Define estados
  typedef enum logic [2:0] {
    START,
    PLAY,
    PC,
    WIN,
    LOSE
  } state_t;

  state_t current_state, next_state;

  // Registros para estado y próximo estado
  state_t state_reg, next_state_reg;

  // Lógica de transición de estado
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      state_reg <= START;
    end else begin
      state_reg <= next_state_reg;
    end
  end

  // Lógica de próximo estado
  always @(*) begin
    case (state_reg)
      START: begin
        next_state_reg = full_boat_placed ? PLAY : START;
      end
      PLAY: begin
			next_state_reg = (time_expired || player_mov) ? PC : PLAY;
			
      end
      PC: begin
			// JUEGA LA PC
			next_state_reg = (boats_pc == 3'b0) ? WIN :
								  (boats_player == 3'b0) ? LOSE :
								  PLAY;
      end
      WIN, LOSE: begin
        next_state_reg = state_reg;
      end
      default: next_state_reg = START;
    endcase
  end

  // Lógica de salida
  assign current_state = state_reg;
  assign next_state = next_state_reg;
  assign win = (current_state == WIN);
  assign lose = (current_state == LOSE);
  assign play = (current_state == PLAY);

endmodule

