module contador_tb();

    // Definición de los puertos
    reg clk;
    reg rst;
	 
	 generate
		parameter N1 = 2;
		wire [N1-1:0] count1;
		contador #(
			  .N(N1)
		) contador_insta2bits(
			  .clk(clk),
			  .rst(rst),
			  .count(count1)
		);
	 endgenerate
	 
	 generate
	 
		parameter N2 = 4;
		wire [N2-1:0] count2;
		contador #(
				.N(N2)
		) contador_insta4bits(
				.clk(clk),
				.rst(rst),
				.count(count2)
		);
	 
	 endgenerate
    
	 
	 generate

		parameter N3 = 6;
		wire [N3-1:0] count3;
		contador #(
				.N(N3)
		) contador_insta6bits(
				.clk(clk),
				.rst(rst),
				.count(count3)
		);
	 
	 endgenerate

 

    // Generación de señales de reloj
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Inicialización del reset
    initial begin
        rst = 1;
        #10 rst = 0;
    end

    // Simulación de operación
    initial begin

    end
	 


endmodule
