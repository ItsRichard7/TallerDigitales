module ALU #(parameter N=4)
(
  input logic [N-1:0] firstNum, // Primer Operando
  input logic [N-1:0] secNum, // Segundo Operando
  input logic [1:0] operation, // Código de Operación
  output logic [6:0] firstSegment, // Salida a 7 Seg
  output logic [6:0] secondSegment, // Salida a 7 Seg
  output logic [6:0] resultSegment, // Salida a 7 Seg
  output logic carry, // Flag para el acarreo
  output logic negative, // Flag para el negativo
  output logic zero, // Flag para el cero
  output logic overflow
);

 logic [N-1:0] sumResult;
 logic [N-1:0] subResult;
 logic [N-1:0] result;
 logic sumCarry;
 logic sumZero;
 logic subNegative;
 logic subZero;

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
  
  Adder #(.N(N)) adder(
		.num1(firstNum),
      .num2(secNum),
      .cin(1'b0),
      .sum(sumResult),
      .cout(sumCarry),
		.zero(sumZero)
	);  
  
  Subtractor #(.N(N)) subtractor(
		.minuendo(firstNum),
		.sustraendo(secNum),
		.diferencia(subResult),
		.negative(subNegative),
		.zero(subZero)
  );
  
  always @(operation) begin
        case (operation)
            2'b00: begin // Caso de Suma
                result <= sumResult;
                carry <= sumCarry;
                negative <= 1'b0;
					 zero <= sumZero;
					 overflow <= 1'b0;
            end
            2'b01: begin // Caso de Resta
                result <= subResult;
                carry <= 1'b0;
                negative <= subNegative;
					 zero <= subZero;
					 overflow <= 1'b0;
            end
				/*
            2'b10: begin // Caso de División
                result = sumResult;
                carry = sumCarry;
                negative = 1'b0;
					 zero = ;
					 overflow = ;
            end
            default: begin
                // Handle invalid case (optional)
                // ...
            end
				*/
        endcase
    end
	 
  SevenSegment #(.N(N)) resultDisplay (
    .number(result),
    .segOutput(resultSegment)
  );
  
endmodule