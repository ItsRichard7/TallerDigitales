module ALU #(parameter N=4)
(
  input logic [N-1:0] firstNum, // Primer Operando
  input logic [N-1:0] secNum, // Segundo Operando
  input logic [1:0] operation, // Código de Operación
  output logic [6:0] firstSegment, // Salida a 7 Seg
  output logic [6:0] secondSegment, // Salida a 7 Seg
  output logic [6:0] resultSegment, // Salida a 7 Seg
  output logic carry, // Flag para el acarreo
  output logic negative // Flag para el negativo
);

 logic [N-1:0] result;

 // Representar primer número
  SevenSegment #(.N(N)) firstDisplay (
    .number(firstNum),
    .segOutput(firstSegment)
  );
	
 // Representar segundo número
  SevenSegment #(.N(N)) secDisplay (
    .number(secNum),
    .segOutput(secondSegment)
  );
  
  Subtractor subtractor(
		.minuendo(firstNum),
		.sustraendo(secNum),
		.diferencia(result),
		.negative(negative)
  );
  
/*
  Adder #(.N(N)) adder(
		.num1(firstNum),
      .num2(secNum),
      .cin(1'b0),
      .sum(result),
      .cout(carry)
	);
*/
	
	SevenSegment #(.N(N)) resultDisplay (
    .number(result),
    .segOutput(resultSegment)
  );
  
endmodule