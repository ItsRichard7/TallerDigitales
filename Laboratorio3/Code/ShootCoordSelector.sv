module ShootCoordSelector (
    input logic rst, incButton,
    output logic [2:0] shootCoord
);

    logic [2:0] shootCoordTMP;

    always_ff @(posedge incButton or posedge rst) begin
        if (rst) begin shootCoordTMP <= 3'b001;
        end else if (incButton && shootCoordTMP < 3'b101) begin shootCoordTMP <= shootCoordTMP + 1; 
        end else shootCoordTMP <= 3'b001;
    end

    assign shootCoord = shootCoordTMP;

endmodule