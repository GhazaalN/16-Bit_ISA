`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:25:53 07/08/2023 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
	input [15:0] Operand1,
	input [15:0] Operand2,
	input [2:0] Alu_Opcode,
	input Shift,
   output [15:0] Result,
	output Zero_Out
	);

reg IsZero;
reg [15:0] Temp;

assign Zero_Out = IsZero;
assign Result = Temp;

   always @(*) begin
      case(Alu_Opcode)
		
			// Add
         3'b000:begin
				Temp = Operand1 + Operand2;
				IsZero = (Temp == 0);				
			end
			
			// AddI
         3'b001:begin
				Temp = Operand1 + Operand2;
				IsZero = (Temp == 0);
			end
         
			// Shift Left(<<) And Right(>>)
         3'b010:begin
				if (Shift == 1)begin
					Temp = Operand1 >> Operand2;
					IsZero = (Temp == 0);
				end
				else begin
					Temp = Operand1 << Operand2; 
					IsZero = (Temp == 0);
				end
			end
			
			 // Rotate Left And Rotate Right 
			3'b011: begin
				if (Shift == 1)begin
					Temp = (Operand1 >> Operand2) | (Operand1 << (16 - Operand2));
					IsZero = (Temp == 0);
				end
				else begin
					Temp = (Operand1 << Operand2) | (Operand1 >> (16 - Operand2));
					IsZero = (Temp == 0);
				end
			end
			
			//Beqz
			3'b100: begin
			  Temp = Operand1 - Operand2;
			  IsZero = (Temp == 0);
			end
			
			// Store Word
			3'b101: begin
				Temp = Operand2;
				IsZero = (Temp == 0);
			end
			
			// Load Word
			3'b110: begin
				Temp = Operand2;
				IsZero = (Temp == 0);
			end
			
			//Jump
		   3'b111: begin
				Temp = Operand1 + Operand2;
				IsZero = (Temp == 0);
		   end
      endcase
   end

endmodule