module controls_tb;

    // Parámetros
    parameter TIME_PERIOD = 40;

    // Señales de entrada
    logic direction;
    logic move_h;
    logic move_v;
    logic [2:0] matrix_pc [0:4][0:4];

    // Señales de salida
    logic [4:0] row;
    logic [4:0] col;

    // Instancia del módulo de control
    controls dut(
        .direction(direction),
        .move_h(move_h),
        .move_v(move_v),
        .matrix_pc(matrix_pc),
        .row(row),
        .col(col)
    );

    // Inicialización
    initial begin
        direction = 1'b0;
        move_h = 1'b0;
        move_v = 1'b0;
        
        // Inicializar matriz
        matrix_pc = '{'{3'b000, 3'b000, 3'b000, 3'b000, 3'b000}, '{3'b000, 3'b001, 3'b000, 3'b000, 3'b000}, '{3'b000, 3'b000, 3'b000, 3'b000, 3'b000}, '{3'b000, 3'b000, 3'b000, 3'b000, 3'b000}, '{3'b000, 3'b000, 3'b000, 3'b000, 3'b000}};
        
        // Esperar un tiempo para que se resuelva la salida
        #TIME_PERIOD;

        // Verificar salida
        $display("Initial row: %b, col: %b", row, col);
        
        // Cambiar valores de entrada para probar diferentes casos
        direction = 1'b0;
        move_h = 1'b0;
        move_v = 1'b0;

        // Esperar un tiempo para que se resuelva la salida
        #TIME_PERIOD;

        // Verificar salida
        $display("After direction = 1, move_h = 0: row: %b, col: %b", row, col);
        
        // Cambiar valores de entrada para probar diferentes casos
        direction = 1'b0;
        move_h = 1'b0;
        move_v = 1'b1;

        // Esperar un tiempo para que se resuelva la salida
        #TIME_PERIOD;

        // Verificar salida
        $display("After direction = 0, move_v = 1: row: %b, col: %b", row, col);

        // Cambiar valores de entrada para probar diferentes casos
        direction = 1'b0;
        move_h = 1'b1;
        move_v = 1'b0;

        // Esperar un tiempo para que se resuelva la salida
        #TIME_PERIOD;

        // Verificar salida
        $display("After direction = 0, move_h = 1: row: %b, col: %b", row, col);
        
        // Cambiar valores de entrada para probar diferentes casos
        direction = 1'b1;
        move_h = 1'b0;
        move_v = 1'b1;

        // Esperar un tiempo para que se resuelva la salida
        #TIME_PERIOD;

        // Verificar salida
        $display("After direction = 1, move_v = 1: row: %b, col: %b", row, col);
		  
		  direction = 1'b0;
        move_h = 1'b0;
        move_v = 1'b0;
		  
		  $display("After direction = 0, move_v = 0: row: %b, col: %b", row, col);

    end

endmodule

