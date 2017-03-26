`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:20:50 12/23/2016 
// Design Name: 
// Module Name:    Mux2To1b32 
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
module Mux2To1b32(input [31:0] in1, 
				input [31:0] in2,
				input EN,
				output [31:0] o);
				
	assign o = EN == 1 ? in2 : in1;


endmodule
