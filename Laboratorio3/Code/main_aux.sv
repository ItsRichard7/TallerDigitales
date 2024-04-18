module main_aux(
				input clock,
				input reset,
				input logic direction,
				input logic move_h,
				input logic move_v,
				input logic fire,
				input logic [2:0] amount_boats,
				output [6:0] segA,
				output [7:0] red,
				output [7:0] green,
				output [7:0] blue,
				output vgaclock,
				output hsync,
				output vsync,
				output n_blank);

	reg [2:0] matrix_player [0:4][0:4] = '{'{0, 0, 0, 2, 0}, '{3, 3, 0, 1, 1}, '{0, 0, 0, 0, 0}, '{0, 0, 0, 0, 0}, '{0, 0, 0, 0, 0}};
   reg [2:0] matrix_pc [0:4][0:4] = '{'{3'b001, 3'b000, 3'b000, 3'b000, 3'b000}, '{3'b000, 3'b000, 3'b000, 3'b000, 3'b000}, '{3'b000, 3'b000, 3'b000, 3'b000, 3'b000}, '{3'b000, 3'b000, 3'b000, 3'b000, 3'b000}, '{3'b000, 3'b000, 3'b000, 3'b000, 3'b000}};
	reg [2:0] matrix [0:4][0:4];
	
	reg [4:0] actual_row;
	reg [4:0] actual_col;
	
	wire logic [4:0] row;
	wire logic [4:0] col;

	logic hit = 1;
	
   wire start; // Señal de inicio para comenzar el juego
	wire full_boat_placed; // Señal que indica si el jugador colocó un barco completo
	wire time_expired; // Señal que indica si se agotó el límite de tiempo
	wire boats_player;
	wire boats_pc;
	wire player_mov;
	wire play;
	wire win; // Señal que indica victoria
	wire lose; // Señal que indica derrota
	
	Battleship_FSM Battleship_FSM_inst (
    .clk(clk),
    .rst(rst),
    .start(start),
    .full_boat_placed(full_boat_placed),
    .time_expired(time_expired),
    .boats_player(boats_player),
    .boats_pc(boats_pc),
    .player_mov(player_mov),
    .play(play),
    .win(win),
    .lose(lose)
  );
  
  SieteSeg seg_inst(
  .count(amount_boats),
  .segA(segA)
  );
  
  boats boats_inst (
	.amount_boats(amount_boats), 
	.boats_placed(boats_player), 
	.full_boat_placed(full_boat_placed)
  );
  
  move move_inst (
	 .move_h(move_h),
	 .move_v(move_v),
	 .actual_row(actual_row),
	 .actual_col(actual_col),
	 .direction(direction),
	 .row(row),
	 .col(col)  
  );
  
	 
  update_matrix_pc update_inst (
    .row(row),
    .col(col),
	 .clock(clock),
	 .reset(reset),
    .matrix_pc(matrix_pc),
	 .matrix(matrix),
	 .actual_row(actual_row),
	 .actual_col(actual_col)
	);
	
	controlador_vga controlador_vga_inst(
				.clock(clock),
				.reset(reset),
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