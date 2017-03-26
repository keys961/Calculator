`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:37:29 12/23/2016 
// Design Name: 
// Module Name:    Hex2Seg 
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
module Hex2Seg(Hex, LE, point, flash, Segment);
input [3:0] Hex;
input LE;
input point;
input flash;
output [7:0] Segment;

wire EN = LE & flash;
MyMC14495 MSEG (Hex[0], Hex[1], Hex[2], Hex[3], EN, point, 
				a, b, c, d, e, f, g, p);

assign Segment = {p, g, f, e, d, c, b, a};


endmodule
