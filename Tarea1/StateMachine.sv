module StateMachine(
    input logic mainButton,
    output logic [7:0] message
);

    // Declare variables
    logic [7:0] maintenance = 8'b0;
    logic [7:0] cycles;
    logic [1:0] state, nextState;
    logic rst, clk, higher, control;
    logic buttonPressed; // Variable para detectar flanco

    // Instantiate clock, counter, comparator, flip flop, and mux modules
    Clock clock(
        .clk(clk)
    );
    
    Counter counter(
        .clk(clk),
        .rst(rst),
        .count(cycles)
    );
    
    Comparator comparator(
        .num(cycles), // Change num to cycles
        .higher(higher)
    );
    
    FlipFlop flipflop(
        .rst(rst),
        .clk(clk),
        .state(state),
        .nextState(nextState)
    );
    
    Mux mx(
        .firstMessage(maintenance),
        .secondMessage(8'b11111111),
        .control(control),
        .message(message)
    );
    
    // Next State Logic
    always_comb begin
        case(state)
            2'b00: nextState = buttonPressed ? 2'b01 : 2'b10; // Detectar flanco
            2'b01: nextState = 2'b00;
            2'b10: nextState = higher ? 2'b11 : 2'b00;
            2'b11: nextState = 2'b00;
            default: nextState = 2'b00;
        endcase
    end

    // Internal Variables Logic
    always_ff @(posedge clk) begin
        buttonPressed <= mainButton && !state[0]; // Detectar flanco
        if (state == 2'b01)
            maintenance <= maintenance + 1;
        else
            maintenance <= maintenance;
            
        rst <= (state == 2'b01 || state == 2'b11);
        control <= (state == 2'b11);
    end

endmodule

