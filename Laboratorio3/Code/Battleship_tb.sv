module Battleship_tb;

logic[7:0] firstMessage, secondMessage, message;
logic control;

Multiplexor multiplexor(
	.firstMessage(firstMessage),
	.secondMessage(secondMessage),
	.control(control),
	.message(message)
);

initial begin
	firstMessage = 8'b0;
	secondMessage = 8'b11111111;
	control = 0;
	#30;
	control = 1;
	#30;
	$finish;
end

endmodule