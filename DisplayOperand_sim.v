`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:16:23 12/22/2016
// Design Name:   DisplayOperand
// Module Name:   Z:/FinalProject/DisplayOperand_sim.v
// Project Name:  FinalProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DisplayOperand
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DisplayOperand_sim;

	// Inputs
	reg clk;
	reg [31:0] operandA;
	reg [31:0] operandB;
	reg SW;

	// Outputs
	wire [3:0] AN;
	wire [7:0] Segment;

	// Instantiate the Unit Under Test (UUT)
	DisplayOperand uut (
		.clk(clk), 
		.operandA(operandA), 
		.operandB(operandB), 
		.SW(SW), 
		.AN(AN), 
		.Segment(Segment)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		operandA = 0;
		operandB = 0;
		SW = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		operandA = 32'h00009876; #50;
		
		forever begin
			clk = 1; #2;
			clk = 0; #2;
		end
	end
	
      
endmodule

