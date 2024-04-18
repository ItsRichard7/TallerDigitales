module bin2bcd(
    input [2:0] bin,
    output reg [3:0] bcd
);

    always @(bin) begin
        bcd = 0;
        if (bin >= 5) 
            bcd = bcd + 3;
        bcd = {bcd[2:0], bin};
    end

endmodule
