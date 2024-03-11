module mainModule (
  input logic decr,// Boton para bajar el numero
  input logic rst,    // Boton para reset
  input reg [5:0] countEntr, // El contador
  output reg [5:0] countSal, // primer siete segmentos
  output reg [6:0] segA, // 7-seg A
  output reg [6:0] segB  // 7-seg B
  
);

  parameter N = 6;

  DCounter #(.N(N)) counter (
    .decr(decr),
    .rst(rst),
    .countEntr(countEntr),
	 .countSal(countSal)
  );

  SieteSeg #(.N(N)) displays (
    .count(countSal),
    .segA(segA),
    .segB(segB)
  );

endmodule