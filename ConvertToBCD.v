`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:55:15 12/10/2016 
// Design Name: 
// Module Name:    ConvertToBCD 
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
module ConvertToBCD(sourceNum, result); //Convert binary code to BCD code
input wire [31:0] sourceNum;
output reg [31:0] result;

parameter B_SIZE = 32;

reg [31:0] tempNum;
reg [31:0] tempRes;

always @ *
begin
	tempNum = sourceNum;
	tempRes = 0;
	repeat(B_SIZE - 1)
	begin
		tempRes[0] = tempNum[B_SIZE - 1];
		if(tempRes[3:0] > 4)
			tempRes[3:0] = tempRes[3:0] + 3;
		if(tempRes[7:4] > 4)
			tempRes[7:4] = tempRes[7:4] + 3;
		if(tempRes[11:8] > 4)
			tempRes[11:8] = tempRes[11:8] + 3;
		if(tempRes[15:12] > 4)
			tempRes[15:12] = tempRes[15:12] + 3;
		if(tempRes[19:16] > 4)
			tempRes[19:16] = tempRes[19:16] + 3;
		if(tempRes[23:20] > 4)
			tempRes[23:20] = tempRes[23:20] + 3;
		if(tempRes[27:24] > 4)
			tempRes[27:24] = tempRes[27:24] + 3;
		if(tempRes[31:28] > 4)
			tempRes[31:28] = tempRes[31:28] + 3;
		tempRes = tempRes << 1;
		tempNum = tempNum << 1;
	end
	tempRes[0] = tempNum[B_SIZE - 1];
	
	result <= tempRes;
end

endmodule
