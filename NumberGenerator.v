`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:00:57 12/22/2016 
// Design Name: 
// Module Name:    NumberGenerator 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
// Generate Numbers
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module NumberGenerator(clk, SW, numRam, num);
input wire clk;
input wire [7:0] SW; //5:RD SIGNAL 6: Load signal
input wire [31:0] numRam;
output reg [31:0] num;

wire [3:0] numplus1;
wire [3:0] numplus10;
wire [3:0] numplus100;
wire [3:0] numplus1000;
wire EN;

//reg [31:0] numTemp;
//reg [31:0] numTemp1;
//reg [31:0] numTemp2;

reg [3:0] SW_D; //delay signal
reg EN_D;

initial
begin
	num <= 32'h1;
end

assign EN = ~SW[5] & ~SW[4] & SW[7] & SW[6]; //4:5 CONTROL 6:R/W 7:LOAD
//If it shows operands and Read is OPEN and Load is pressed, load the data

assign numplus1 = SW[4] == 0 ? num[3:0] + 1 : num[3:0]; //Add 1
assign numplus10 = SW[4] == 0 ? num[7:4] + 1 : num[7:4]; //Add 10
assign numplus100 = SW[4] == 0 ? num[11:8] + 1 : num[11:8]; //Add 100
assign numplus1000 = SW[4] == 0 ? num[15:12] + 1 : num[15:12]; //Add 1000

/*			
always @ (posedge SW[0]) num[3:0] <= numplus1;
always @ (posedge SW[1]) num[7:4] <= numplus10;
always @ (posedge SW[2]) num[11:8] <= numplus100;
always @ (posedge SW[3]) num[15:12] <= numplus1000;
//always @ (posedge EN) numTemp2 <= numRam;
*/

always @ (posedge clk)
begin 
	SW_D[0] <= SW[0]; //To construct posedge of SW
	SW_D[1] <= SW[1];
	SW_D[2] <= SW[2];
	SW_D[3] <= SW[3];
	EN_D <= EN;
	
	if(SW_D[0] == 1'b0 && SW[0] == 1'b1) //posedge SW[0]
		num[3:0] <= numplus1;
	else if(SW_D[1] == 1'b0 && SW[1] == 1'b1) //posedge SW[1]
		num[7:4] <= numplus10;
	else if(SW_D[2] == 1'b0 && SW[2] == 1'b1) //posedge SW[2]
		num[11:8] <= numplus100; 
	else if(SW_D[3] == 1'b0 && SW[3] == 1'b1) //posedge SW[3]
		num[15:12] <= numplus1000;
	else if(EN == 1'b1 && EN_D == 1'b0) //Load the data from sram
		num <= numRam;
end

endmodule
