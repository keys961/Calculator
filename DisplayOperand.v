`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:45:34 12/22/2016 
// Design Name: 
// Module Name:    DisplayOperand 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module DisplayOperand(
		input clk,
    input [31:0] operandA,
    input [31:0] operandB,
    input SW,
    output [3:0] AN,
    output [7:0] Segment
    );
	 
	 wire [31:0] dispNum;
	
	assign dispNum = (SW == 0) ? operandA : operandB;
	
	DispNum m1(clk, dispNum[15:0], 4'b0, 4'b0, 1'b0, AN, Segment);
	
		

endmodule
