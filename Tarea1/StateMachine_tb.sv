module StateMachine_tb;

logic mainButton;
logic[7:0] message;

StateMachine stateMachine(
	.mainButton(mainButton),
	.message(message)
);

initial begin

	mainButton = 1;
	#10;
	mainButton = 0;
	
	#100 ;
	
	mainButton = 1;
	#10;
	mainButton = 0;
	
	#100;
	
	mainButton = 1;
	#10;
	mainButton = 0;
	
	#100;
	
	mainButton = 1;
	#10;
	mainButton = 0;
	
	#100;
	
	mainButton = 1;
	#10;
	mainButton = 0;
	
	#100;
	
	mainButton = 1;
	#10;
	mainButton = 0;
	
	#100;
	
	mainButton = 1;
	#10;
	mainButton = 0;
	
	#5000;
	
	mainButton = 1;
	#10;
	mainButton = 0;
	
	#100;
	
	$finish;
end

endmodule
