module Frecuency #(parameter N = 4) (
  input  logic clk,
  input  logic rst,
  input  logic [N - 1: 0] firstNum, secondNum,
  input  logic [1:0] operation,
  output logic  [6: 0] firstSegment, secondSegment, resultSegment,
  output logic carry, negative, zero, overflow
  );
  
  ALU #(N) uut (
	
    .firstNum(firstNum),
    .secNum(secNum),
    .operation(operation),
	 
    .firstSegment(firstSegment),
    .secondSegment(secondSegment),
    .resultSegment(resultSegment),
	 
    .carry(carry),
    .negative(negative),
    .zero(zero),
    .overflow(overflow)
  );

  logic [N - 1: 0] q1, q2, result;
  
  always_ff @(posedge clk, posedge rst) begin
    if (rst) begin
		q1 <= 0;
		q2 <= 0;
		salida <= 0;
	end
	
	else begin
	 q1 <= a;
	 q2 <= b;
	 salida <= result;
  end
  
  end
endmodule