`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:07:08 12/22/2016 
// Design Name: 
// Module Name:    SRAM 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
// Static RAM with R AND W and CLEAR
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module SRAM(clk, RD, Load, Clear, Address, dataIn, dataOut, led);
input wire clk;
input wire RD;
//input wire WR; //WR = ~RD same in OperandSelector
//input wire SW; //Same as DisplayResult
input wire Load;
input wire Clear;
input wire [2:0] Address;
input wire [31:0] dataIn;
output reg [31:0] dataOut;
output reg [7:0] led;

reg [31:0] Sram [0:7]; //SRAM

integer i;

initial begin
	led <= 8'b11111111;
	dataOut <= 8'b00000000;
	for(i = 0; i <= 7; i = i + 1)
		Sram[i] <= 32'h00000000;
end

//reg Load_D;
//reg Clear_D;

always
begin
	//Load_D <= Load;
	//Clear_D <= Clear;
	
	if(RD == 1'b0 && Clear == 1'b0) //Write Data
	begin
		if(Load == 1'b1) //When load is pressed
		begin
			Sram[Address] <= dataIn;
			led[Address] <= 0;
		end
	end
	else if(RD == 1'b1 && Clear == 1'b0) //Read Data
	begin
			dataOut <= Sram[Address];
	end
	else if(Clear == 1'b1) //Clear Data
	begin
		Sram[Address] <= 0;
		led[Address] <= 1;
	end
	else 
	begin //Keep the same data
		Sram[Address] <= Sram[Address];
		led[Address] <= led[Address];
	end;
end

endmodule
