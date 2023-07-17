`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:31:07 07/08/2023 
// Design Name: 
// Module Name:    CPU 
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
module CPU(
	input Clk,
	//input [15:0]PcInput,
	//output [15:0]PcOutput,
	output [15:0] Temp,
	output [15:0] ReadData1,
   output [15:0] ReadData2,
   output [15:0] Finalextend, //write back
	output Zero
   );
	
//reg RegisterClk;
//wire WireClk;
//assign WireClk = RegisterClk;


// Pc
wire [15:0] Pc_Input;
wire [15:0] Pc_Output;


// InstractionMemory
wire [15:0]Pc_Address;
wire [15:0]Pc_Instruction;


// Adder
wire [15:0]Pc_Adder;
wire [15:0]Pc_ResultAdder;


//Mux
wire [15:0] Pc_Mult;
wire [15:0] Pc_ResultMult;
wire Branch;

//Control Unit
wire [15:0] Pc_ControlUnit;
//wire Out;

//select destion register
wire Rd;
wire [3:0]Select_Des;
wire [3:0]Select_To_Rd;

//Register File
wire Rw;
wire [15:0]Register_Out1;
wire [15:0]Register_Out2;

//sign extend
wire [15:0]Sign_Out;
wire [15:0]Extend;
wire [15:0] Exit_Mux;

//
wire AluSource;

//alu
wire [15:0] AluInput;
wire [2:0] OpcodeOut;
wire Direction;
wire ZeroFlag;


wire [15:0]AluSourceResult;
wire [15:0]DataMemoryOut;

//data memory 
wire WE;//memory write
wire MemWrite;
wire [15:0] OutMux;
wire [15:0] MuxToReg;
wire [15:0] a;
wire [15:0] b;

//adderBranch
wire [15:0]ResultAdderBranch;
wire BranchPc;//output and
wire Branche;

//jump
wire Jumpj;
wire [15:0] PcConcat;
wire [15:0] Newpc;

// Pc
		Pc NamePc (
		 .Clk(Clk), 
		 .PcInput(Newpc), 
		 .PcOutput(Pc_Output)
		 );
assign  Pc_Address = Pc_Output;	
assign  Pc_Adder = Pc_Output;



// Instruction Memory
		InstructionMemory NameInstanceMemory (
		.Address(Pc_Address), 
		.Instruction(Pc_Instruction)
    );
assign Pc_ControlUnit = Pc_Instruction;
//assign InstructionOutput = Pc_Instruction;
	 
	 
// ControlUnit
		ControlUnit NameControlUnit (
			 .Opcode(Pc_ControlUnit[15:13]), 
			 .Alu_Src(AluSource), 
			 .Branch(Branche), 
			 .Mem_Write(WE), 
			 .Reg_Write(Rw), 
			 .Jump(Jumpj), 
			 .Mem_To_Reg(MemWrite), 
			 .Reg_Dst(Rd)
			 );
//assign InstructionOutput = Jumpj;


// Mult Reg Dest
		Mux_4bit DesSelect  (
		 .SelectorInput(Rd), 
		 .Operand1(Pc_ControlUnit[8:5]), 
		 .Operand2(Pc_ControlUnit[4:1]), 
		 .Result(Select_Des)
		 );
assign Select_To_Rd = Select_Des;

 
// Register File	 
assign a = Pc_ControlUnit[12:9];
assign b = Pc_ControlUnit[8:5];
	
		RegisterFile RegFile1 (
		 .Read_Register1(Pc_ControlUnit[12:9]), 
		 .Read_Register2(Pc_ControlUnit[8:5]), 
		 .Write_Reg(Select_To_Rd), 
		 .Write_Data(MuxToReg), //memory or regiser?
		 .Clk(Clk), 
		 .RegWrite(Rw), //write enable
		 .Read_Data1(Register_Out1), 
		 .Read_Data2(Register_Out2));
		 
assign ReadData1 = Register_Out1;
assign ReadData2 = Register_Out2;	 
	 
	 
// Mux2
		Mux2_1_16bit selectOperand  (
			 .Operand1(Register_Out2), 
			 .Operand2(Extend), 
			 .SelectorInput(AluSource), 
			 .Result(Exit_Mux)
			 );
			 
//assign Finalextend = Exit_Mux;	 
assign AluInput = Register_Out1;	 
	 
	 
// Alu
		ALU alu (
		 .Operand1(AluInput), 
		 .Operand2(Exit_Mux), 
		 .Alu_Opcode(OpcodeOut), 
		 .Shift(Direction), //left of right shift or rotait
		 .Result(AluSourceResult), 
		 .Zero_Out(ZeroFlag)
		 );
	
//assign Finalextend = AluSourceResult;
assign Zero = ZeroFlag; 
	 
	 
// Sign Extend
		SignExtend sign (     
		 .Immediate(Pc_ControlUnit[4:0]), 
		 .Extended(Sign_Out)
		 );
assign  Extend = Sign_Out;	 
	 
	 
// Adder
		Adder_16bit NameAdder16bit (
		 .Operand1(16'D1), 
		 .Operand2(Pc_Adder), 
		 .Sum(Pc_ResultAdder)
		 );
assign Pc_Mult	= Pc_ResultAdder;	 
		Adder_16bit NameAdder16bitBranch (
		 .Operand1(Pc_ResultAdder), 
		 .Operand2(Sign_Out), 
		 .Sum(ResultAdderBranch)
		 );
assign BranchPc =(ZeroFlag & Branche);
//assign Temp = Pc_ResultAdder ; 
//assign  PcOutput = Pc_Output;	

// Mux
		Mux2_1_16bit NameMux (
		 .Operand1(Pc_Mult), 
		 .Operand2(ResultAdderBranch), 
		 .SelectorInput(BranchPc),
		 .Result(Pc_ResultMult)
			 );
assign Temp = Pc_ResultMult;
	
assign PcConcat = {Pc_ResultAdder[15:13],Pc_ControlUnit[12:0]};
// Mux Jump mishe 	
		Mux2_1_16bit MuxJump (
		 .Operand1(Pc_ResultMult), 
		 .Operand2(PcConcat), 
		 .SelectorInput(Jumpj), 
		 .Result(Newpc)
		 );
	
assign OpcodeOut = Pc_ControlUnit[15:13];
assign Direction = Pc_ControlUnit[0];

		//data memory 
		DataMemoryUnit dataMemory (
			 .Address(AluSourceResult), 
			 .Write_Data(Register_Out2), 
			 .Clk(Clk), 
			 .MemWrite(WE), 
			 .Read_Data(DataMemoryOut)
			 );

	
		// mux
		Mux2_1_16bit OutputDataMemory (
			 .Operand1(AluSourceResult), 
			 .Operand2(DataMemoryOut), 
			 .SelectorInput(MemWrite), 
			 .Result(OutMux)
			 );

assign MuxToReg = OutMux;
assign Finalextend = OutMux;
endmodule

