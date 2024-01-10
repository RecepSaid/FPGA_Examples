`timescale 1ns / 1ps

module tb_tug_of_war();
reg LPB;
reg RPB;
reg CLK;
reg RESET;
wire DONE;
wire [6:0] LEDS;

tug_of_war inst0(.LPB(LPB), .RPB(RPB), .CLK(CLK), .RESET(RESET), .DONE(DONE), .LEDS(LEDS));

initial begin
	CLK = 1'b0;
	RESET = 1'b1;
	#5
	RESET = 1'b0;
end

always begin
	#1
	CLK = ~CLK;
end

endmodule 
