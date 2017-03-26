`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:18:43 12/22/2016
// Design Name:   GetAddress
// Module Name:   Z:/FinalProject/GetAddress_sim.v
// Project Name:  FinalProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: GetAddress
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module GetAddress_sim;

	// Inputs
	reg [4:0] rowOut;
	reg [3:0] colOut;

	// Outputs
	wire [3:0] address;

	// Instantiate the Unit Under Test (UUT)
	GetAddress uut (
		.rowOut(rowOut), 
		.colOut(colOut), 
		.address(address)
	);

	initial begin
		// Initialize Inputs
		rowOut = 0;
		colOut = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#50 rowOut = 5'b00010;
			colOut = 4'b1101;
		#50 colOut = 4'b1001;
	end
      
endmodule

