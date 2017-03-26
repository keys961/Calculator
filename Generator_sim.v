`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:27:09 12/23/2016
// Design Name:   NumberGenerator
// Module Name:   Z:/FinalProject/Generator_sim.v
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

module Generator_sim;

	// Inputs
	reg [4:0] SW;

	// Outputs
	wire [31:0] numA;
	wire [31:0] numB;

	// Instantiate the Unit Under Test (UUT)
	NumberGenerator uut (
		.SW(SW), 
		.numA(numA), 
		.numB(numB)
	);

	initial begin
		// Initialize Inputs
		SW = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		SW[4] = 0;
		SW[1] = 1; #50;
		SW[1] = 0; #50;
		SW[2] = 1; #50;
		SW[2] = 0; #50;
	end
      
endmodule

