`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:36:48 07/08/2023 
// Design Name: 
// Module Name:    ShiftLeft1 
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
module ShiftLeft1(
    input [4:0] Immediate,
    output reg [15:0] Result
);


always @(*) begin
    Result = { { 11{Immediate[4]} }, Immediate } << 1;
end

endmodule
