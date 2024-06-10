`timescale 10ns/1ns
module testbenchVGA;
	

    parameter HRES = 640;
    parameter VRES = 480;

    logic clk = 0;
    logic rst = 0;

    logic vgaclk;
    logic hsync;
    logic vsync;
    logic sync_b; 
    logic blank_b;
    logic [7:0] red;
    logic [7:0] green;
    logic [7:0] blue;
	 
    vga pruebaVGA(
        .clk(clk),
		  .rst(rst),
        .vgaclk(vgaclk),
        .hsync(hsync),
        .vsync(vsync),
        .sync_b(sync_b),
        .blank_b(blank_b),
        .r(red),
        .g(green),
        .b(blue)
    );

    always #5 clk = ~clk;

    initial begin
	 
        rst = 0;
        #10;

        $finish;
    end

endmodule