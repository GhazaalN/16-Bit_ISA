`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:36:14 07/08/2023 
// Design Name: 
// Module Name:    RegisterFile 
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
module RegisterFile(
	input [3:0] Read_Register1,
   input [3:0] Read_Register2,
   input [3:0] Write_Reg,
   input [15:0] Write_Data,
	input Clk,
   input RegWrite,
	output reg [15:0] Read_Data1,
	output reg [15:0] Read_Data2
    );

reg [15:0] Registers [15:0];

initial begin 
 Registers[0] = 16'h0000; ///alwas 0!
 Registers[1] = 16'h1000;
 Registers[2] = 16'h0000;
 Registers[3] = 16'h0000;
 Registers[4] = 16'h0000;
 Registers[5] = 16'h0000;
 Registers[6] = 16'h0000;
 Registers[7] = 16'h0000;
 Registers[8] = 16'h0000;
 Registers[9] = 16'h0000;
 Registers[10] = 16'h0000;
 Registers[11] = 16'h0000;
 Registers[12] = 16'h0000;
 Registers[13] = 16'h0000;
 Registers[14] = 16'h0000;
 Registers[15] = 16'h0000;
end

always @(negedge Clk) begin
    if (RegWrite) 
	 Registers[Write_Reg] <= Write_Data; 
end


always @(posedge Clk) begin
    Read_Data1 = Registers[Read_Register1];
	 Read_Data2 = Registers[Read_Register2];
end

endmodule
