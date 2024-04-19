module Multiplexor(
	input logic[9:0] firstMessage, secondMessage, thirdMessage,
	input logic controlA, controlB,
	output logic[9:0] message
);

always_comb begin
    if (controlA) message = firstMessage;
    else if (controlB) message = secondMessage;
	 else message = thirdMessage;
end

endmodule