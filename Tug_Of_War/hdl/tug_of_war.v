module tug_of_war(LPB, RPB, CLK, RESET, LEDS, DONE);
	input 		 LPB;
	input 		 RPB;
	input 		 CLK;
	input 		 RESET;
	output reg   DONE;
	output [8:0] LEDS;
	
	reg [8:0] position;
	reg left;
	reg right;
	wire L, R;
	
	// Capture rising edge when push the button
	assign L = ~left && LPB;
	assign R = ~right && RPB;
	
	assign LEDS = position;
	
	always @ (posedge CLK) begin
		left <= LPB;
		right <= RPB;
		
		if(RESET) begin
			position <= 7'b000010000;
			DONE <= 1'b0;
		end
		else if(L)
			position <= position << 1;
		else if(R)
			position <= position >> 1;
		else if((position == 9'b100000000) || (position == 9'b000000001)) begin
			position <= 9'b0;
			DONE <= 1'b1;
		end
	end
endmodule
