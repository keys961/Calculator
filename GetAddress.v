`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:22:52 12/22/2016 
// Design Name: 
// Module Name:    GetAddress 
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
module GetAddress(SWRam, address);
input wire [2:0] SWRam;

output reg [2:0] address;

always 
begin
	if(rowOut == 5'b00010)
	begin
		case(colOut)
			4'b1110: address <= 4'b0000;
			4'b1101: address <= 4'b0001;
			4'b1011: address <= 4'b0010;
			4'b0111: address <= 4'b0011;
			default: address <= 4'b1000;
		endcase
	end
	else if(rowOut == 5'b00100)
	begin
	case(colOut)
			4'b1110: address <= 4'b0100;
			4'b1101: address <= 4'b0101;
			4'b1011: address <= 4'b0110;
			4'b0111: address <= 4'b0111;
			default: address <= 4'b1000;
		endcase
	end
	else
		address <= 4'b1000;
end

endmodule
