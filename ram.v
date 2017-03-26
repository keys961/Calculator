`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:01:20 01/04/2017
// Design Name:   SRAM
// Module Name:   C:/Users/hp/Desktop/FinalProject2/ram.v
// Project Name:  FinalProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SRAM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ram;

	// Inputs
	reg clk;
	reg RD;
	reg Load;
	reg Clear;
	reg [2:0] Address;
	reg [31:0] dataIn;

	// Outputs
	wire [31:0] dataOut;
	wire [7:0] led;

	// Instantiate the Unit Under Test (UUT)
	SRAM uut (
		.clk(clk), 
		.RD(RD), 
		.Load(Load), 
		.Clear(Clear), 
		.Address(Address), 
		.dataIn(dataIn), 
		.dataOut(dataOut), 
		.led(led)
	);
    integer i;
	initial begin
		// Initialize Inputs
		for (i=0;i<8;i=i+1)//load initial state for all latches
		begin
		RD = 0;
		Load = 1;
		Clear = 0;
		Address = i;
		dataIn = 2*i;
      #100;
		end
		for (i=0;i<8;i=i+1)//read all the latches one by one
		begin
		RD = 1;
		Load = 0;
		Clear = 0;
		Address = i;
		dataIn = 0;
      #100;
		end
		for (i=0;i<8;i=i+1)//clear all the latches one by one
		begin
		RD = 0;
		Load = 0;
		Clear = 1;
		Address = i;
		dataIn = 0;
      #100;
		end
		
        
		

	end
	initial forever begin
	clk=0;#50;
	clk=1;#50;
	end
      
endmodule

