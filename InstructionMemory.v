`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:32:44 07/08/2023 
// Design Name: 
// Module Name:    InstructionMemory 
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
module InstructionMemory(
	 input [15:0] Address,
    output [15:0] Instruction
    );
	 
reg [15:0] Memory [511:0];
integer i;


initial begin
	 //Assuming the first matrix starts at DM[0], and the second one follows it immediately:
    //Memory[0] = 16'b; //INC__
      Memory[0] = 16'b001_0000_0000_1111_0;  //Using $15 to save the sum, with initial value of zero; addi $15, $0, $0;
      Memory[1] = 16'b001_0000_0001_00010;   //Using $1 to store the length of the matrix : addi $1, $0, [length]
      Memory[2] = 16'b000_0000_0000_0010_0;  //Using $2 as the counter of the outer loop, with the initial val of zero: add $2, $0, $0
      Memory[3] = 16'b000_0000_0001_0011_0;   //Using $3 to point to the second matrix: add $3, $0, $1
      Memory[4] = 16'b100_0001_0010_01101;   //INC__Checking to see if we have reached the end of the loop: beq $1, $2, [End = 17](4 + 1 +12)
      
      Memory[5] = 16'b110_0010_0100_00000;  //Getting matrix1[i]: lw $4, 0($2);
      Memory[6] = 16'b110_0011_0101_00000; //Getting matrix2[i]: lw $5, 0($3);
      Memory[7] = 16'b000_0000_0000_0110_0;  //Using $6 as the counter of the inner loop, with the initial val of zero: add $6, $0, $0
      Memory[8] = 16'b000_0000_0000_0111_0; //Using $7 as the sum of the inner loop, with the initial value of zero: add $7, $0, $0
      Memory[9] = 16'b100_0110_0100_00011; //Checking to see if we have done enough additions: beq $4,$6,[ENDOFIN = 13] (9 + 1 + 3)
        
      Memory[10] = 16'b000_0101_0111_0111_0; // add $7,$7,$5
      Memory[11] = 16'b001_0110_0110_00001; //  addi $6, $6, 1
      Memory[12] = 16'b111_0000_0000_01001; //jmp 9;
      
      Memory[13] = 16'b001_0011_0011_00001; //Increasing the pointer to matrix2: addi $3,$3,1
      Memory[14] = 16'b001_0010_0010_00001; //Increasing the pointer to matrix1: addi $2,$2,1
      Memory[15] = 16'b000_0111_1111_1111_0;// add $7,$15,$15
      Memory[16] = 16'b101_1010_1111_10000; //sw $15, 16($10)
      Memory[17] = 16'b111_0000_0000_00100; //jmp 4;
    
      Memory[18] = 16'b101_0011_1111_00000; //sw $15, 0($3)



end
assign Instruction = Memory[Address];
initial begin
	for(i=0 ; i<512; i = i + 1)begin
		Memory[i] = i;
	end    
end
	

endmodule
