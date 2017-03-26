`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:05:04 01/04/2017
// Design Name:   NumberGenerator
// Module Name:   C:/Users/hp/Desktop/FinalProject2/number.v
// Project Name:  FinalProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: NumberGenerator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module number;

	// Inputs
	reg clk;
	reg [7:0] SW;
	reg [31:0] numRam;

	// Outputs
	wire [31:0] num;

	// Instantiate the Unit Under Test (UUT)
	NumberGenerator uut (
		.clk(clk), 
		.SW(SW), 
		.numRam(numRam), 
		.num(num)
	);

	initial begin
		numRam = 0;
	end
	initial forever begin
	SW=1;#100;
	SW=0;#100;
	end
	initial forever begin 
	 clk=0;#50;
	 clk=1;#50;
	end
      
endmodule

