module Mux (
	input logic[7:0] firstMessage, secondMessage,
	input logic control,
	output logic[7:0] message
);

always_comb begin
    if (control)
        message = secondMessage;
    else
        message = firstMessage;
end

endmodule