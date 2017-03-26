`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:55:22 12/22/2016 
// Design Name: 
// Module Name:    OperandSelector 
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
module OperandSelector(numA, numB, numRAM, RD, SW, operandA, operandB);
input wire [31:0] numA;
input wire [31:0] numB;
input wire [31:0] numRAM;
input wire RD;
input wire SW;
output wire [31:0] operandA;
output wire [31:0] operandB;

assign operandA = RD == 1 && SW == 0 ? numRAM : numA;
assign operandB = RD == 1 && SW == 1 ? numRAM : numB;

endmodule
