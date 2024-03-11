module Dcounter_tb();

    // Definición de los puertos
    logic decr;
    logic rst;    
    reg [1:0] countEntr1; 
    reg [1:0] countSal1; 
	 reg [3:0] countEntr2;
    reg [3:0] countSal2; 
	 reg [5:0] countEntr3; 
    reg [5:0] countSal3; 

    // Instanciación de contador para cada tamaño de contador
    DCounter #(
        .N(2)
    ) contador_insta2bits (
        .rst(rst),
        .decr(decr),
        .countEntr(countEntr1),
		  .countSal(countSal1)
    );

    DCounter #(
        .N(4)
    ) contador_insta4bits (
        .rst(rst),
        .decr(decr),
        .countEntr(countEntr2),
		  .countSal(countSal2)
    );

    DCounter #(
        .N(6)
    ) contador_insta6bits (
        .rst(rst),
        .decr(decr),
        .countEntr(countEntr3),
		  .countSal(countSal3)
    );


    // Inicialización del reset
    initial begin
		  countEntr1 = 2'b0;
		  countEntr2 = 4'b0;
		  countEntr3 = 6'b0;
        rst = 0;
		  #40;
		  rst = 1;
		  decr = 1;
		  #40;
		  decr = 0;
		  #40;
		  decr = 1;
		  #40;
		  decr = 0;
		  #40;
		  decr = 1;
		  #40;
		  decr = 0;
		  #40;
		  decr = 1;
		  #40;
		  decr = 0;
		  #40;
		  decr = 1;
		  #40;
		  decr = 0;
		  #40;
		  decr = 1;
		  #40;
		  rst = 0;
		  #40;
		  $finish;
    end
endmodule