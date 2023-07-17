`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:37:52 07/08/2023 
// Design Name: 
// Module Name:    SignExtend 
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
module SignExtend(
	input [4:0] Immediate,
   output reg [15:0] Extended
);

always @* begin
	if (Immediate[4] == 1) begin
        Extended = {{11{1'b1}}, Immediate};
   end else begin
        Extended = {{11{1'b0}}, Immediate};
    end
end

endmodule
