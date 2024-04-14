module ContadorParametrizable #(
    parameter N = 4 // Número de bits del contador
)(
    input logic clk, // Reloj
    input logic rst, // Reset
    input logic [N-1:0] number, // Número hasta el que contar
    output logic done, // Señal cuando se ha alcanzado el número indicado
    output logic [N-1:0] counter // Contador
);
// Definir el contador interno
logic [N-1:0] internal_count;
always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        internal_count <= 0;
        done <= 0;
    end else if (internal_count == number) begin
        done <= 1;
    end else begin
        if (!done)
            internal_count <= internal_count + 1;
    end
end

assign counter = internal_count;

endmodule
