module ALU_tb;
  // Parámetros
  parameter N = 4;
  
  // Señales
  reg [N-1:0] firstNum;
  reg [N-1:0] secNum;
  reg [1:0] operation;
  

  wire [N-1:0] result;
  wire [6:0] firstSegment;
  wire [6:0] secondSegment;
  wire [6:0] resultSegment;
  
  
  wire carry;
  wire negative;
  wire zero;
  wire overflow;
  
  // Instancia del módulo ALU
  ALU #(N) uut (
	
    .firstNum(firstNum),
    .secNum(secNum),
    .operation(operation),
	 
	 .result(result),
	 
    .firstSegment(firstSegment),
    .secondSegment(secondSegment),
    .resultSegment(resultSegment),
	 
    .carry(carry),
    .negative(negative),
    .zero(zero),
    .overflow(overflow)
  );
  
  
	
	
	
	
	
  initial begin
    // Caso de prueba para la suma
	 #10;
	 
    operation = 2'b01;
    operation = 2'b00;
    firstNum = 4'b0010; // 2
    secNum = 4'b0110; // 6	 

	 
	 
    #10;
    
    // Segundo caso de prueba para la suma
    operation = 2'b01;
    operation = 2'b00; 
	 
	 
    firstNum = 4'b0100; // 4
    secNum = 4'b0010; // 2


    #10;
    
    // Caso de prueba para la resta
    operation = 2'b00; 
    operation = 2'b01; 
	 
	 
	 
	 firstNum = 4'b0011; // 3
    secNum = 4'b0001; // 1

	 
	 
	 
    #10;
    
    // Segundo caso de prueba para la resta
    operation = 2'b00; 
	 operation = 2'b01;
	 
	 
    firstNum = 4'b0100; // 4
    secNum = 4'b0011; // 3


	 
	 
	 
    #10;
    
    // Caso de prueba para la división
    operation = 2'b00; 
	 operation = 2'b10;
	 
	 
	 
    firstNum = 4'b0100; // 4
    secNum = 4'b0010; // 2 
	 
	 


	 
	 
	 
    #10;
    
    // Segundo caso de prueba para la división
    operation = 2'b00; 
    operation = 2'b10;
    firstNum = 4'b0110; // 6
    secNum = 4'b0010; // 2
	 
	 
	 
	 
    #10;
	 
  end
endmodule