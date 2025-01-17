`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:27:12 11/07/2022 
// Design Name: 
// Module Name:    GF16MulXorSqSc_Unit 
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
module GF16MulXorSqSc_Unit(
	input				clk,
	input				rst_i,
	
	// SboxA;
	input	[03:00]		h0g0f0e0,
	input	[03:00]		h1g1f1e1,
	
	input	[03:00]		d0c0b0a0,
	input	[03:00]		d1c1b1a1,
	
	input	[03:00]		guards,
	
	output	[01:00]		x,
	output	[01:00]		y,
	output	[01:00]		z,
	output	[01:00]		t
    );
	
	//// intermediate;
	// SboxA;
	wire				h0, h1;
	wire				g0, g1;
	wire				f0, f1;
	wire				e0, e1;
	
	wire				d0, d1;
	wire				c0, c1;
	wire				b0, b1;
	wire				a0, a1;
	
	wire				a0e0, a0e1, a1e0, a1e1;
	wire				a0f0, a0f1, a1f0, a1f1;
	wire				a0g0, a0g1, a1g0, a1g1;
	wire				a0h0, a0h1, a1h0, a1h1;
	
	wire 				b0e0, b0e1, b1e0, b1e1;
	wire 				b0f0, b0f1, b1f0, b1f1;
	wire 				b0g0, b0g1, b1g0, b1g1;
	wire				b0h0, b0h1, b1h0, b1h1;
	
	
	wire				c0e0, c0e1, c1e0, c1e1;
	wire				c0f0, c0f1, c1f0, c1f1;
	wire				c0g0, c0g1, c1g0, c1g1;
	wire				c0h0, c0h1, c1h0, c1h1;
	
	wire				d0e0, d0e1, d1e0, d1e1;
	wire				d0f0, d0f1, d1f0, d1f1;
	wire				d0g0, d0g1, d1g0, d1g1;
	wire				d0h0, d0h1, d1h0, d1h1;
	
	reg		[03:00]		x_r;
	reg		[03:00]		y_r;
	reg		[03:00]		z_r;
	reg		[03:00]		t_r;
	
	// assign;
	assign h0 = h0g0f0e0[3];
	assign g0 = h0g0f0e0[2];
	assign f0 = h0g0f0e0[1];
	assign e0 = h0g0f0e0[0];
	
	assign d0 = d0c0b0a0[3];
	assign c0 = d0c0b0a0[2];
	assign b0 = d0c0b0a0[1];
	assign a0 = d0c0b0a0[0];
	
	assign h1 = h1g1f1e1[3];
	assign g1 = h1g1f1e1[2];
	assign f1 = h1g1f1e1[1];
	assign e1 = h1g1f1e1[0];
	
	assign d1 = d1c1b1a1[3];
	assign c1 = d1c1b1a1[2];
	assign b1 = d1c1b1a1[1];
	assign a1 = d1c1b1a1[0];
	
	assign a0e0 = a0 & e0;
	assign a0e1 = a0 & e1;
	assign a1e0 = a1 & e0;
	assign a1e1 = a1 & e1;
	
	assign a0f0 = a0 & f0;
	assign a0f1 = a0 & f1;
	assign a1f0 = a1 & f0;
	assign a1f1 = a1 & f1;
	
	assign a0g0 = a0 & g0;
	assign a0g1 = a0 & g1;
	assign a1g0 = a1 & g0;
	assign a1g1 = a1 & g1;
	
	assign a0h0 = a0 & h0;
	assign a0h1 = a0 & h1;
	assign a1h0 = a1 & h0;
	assign a1h1 = a1 & h1;
	
	assign b0e0 = b0 & e0;
	assign b0e1 = b0 & e1;
	assign b1e0 = b1 & e0;
	assign b1e1 = b1 & e1;
	
	assign b0f0 = b0 & f0;
	assign b0f1 = b0 & f1;
	assign b1f0 = b1 & f0;
	assign b1f1 = b1 & f1;
	
	assign b0g0 = b0 & g0;
	assign b0g1 = b0 & g1;
	assign b1g0 = b1 & g0;
	assign b1g1 = b1 & g1;
	
	assign b0h0 = b0 & h0;
	assign b0h1 = b0 & h1;
	assign b1h0 = b1 & h0;
	assign b1h1 = b1 & h1;
	
	assign c0e0 = c0 & e0;
	assign c0e1 = c0 & e1;
	assign c1e0 = c1 & e0;
	assign c1e1 = c1 & e1;
	
	assign c0f0 = c0 & f0;
	assign c0f1 = c0 & f1;
	assign c1f0 = c1 & f0;
	assign c1f1 = c1 & f1;
	
	assign c0g0 = c0 & g0;
	assign c0g1 = c0 & g1;
	assign c1g0 = c1 & g0;
	assign c1g1 = c1 & g1;
	
	assign c0h0 = c0 & h0;
	assign c0h1 = c0 & h1;
	assign c1h0 = c1 & h0;
	assign c1h1 = c1 & h1;
	
	assign d0e0 = d0 & e0;
	assign d0e1 = d0 & e1;
	assign d1e0 = d1 & e0;
	assign d1e1 = d1 & e1;
	
	assign d0f0 = d0 & f0;
	assign d0f1 = d0 & f1;
	assign d1f0 = d1 & f0;
	assign d1f1 = d1 & f1;
	
	assign d0g0 = d0 & g0;
	assign d0g1 = d0 & g1;
	assign d1g0 = d1 & g0;
	assign d1g1 = d1 & g1;
	
	assign d0h0 = d0 & h0;
	assign d0h1 = d0 & h1;
	assign d1h0 = d1 & h0;
	assign d1h1 = d1 & h1;
	
	// x_r;
	always @(posedge clk)
	begin 
		x_r[0] <=			a0e0 ^ b0e0 ^ c0e0 ^ a0f0 ^ d0f0 ^ a0g0 ^ c0g0 ^ b0h0 ^ d0h0 ^ guards[0];
		x_r[1] <= a0 ^ e1 ^ a0e1 ^ b0e1 ^ c0e1 ^ a0f1 ^ d0f1 ^ a0g1 ^ c0g1 ^ b0h1 ^ d0h1 ^ guards[0];
		x_r[2] <= d1 ^ e0 ^ a1e0 ^ b1e0 ^ c1e0 ^ a1f0 ^ d1f0 ^ a1g0 ^ c1g0 ^ b1h0 ^ d1h0 ^ guards[0];
		x_r[3] <= a1 ^ d1 ^ a1e1 ^ b1e1 ^ c1e1 ^ a1f1 ^ d1f1 ^ a1g1 ^ c1g1 ^ b1h1 ^ d1h1 ^ guards[0];
	end
	
	// y_r;
	always @(posedge clk)
	begin
		y_r[0] =		   d0	   ^ a0e0 ^ d0e0 ^ b0f0 ^ c0f0 ^ d0f0 ^ b0g0 ^ d0g0 ^ a0h0 ^ b0h0 ^ c0h0 ^ d0h0 ^ guards[1];
		y_r[1] = a0 ^ b0 ^ d0 ^ f1 ^ a0e1 ^ d0e1 ^ b0f1 ^ c0f1 ^ d0f1 ^ b0g1 ^ d0g1 ^ a0h1 ^ b0h1 ^ c0h1 ^ d0h1 ^ guards[1];
		y_r[2] = a1 ^ b1 ^ e0 ^ f0 ^ a1e0 ^ d1e0 ^ b1f0 ^ c1f0 ^ d1f0 ^ b1g0 ^ d1g0 ^ a1h0 ^ b1h0 ^ c1h0 ^ d1h0 ^ guards[1];
		y_r[3] =		   e1      ^ a1e1 ^ d1e1 ^ b1f1 ^ c1f1 ^ d1f1 ^ b1g1 ^ d1g1 ^ a1h1 ^ b1h1 ^ c1h1 ^ d1h1 ^ guards[1];
	end
	
	// z_r;
	always @(posedge clk)
	begin
		z_r[0] <= a0				     ^ a0e0 ^ c0e0 ^ b0f0 ^ d0f0 ^ a0g0 ^ c0g0 ^ d0g0 ^ b0h0 ^ c0h0 ^ guards[2];
		z_r[1] <= a0 ^ b0 ^ d0      ^ g1 ^ a0e1 ^ c0e1 ^ b0f1 ^ d0f1 ^ a0g1 ^ c0g1 ^ d0g1 ^ b0h1 ^ c0h1 ^ guards[2];
		z_r[2] <= a1 ^ b1 ^ d1 ^ f0 ^ h0 ^ a1e0 ^ c1e0 ^ b1f0 ^ d1f0 ^ a1g0 ^ c1g0 ^ d1g0 ^ b1h0 ^ c1h0 ^ guards[2];
		z_r[3] <= a1      ^ f1 ^ g1 ^ h1 ^ a1e1 ^ c1e1 ^ b1f1 ^ d1f1 ^ a1g1 ^ c1g1 ^ d1g1 ^ b1h1 ^ c1h1 ^ guards[2];
	end
	
	// t_r;
	always @(posedge clk)
	begin
		t_r[0] <=	   b0			     ^ b0e0 ^ d0e0 ^ a0f0 ^ b0f0 ^ c0f0 ^ d0f0 ^ b0g0 ^ c0g0 ^ a0h0 ^ b0h0 ^ d0h0 ^ guards[3];
		t_r[1] <= a0 ^ b0 ^ c0		^ h1 ^ b0e1 ^ d0e1 ^ a0f1 ^ b0f1 ^ c0f1 ^ d0f1 ^ b0g1 ^ c0g1 ^ a0h1 ^ b0h1 ^ d0h1 ^ guards[3];
		t_r[2] <= a1 ^ b1 ^ c1 ^ e0 ^ g0 ^ b1e0 ^ d1e0 ^ a1f0 ^ b1f0 ^ c1f0 ^ d1f0 ^ b1g0 ^ c1g0 ^ a1h0 ^ b1h0 ^ d1h0 ^ guards[3];
		t_r[3] <=      b1 ^ e1 ^ g1 ^ h1 ^ b1e1 ^ d1e1 ^ a1f1 ^ b1f1 ^ c1f1 ^ d1f1 ^ b1g1 ^ c1g1 ^ a1h1 ^ b1h1 ^ d1h1 ^ guards[3];	
	end
	
	//// Output Assign;
	assign x[0] = x_r[0] ^ x_r[1];
	assign x[1] = x_r[2] ^ x_r[3];
	
	assign y[0] = y_r[0] ^ y_r[1];
	assign y[1] = y_r[2] ^ y_r[3];
	
	assign z[0] = z_r[0] ^ z_r[1];
	assign z[1] = z_r[2] ^ z_r[3];
	
	assign t[0] = t_r[0] ^ t_r[1];
	assign t[1] = t_r[2] ^ t_r[3];

endmodule
