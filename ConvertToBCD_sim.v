`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:21:09 12/22/2016
// Design Name:   ConvertToBCD
// Module Name:   Z:/FinalProject/ConvertToBCD_sim.v
// Project Name:  FinalProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ConvertToBCD
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ConvertToBCD_sim;

	// Inputs
	reg [31:0] sourceNum;

	// Outputs
	wire [31:0] result;

	// Instantiate the Unit Under Test (UUT)
	ConvertToBCD uut (
		.sourceNum(sourceNum), 
		.result(result)
	);

	initial begin
		// Initialize Inputs
		sourceNum = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#50
		sourceNum = 1234;

	end
      
endmodule

