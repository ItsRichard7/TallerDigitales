module contador #(
    parameter N = 6  
)(
    input wire clk,    
    input wire rst,    
    output reg [N-1:0] count  
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= {N{1'b0}}; 
    end else begin
        count <= count + 1;  
		  #100000;
    end
end

endmodule