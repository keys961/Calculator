`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:02 12/22/2016 
// Design Name: 
// Module Name:    AntiJitter 
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
module AntiJitter(clk, K_ROW, K_COL, rowOut, colOut);
input wire clk;
input wire [4:0] K_ROW;
input wire [3:0] K_COL;
output reg [4:0] rowOut;
output reg [3:0] colOut;

reg [31:0] count = 0;

always @ (posedge clk)
begin
	if(count < 100000)
		count <= count + 1;
	else
	begin
		rowOut <= K_ROW;
		colOut <= K_COL;
		count <= 0;
	end
end

endmodule
