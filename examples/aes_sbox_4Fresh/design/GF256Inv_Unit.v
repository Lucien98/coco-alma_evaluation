`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:39:16 11/07/2022 
// Design Name: 
// Module Name:    GF256Inv_Unit 
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
module GF256Inv_Unit(
	input				clk,
	input				rst_i,
	
	input	[07:00]		h0g0f0e0d0c0b0a0,
	input	[07:00]		h1g1f1e1d1c1b1a1,
	
	input	[07:00]		guards,
	input	[03:00]		random,
	
	output	[07:00]		v0u0s0r0t0z0y0x0,
	output	[07:00]		v1u1s1r1t1z1y1x1
    );
	
	//// intermediate;
	// AffineInput;
	wire	[07:00]		AffineInputSh0;
	wire	[07:00]		AffineInputSh1;
	
	reg		[07:00]		AffineInputSh0_r;
	reg		[07:00]		AffineInputSh1_r;
	
	reg		[07:00]		AffineInputSh0_r0;
	reg		[07:00]		AffineInputSh1_r0;
	
	reg		[07:00]		AffineInputSh0_r1;
	reg		[07:00]		AffineInputSh1_r1;
	
	reg		[07:00]		AffineInputSh0_r2;
	reg		[07:00]		AffineInputSh1_r2;
	
	reg		[07:00]		guards_r0;
	reg		[07:00]		guards_r1;
	reg		[07:00]		guards_r2;
	
	// GF16.MulXorSqSc;
	wire	[03:00]		Gf16MulXorSqScSh0;
	wire	[03:00]		Gf16MulXorSqScSh1;
	
	// GF4.MulXorSqSc;
	wire	[01:00]		GF4MulXorSqSc0Sh0;
	wire	[01:00]		GF4MulXorSqSc0Sh1;
	wire	[01:00]		GF4MulXorSqSc1Sh0;
	wire	[01:00]		GF4MulXorSqSc1Sh1;
	
	reg		[03:00]		Gf16MulXorSqScSh0_r;
	reg		[03:00]		Gf16MulXorSqScSh1_r;
	
	// GF4.Mul0, GF4.Mul1;
	wire	[03:00]		GF4MulSh0;
	wire	[03:00]		GF4MulSh1;
	
	//// AffineInput;
	always @(posedge clk) AffineInputSh0_r <= AffineInputSh0;
	always @(posedge clk) AffineInputSh1_r <= AffineInputSh1;
	
	always @(posedge clk) AffineInputSh0_r0 <= AffineInputSh0_r;
	always @(posedge clk) AffineInputSh1_r0 <= AffineInputSh1_r;
	
	always @(posedge clk) AffineInputSh0_r1 <= AffineInputSh0_r0;
	always @(posedge clk) AffineInputSh1_r1 <= AffineInputSh1_r0;
	
	always @(posedge clk) AffineInputSh0_r2 <= AffineInputSh0_r1;
	always @(posedge clk) AffineInputSh1_r2 <= AffineInputSh1_r1;
	
	// guards;
	always @(posedge clk) guards_r0 <= guards;
	always @(posedge clk) guards_r1 <= guards_r0;
	always @(posedge clk) guards_r2 <= guards_r1;
	
	// Gf16MulXorSqScASh0, Gf16MulXorSqScASh1;
	always @(posedge clk) Gf16MulXorSqScSh0_r <= Gf16MulXorSqScSh0;
	always @(posedge clk) Gf16MulXorSqScSh1_r <= Gf16MulXorSqScSh1;
	
	//// AffineInput;
	AffineInput_Unit Inst_AffineInputA_Unit0(
	.A					(h0g0f0e0d0c0b0a0),
	.Z					(AffineInputSh0)
    );
	
	AffineInput_Unit Inst_AffineInputA_Unit1(
	.A					(h1g1f1e1d1c1b1a1),
	.Z					(AffineInputSh1)
    );
	
	//// GF16.MulXorSqSc;
	GF16MulXorSqSc_Unit Inst_GF16MulXorSqSc_Unit(
	.clk				(clk),
	
	.h0g0f0e0			(AffineInputSh0_r[07:04]),
	.h1g1f1e1			(AffineInputSh1_r[07:04]),
	.d0c0b0a0			(AffineInputSh0_r[03:00]),
	.d1c1b1a1			(AffineInputSh1_r[03:00]),
		
	.guards				(guards_r0[03:00]),
	
	.x					({Gf16MulXorSqScSh0[0], Gf16MulXorSqScSh1[0]}),
	.y					({Gf16MulXorSqScSh0[1], Gf16MulXorSqScSh1[1]}),
	.z					({Gf16MulXorSqScSh0[2], Gf16MulXorSqScSh1[2]}),
	.t					({Gf16MulXorSqScSh0[3], Gf16MulXorSqScSh1[3]})
    );
	
	//// GF4.MulXorSqSc;
	GF4MulXorSqSc_Unit Inst_GF4MulXorSqSc_Unit(
	.clk				(clk),
	
	.d0c0b0a0			(Gf16MulXorSqScSh0),
	.d1c1b1a1			(Gf16MulXorSqScSh1),
	
	.guards				(guards_r1[07:04]),
	.random				(random),
	
	.x					({GF4MulXorSqSc0Sh0[0], GF4MulXorSqSc0Sh1[0]}),
	.y					({GF4MulXorSqSc0Sh0[1], GF4MulXorSqSc0Sh1[1]}),
	.z					({GF4MulXorSqSc1Sh0[0], GF4MulXorSqSc1Sh1[0]}),
	.t					({GF4MulXorSqSc1Sh0[1], GF4MulXorSqSc1Sh1[1]})
    );
	
	//// GF4.Mul;
	GF4Mul_Unit Inst_GF4Mul_Unit(
	.clk				(clk),
	
	.d0c0b0a0			(Gf16MulXorSqScSh0_r),
	.d1c1b1a1			(Gf16MulXorSqScSh1_r),
	
	.h0g0f0e0			({GF4MulXorSqSc1Sh0, GF4MulXorSqSc0Sh0}),
	.h1g1f1e1			({GF4MulXorSqSc1Sh1, GF4MulXorSqSc0Sh1}),
	
	.guards				(guards_r2[03:00]),
	
	.x					({GF4MulSh0[0], GF4MulSh1[0]}),
	.y					({GF4MulSh0[1], GF4MulSh1[1]}),
	.z					({GF4MulSh0[2], GF4MulSh1[2]}),
	.t					({GF4MulSh0[3], GF4MulSh1[3]})
    );
	
	//// GF16.Mul;
	GF16Mul_Unit Inst_GF16Mul_Unit(
	.clk				(clk),
	
	.d0c0b0a0			(AffineInputSh0_r2[03:00]),
	.d1c1b1a1			(AffineInputSh1_r2[03:00]),
	.h0g0f0e0			(AffineInputSh0_r2[07:04]),
	.h1g1f1e1			(AffineInputSh1_r2[07:04]),
	
	.q0p0n0m0			(GF4MulSh0),
	.q1p1n1m1			(GF4MulSh1),
	
	.x					({v0u0s0r0t0z0y0x0[0], v1u1s1r1t1z1y1x1[0]}),
	.y					({v0u0s0r0t0z0y0x0[1], v1u1s1r1t1z1y1x1[1]}),
	.z					({v0u0s0r0t0z0y0x0[2], v1u1s1r1t1z1y1x1[2]}),
	.t					({v0u0s0r0t0z0y0x0[3], v1u1s1r1t1z1y1x1[3]}),
	
	.r					({v0u0s0r0t0z0y0x0[4], v1u1s1r1t1z1y1x1[4]}),
	.s					({v0u0s0r0t0z0y0x0[5], v1u1s1r1t1z1y1x1[5]}),
	.u					({v0u0s0r0t0z0y0x0[6], v1u1s1r1t1z1y1x1[6]}),
	.v					({v0u0s0r0t0z0y0x0[7], v1u1s1r1t1z1y1x1[7]})
    );
	
endmodule
