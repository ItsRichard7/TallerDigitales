module DCounter
#(parameter N=6)
(
  input logic decr,// Boton para bajar el numero
  input logic rst,    // Boton de reset
  input reg [N-1:0] countEntr, // El contador
  output reg [N-1:0] countSal // primer siete segmentos
);

//reg clk_internal = 1'b0; // Señal de reloj interno

//always #(50) clk_internal = ~clk_internal; // Generador de reloj interno (ciclo de 1 segundo)

//always @(posedge clk_internal or posedge rst or posedge ~decr) begin
always @(negedge rst or negedge decr) begin
	 
    if (~rst) begin
        countSal <= countEntr;
    end
    else if (~decr) begin
        countSal <= countSal - 1;
	 end
end

endmodule