module Division #(parameter N = 4)(
    input logic [N-1:0] dividend,
    input logic [N-1:0] divisor,
    output logic [N-1:0] quotient,
	 output logic zero,
	 output logic overflow
);
    integer i;
    reg [N-1:0] temp;

    always @* begin
        quotient = 0;
        temp = dividend;
        for (i = 2**N; i >= 0; i = i - 1) begin
            if (temp >= divisor & divisor != 0) begin
                temp = temp - divisor;
                quotient = quotient + 1;
				end
        end
		  zero = (dividend < divisor) ? 1'b1 : 1'b0;
        overflow = (divisor == 0) ? 1'b1 : 1'b0;
    end
endmodule


