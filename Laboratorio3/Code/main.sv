module main(input  clock,
				input  reset,
				input logic direction,
				input logic move_h,
				input logic move_v,
				input logic fire,
				input [2:0] amount_boats,
				output [6:0] segA,
				output [7:0] red,
				output [7:0] green,
				output [7:0] blue,
				output vgaclock,
				output hsync,
				output vsync,
				output n_blank);
				

main_aux main_aux_inst(
				.clock(clock),
				.reset(reset),
				.direction(direction),
				.move_h(move_h),
				.move_v(move_v),
				.fire(fire),
				.amount_boats(amount_boats),
				.segA(segA),
				.red(red),
				.green(green),
				.blue(blue),
				.vgaclock(vgaclock),
				.hsync(hsync),
				.vsync(vsync),
				.n_blank(n_blank));





endmodule 