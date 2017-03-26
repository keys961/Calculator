`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:17:30 12/22/2016 
// Design Name: 
// Module Name:    Top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
// TOP module
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Top(clk, SW, SWRam, Clear, Load, Segment, AN, Buzzer, LED, LEDBelow, Overflow);
input wire clk;
input wire [8:0] SW; //8 and 7: +-*/ 6:R/W 5:4:Result/Mod/Operand 3-0:GenerateNum
input wire [2:0] SWRam; //Ram address
input wire Clear; //Left button
input wire Load; //Right button
output wire [7:0] Segment;
output wire [3:0] AN;
output wire Buzzer; //To show error
output wire [7:0] LED; //Show which address of RAM is occupied
output wire LEDBelow; //Show negative
output wire Overflow; //Show overflow
//output wire SEGCLK, SEGCLR, SEGDT, SEGEN;

wire [31:0] numA; //OperandA
wire [31:0] numB; //OperandB
wire [31:0] dataOut; //Data output from SRAM

wire [31:0] result;
wire [31:0] mod;
wire negative;
wire error;
wire overflow;

wire [31:0] dispOperand;
//wire [63:0] PData;

//wire [31:0] clk_div;

//clkdiv x(clk, 1'b0, clk_div);

//--R/W Module, should be modified--//
SRAM g(clk, SW[6], ~Load, ~Clear, SWRam, dispOperand, dataOut, LED);

//--Generate number with loading function--//
NumberGenerator c1(clk, {~Load, SW[6:0]}, dataOut, numA);//Generate numA 
NumberGenerator c2(clk, {~Load, SW[6:5], ~SW[4],SW[3:0]}, dataOut, numB); //Generate numB


//--Calculate--//
Calculate c(SW[8:7], numA, numB, result, mod, negative, overflow, error); 

//---Display Operand and Results---//
assign dispOperand = (SW[5:4] == 2'b00 ) ? numA : (SW[5:4] == 2'b01 ? numB : (SW[5:4] == 2'b10) ? result : mod);
DispNum da(clk , dispOperand[15:0], 4'b0, 4'b0, 1'b0, AN, Segment);

assign Buzzer = ~error;
assign LEDBelow = ~negative;
assign Overflow = ~overflow;

endmodule
