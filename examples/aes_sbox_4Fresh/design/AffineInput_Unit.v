`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:50:37 11/07/2022 
// Design Name: 
// Module Name:    AffineInput_Unit 
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
module AffineInput_Unit(
	input	[07:00]		A,
	output	[07:00]		Z
    );
	
	// intermediate;
	wire				R1;
	wire				R2;
	wire				R3;
	wire				R4;
	wire				R5;
	wire				R6;
	wire				R7;
	wire				R8;
	wire				R9;
	
	wire	[07:00]		B;
	
	assign R1 =  A[7] ^ A[5];
	
	assign R2 = ~A[7] ^ A[4];
	assign R3 =  A[6] ^ A[0];
	assign R4 = ~A[5] ^ R3;
	assign R5 =  A[4] ^ R4;
	assign R6 =  A[3] ^ A[0];
	assign R7 =  A[2] ^ R1;
	assign R8 =  A[1] ^ R3;
	assign R9 =  A[3] ^ R8;
	
	assign B[7] = ~R7 ^ R8;
	assign B[6] =  R5;
	assign B[5] =  A[1] ^ R4;
	assign B[4] = ~R1 ^ R3;
	assign B[3] =  A[1] ^ R2 ^ R6;
	assign B[2] = ~A[0];
	assign B[1] =  R4;
	assign B[0] = ~A[2] ^ R9;
	
	assign Z = ~B;
	
endmodule
