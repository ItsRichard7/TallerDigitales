module NCounter #(
    parameter N = 4 // Counter of N bits 
)(
    input logic clk, rst, 
    input logic [N-1:0] number, // Counter Limit Number
    output logic done, // Flag when the count is over
);

logic [N-1:0] internal_count; // Define the internal counter

always_ff @(posedge clk or posedge rst) begin
    if (rst) begin // 
        internal_count <= 0;
        done <= 0;
    end else if (internal_count == number) begin
        done <= 1;
    end else begin
        if (!done)
            internal_count <= internal_count + 1;
    end
end

endmodule
