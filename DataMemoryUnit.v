`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:31:54 07/08/2023 
// Design Name: 
// Module Name:    DataMemoryUnit 
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
module DataMemoryUnit(
	input [15:0] Address,
	input [15:0] Write_Data,
	input Clk,
	input MemWrite,
	output [15:0] Read_Data
    );
	 
reg [15:0] Memory [200:0];
reg [15:0] Temp;
assign Read_Data = Temp;
integer i;
initial begin
		for (i = 0;i < 201; i = i + 1)
			Memory[i] = 0;
			
		Memory[0] = 3; Memory[1] = 4;
		Memory[2] = 1; Memory[3] = 2;
end
	 
always @(posedge Clk)begin
	if(MemWrite) Memory[Address] = Write_Data;
	else Temp = Memory[Address];//read data 
end
endmodule
