module update_matrix_pc_tb;

    // Parámetros de simulación
    parameter SIM_TIME = 100; // Tiempo de simulación
    
    // Señales de entrada
    reg [3:0] row;
    reg [3:0] col;
    reg hit;
    reg fire;
    
    // Señales de salida
    reg [2:0] matrix_pc [0:4][0:4];
    
    // Instancia del módulo bajo prueba
    update_matrix_pc update_inst (
        .row(row),
        .col(col),
        .hit(hit),
        .fire(fire),
        .matrix_pc(matrix_pc)
    );
    
    // Estímulos
    initial begin
        // Inicializar señales
        row = 1;
        col = 1;
        hit = 1;
        fire = 1;
        // Inicializar matriz_pc con valores conocidos
        for (int i = 0; i < 5; i = i + 1) begin
            for (int j = 0; j < 5; j = j + 1) begin
                matrix_pc[i][j] = 3'b000; // Inicializar todas las celdas con '000'
            end
        end
        // Simular por un tiempo
        #SIM_TIME;
        // Finalizar simulación
        $finish;
    end

endmodule
