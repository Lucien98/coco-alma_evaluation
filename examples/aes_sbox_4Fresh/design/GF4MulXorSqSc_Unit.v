`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:35:31 11/07/2022 
// Design Name: 
// Module Name:    GF4MulXorSqSc_Unit 
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
module GF4MulXorSqSc_Unit(
	input				clk,
	
	input	[03:00]		d0c0b0a0,
	input	[03:00]		d1c1b1a1,
	
	input	[03:00]		guards,
	input	[03:00]		random,
	
	output	[01:00]		x,
	output	[01:00]		y,
	output	[01:00]		z,
	output	[01:00]		t
    );
	
	//// intermediate;
	// Sbox;
	wire				d0, d1;
	wire				c0, c1;
	wire				b0, b1;
	wire				a0, a1;
	
	wire				ra3, ra2;
	wire				ra1, ra0;
	
	wire				a0c0, a0c1;
	wire				a1c0, a1c1;
	
	wire				a0d0, a0d1;
	wire				a1d0, a1d1;
	
	wire				b0c0, b0c1;
	wire				b1c0, b1c1;
	
	wire				b0d0, b0d1;
	wire				b1d0, b1d1;
	
	wire	[03:00]		ta, tb;
	
	reg		[03:00]		x_r;
	reg		[03:00]		y_r;
	reg		[03:00]		z_r;
	reg		[03:00]		t_r;
	
	// assign;
	assign d0 = d0c0b0a0[3];
	assign c0 = d0c0b0a0[2];
	assign b0 = d0c0b0a0[1];
	assign a0 = d0c0b0a0[0];
	
	assign d1 = d1c1b1a1[3];
	assign c1 = d1c1b1a1[2];
	assign b1 = d1c1b1a1[1];
	assign a1 = d1c1b1a1[0];
	
	assign a0c0 = a0 & c0;
	assign a0c1 = a0 & c1;
	assign a1c0 = a1 & c0;
	assign a1c1 = a1 & c1;
	
	assign a0d0 = a0 & d0;
	assign a0d1 = a0 & d1;
	assign a1d0 = a1 & d0;
	assign a1d1 = a1 & d1;
	
	assign b0c0 = b0 & c0;
	assign b0c1 = b0 & c1;
	assign b1c0 = b1 & c0;
	assign b1c1 = b1 & c1;
	
	assign b0d0 = b0 & d0;
	assign b0d1 = b0 & d1;
	assign b1d0 = b1 & d0;
	assign b1d1 = b1 & d1;
	
	assign ta[0] = b0      ^ a0c0 ^ b0c0 ^ a0d0;
	assign ta[1] =           a0c1 ^ b0c1 ^ a0d1;
	assign ta[2] = b1 ^ d0 ^ a1c0 ^ b1c0 ^ a1d0;
	assign ta[3] =      d1 ^ a1c1 ^ b1c1 ^ a1d1;
	
	assign tb[0] = a0 ^ b0           ^ b0c0 ^ a0d0 ^ b0d0;
	assign tb[1] =                     b0c1 ^ a0d1 ^ b0d1;
	assign tb[2] = a1 ^ b1 ^ c0 ^ d0 ^ b1c0 ^ a1d0 ^ b1d0;
	assign tb[3] =           c1 ^ d1 ^ b1c1 ^ a1d1 ^ b1d1;
	
	// x_r;
	always @(posedge clk)
	begin
		x_r[0] <= ta[0] ^ guards[0] ^ random[0];
		x_r[1] <= ta[1] ^ guards[0];
		x_r[2] <= ta[2] ^ guards[0] ^ random[0];
		x_r[3] <= ta[3] ^ guards[0];
	end
	
	// y_r;
	always @(posedge clk)
	begin
		y_r[0] <= tb[0] ^ guards[1] ^ random[1];
		y_r[1] <= tb[1] ^ guards[1];
		y_r[2] <= tb[2] ^ guards[1] ^ random[1];
		y_r[3] <= tb[3] ^ guards[1];
	end
	
	//  z_r;
	always @(posedge clk)
	begin
		z_r[0] <= ta[0] ^ guards[2] ^ random[2];
		z_r[1] <= ta[1] ^ guards[2];
		z_r[2] <= ta[2] ^ guards[2] ^ random[2];
		z_r[3] <= ta[3] ^ guards[2];
	end
	
	// t_r;
	always @(posedge clk)
	begin
		t_r[0] <= tb[0] ^ guards[3] ^ random[3];
		t_r[1] <= tb[1] ^ guards[3];
		t_r[2] <= tb[2] ^ guards[3] ^ random[3];
		t_r[3] <= tb[3] ^ guards[3];
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
