`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:24:13 12/09/2016 
// Design Name: 
// Module Name:    Calculate 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
// Do the calculation
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Calculate(switches, operand1, operand2, result, mod, negative, overflow, error);
input [1:0] switches; //Determine operation
input wire [31:0] operand1;
input wire [31:0] operand2;
output reg [31:0] result;
output reg [31:0] mod;
output reg negative; //Negative signal
output reg error; //Error signal
output reg overflow; //Overflow signal

integer res, i; //Just for 3 signals judgements

reg[63:0] temp_1; //For the division
reg[63:0] temp_2;

always @ (switches or operand1 or operand2)
begin
	case(switches)
		2'b00: //ADD
			begin
				res = operand1 + operand2;
				negative <= 0;
				error <= 0;
				mod <= 0;
				result <= operand1 + operand2;
				if(res > 32'h0000ffff)	overflow <= 1; //Overflow
				else overflow <= 0;
			end
		
		2'b01: //SUB
			begin
				if(operand1 >= operand2)
				begin
					result <= operand1 - operand2;
					negative <= 0;
				end
				else
				begin //if negative
					result <= operand2 - operand1;
					negative <= 1;
				end
				error <= 0;
				mod <= 0;
				overflow <= 0;
			end
		
		2'b10: //MULTI
			begin
				res = operand1 * operand2;
				negative <= 0;
				error <= 0;
				mod <= 0;
				result <= operand1 * operand2;
				if(res > 32'h0000ffff)	overflow <= 1; //Overflow
				else overflow <= 0;
			end
		
		2'b11: //DIV
			begin
				if(operand2 == 0) //Error case
				begin 
					error <= 1;
					result <= 0;
					mod <= 0;		
				end
				else
				begin //Need change			
					//result <= operand1 / operand2;
					//mod <= operand1 % operand2;
					temp_1 = {32'h00000000, operand1};
					temp_2 = {operand2, 32'h00000000};
					for(i = 0; i < 32; i = i + 1)
					begin
						temp_1 = {temp_1[62:0], 1'b0}; //Left shift for 32 times
						if(temp_1[63:32] >= operand2)
							temp_1 = temp_1 - temp_2 + 1'b1;
						else
							temp_1 = temp_1;
					end
					result <= temp_1[31:0]; //result is stored in 31:0
					mod <= temp_1[63:32]; //mod is stored in 63:32
					error <= 0;
				end
				overflow <= 0;
				negative <= 0;
			end
	endcase	
end


endmodule
