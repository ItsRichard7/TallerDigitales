module randomNumGenerator (
    input wire clk,    
    input wire reset, 
    input wire [2:0] seed, 
    output reg [2:0] ranNum 
);

    reg [7:0] lfsr; // Register for LFSR

    // Initial seed value for LFSR
    initial begin
        lfsr = seed;
    end

    always @(posedge clk or negedge reset) begin
        if (~reset) begin
            lfsr <= seed;
        end else begin
            lfsr <= {lfsr[6:0], lfsr[5] ^ lfsr[3] ^ lfsr[2] ^ lfsr[0]}; 
        end
    end

    always @(posedge clk) begin
        ranNum <= lfsr % 5; // Limitar el rango de valores generados a entre 0 y 4
    end

endmodule