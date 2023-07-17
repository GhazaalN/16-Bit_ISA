`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:27:06 07/08/2023 
// Design Name: 
// Module Name:    ControlUnit 
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
module ControlUnit (
    input [2:0] Opcode,
	 output Alu_Src,
	 output Branch,
    output Mem_Write,
    output Reg_Write,
    output Jump,
    output Mem_To_Reg,
	 output Reg_Dst   //selector ke be kodoom reg benvise
);

reg [6:0] Temp;
assign Alu_Src = Temp[0];
assign Branch = Temp[1];
assign Mem_Write = Temp[2];
assign Reg_Write = Temp[3];
assign Jump = Temp[4];
assign Mem_To_Reg = Temp[5];
assign Reg_Dst = Temp[6];
always @(*) begin
    case (Opcode)
        // Add
        3'b000: begin
		      Temp[0] = 0;
				Temp[1] = 0;
            Temp[2] = 0;
				Temp[3] = 1;
				Temp[4] = 0;
				Temp[5] = 0;   
				Temp[6] = 1;
        end
        
        // Add Immediate
        3'b001: begin
            Temp[0] = 1;
				Temp[1] = 0;
            Temp[2] = 0;
				Temp[3] = 1;
				Temp[4] = 0;
				Temp[5] = 0;   
				Temp[6] = 1;
        end
		  // Shifting 
        3'b010: begin 
            Temp[0] = 0;
				Temp[1] = 0;
            Temp[2] = 0;
				Temp[3] = 1;
				Temp[4] = 0;
				Temp[5] = 0;   
				Temp[6] = 1;
        end
		  // Rotate
		  3'b011: begin 
            Temp[0] = 0;
				Temp[1] = 0;
            Temp[2] = 0;
				Temp[3] = 1;
				Temp[4] = 0;
				Temp[5] = 0;   
				Temp[6] = 1;
			end
		  // Branch If Equal
        3'b100: begin 
				Temp[0] = 1;
				Temp[1] = 1;
            Temp[2] = 0;
				Temp[3] = 0;
				Temp[4] = 0;
				Temp[5] = 0;   
				Temp[6] = 0;
        end

        // Store Word
        3'b101: begin 
            Temp[0] = 1;
				Temp[1] = 0;
            Temp[2] = 1;
				Temp[3] = 0;
				Temp[4] = 0;
				Temp[5] = 0;   
				Temp[6] = 0;
        end

        // Load Word
        3'b110: begin 
            Temp[0] = 1;
				Temp[1] = 0;
            Temp[2] = 0;
				Temp[3] = 1;
				Temp[4] = 0;
				Temp[5] = 1;   
				Temp[6] = 1;
        end

        // Jump
        3'b111: begin 
            Temp[0] = 0;
				Temp[1] = 0;
            Temp[2] = 0;
				Temp[3] = 0;
				Temp[4] = 1;
				Temp[5] = 0;   
				Temp[6] = 0;
        end

        
		  // Default Operation (noop)
        default: begin 
				Temp[0] = 0;
				Temp[1] = 0;
            Temp[2] = 0;
				Temp[3] = 0;
				Temp[4] = 0;
				Temp[5] = 0;   
				Temp[6] = 0;
        end
    endcase
end

endmodule

