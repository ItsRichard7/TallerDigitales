module ALU #(parameter N=4)
(
  input logic [N-1:0] firstNum, // Primer Operando
  input logic [N-1:0] secNum, // Segundo Operando
  output logic [6:0] firstSegment, // Salida a 7 Seg
  output logic [6:0] secondSegment // Salida a 7 Seg
);


  SevenSegment #(.N(4)) firstDisplay (
    .number(firstNum),
    .segOutput(firstSegment)
  );
	
  SevenSegment #(.N(4)) secDisplay (
    .number(secNum),
    .segOutput(secondSegment)
  );

endmodule