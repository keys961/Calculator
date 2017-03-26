`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:23:15 01/04/2017
// Design Name:   Calculate
// Module Name:   C:/Users/hp/Desktop/FinalProjectSimp/Testcore.v
// Project Name:  FinalProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Calculate
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Testcore;

	// Inputs
	reg [1:0] switches;
	reg [31:0] operand1;
	reg [31:0] operand2;

	// Outputs
	wire [31:0] result;
	wire [31:0] mod;
	wire negative;
	wire overflow;
	wire error;

	// Instantiate the Unit Under Test (UUT)
	Calculate uut (
		.switches(switches), 
		.operand1(operand1), 
		.operand2(operand2), 
		.result(result), 
		.mod(mod), 
		.negative(negative), 
		.overflow(overflow), 
		.error(error)
	);

	initial begin
		
		switches = 2'b00;//addition normal
      operand1 = 32'h00001949;
		operand2 =32'h00002818 ; 
		#50; 
		switches = 2'b00;//addition overflow
		operand1 = 32'h00009889;
		operand2 =32'h00008997 ;
		#50;
		switches = 1;//subtraction normal
		operand1 = 32'h00009123;
		operand2 =32'h00008456 ;
		#50;
		switches = 1;//subtraction negative
		operand1 = 32'h00001237;
		operand2 =32'h00002130 ;
		#50;
		switches = 2;//multiplication normal
		operand1 = 32'h0000137;
		operand2 =32'h00000053;
		#50;
		switches = 2;//multiplication overflow
		operand1 = 32'h0000137;
		operand2 =32'h00002553;
		#50;
		switches = 3;//division normal
		operand1 = 32'h00002556;
		operand2 =32'h00000023 ;
		#50;
		switches = 3;//division normal
		operand1 = 32'h00002367;
		operand2 =32'h00003475 ;
		#50;
      switches = 3;//division error
		operand1 = 32'h00001425;
		operand2 =32'h00000000 ;
		#50;

	end
      
endmodule

