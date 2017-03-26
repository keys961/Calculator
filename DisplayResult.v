`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:04:20 12/22/2016 
// Design Name: 
// Module Name:    DisplayResult 
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
module DisplayResult(clk, start, PData, SEGCLK, SEGCLR, SEGDT, SEGEN);
input wire clk;
input wire start;
input wire [63:0] PData;
output wire SEGCLK; 
output wire SEGCLR;
output reg SEGDT;
output wire SEGEN;

parameter Shift_NUM = 64;

reg [Shift_NUM - 2:0] num_shift;
reg [Shift_NUM - 1:0] counter = 0;
reg [1:0] samp;

wire shift = (samp == 2'b01) ? 1 : 0;
always @ (posedge clk)
	samp <= {samp[0], start};

always @ (posedge clk)
begin
	if(shift)
	begin
		num_shift <= PData[Shift_NUM - 2:0];
		SEGDT <= PData[Shift_NUM - 1];
		counter <= ~counter;
	end
	else
	begin
		num_shift <= {num_shift[Shift_NUM - 3:0], 1'b0};
		SEGDT <= num_shift[Shift_NUM - 2];
		counter <= {1'b0, counter[Shift_NUM - 1:1]};
	end
end

assign SEGCLK = clk & counter[0];
assign SEGCLR = 1;
assign SEGEN = 1'b1;

endmodule
