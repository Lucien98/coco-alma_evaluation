`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:52:56 11/07/2022 
// Design Name: 
// Module Name:    GF16Mul_Unit 
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
module GF16Mul_Unit(
	input				clk,
	
	input	[03:00]		d0c0b0a0,
	input	[03:00]		d1c1b1a1,
	
	input	[03:00]		h0g0f0e0,
	input	[03:00]		h1g1f1e1,
	
	input	[03:00]		q0p0n0m0,
	input	[03:00]		q1p1n1m1,
	
	output	[01:00]		x,
	output	[01:00]		y,
	output	[01:00]		z,
	output	[01:00]		t,
	
	output	[01:00]		r,
	output	[01:00]		s,
	output	[01:00]		u,
	output	[01:00]		v
    );
	
	// intermediate;
	// SboxA;
	wire				h0, h1;
	wire				g0, g1;
	wire				f0, f1;
	wire				e0, e1;
	
	wire				d0, d1;
	wire				c0, c1;
	wire				b0, b1;
	wire				a0, a1;
	
	wire				q0, q1;
	wire				p0, p1;
	wire				n0, n1;
	wire				m0, m1;
	
	wire				m0a0, m0a1;
	wire				m1a0, m1a1;
	
	wire				m0b0, m0b1;
	wire				m1b0, m1b1;
	
	wire				m0c0, m0c1;
	wire				m1c0, m1c1;
	
	wire				m0d0, m0d1;
	wire				m1d0, m1d1;
	
	wire				m0e0, m0e1;
	wire				m1e0, m1e1;
	
	wire				m0f0, m0f1;
	wire				m1f0, m1f1;
	
	wire				m0g0, m0g1;
	wire				m1g0, m1g1;
	
	wire				m0h0, m0h1;
	wire				m1h0, m1h1;
	
	wire				n0a0, n0a1;
	wire				n1a0, n1a1;
	
	wire				n0b0, n0b1;
	wire				n1b0, n1b1;
	
	wire				n0c0, n0c1;
	wire				n1c0, n1c1;
	
	wire				n0d0, n0d1;
	wire				n1d0, n1d1;
	
	wire				n0e0, n0e1;
	wire				n1e0, n1e1;
	
	wire				n0f0, n0f1;
	wire				n1f0, n1f1;
	
	wire				n0g0, n0g1;
	wire				n1g0, n1g1;
	
	wire				n0h0, n0h1;
	wire				n1h0, n1h1;
	
	wire				p0a0, p0a1;
	wire				p1a0, p1a1;
	
	wire				p0b0, p0b1;
	wire				p1b0, p1b1;
	
	wire				p0c0, p0c1;
	wire				p1c0, p1c1;
	
	wire				p0d0, p0d1;
	wire				p1d0, p1d1;
	
	wire				p0e0, p0e1;
	wire				p1e0, p1e1;
	
	wire				p0f0, p0f1;
	wire				p1f0, p1f1;
	
	wire				p0g0, p0g1;
	wire				p1g0, p1g1;
	
	wire				p0h0, p0h1;
	wire				p1h0, p1h1;
	
	wire				q0a0, q0a1;
	wire				q1a0, q1a1;
	
	wire				q0b0, q0b1;
	wire				q1b0, q1b1;
	
	wire				q0c0, q0c1;
	wire				q1c0, q1c1;
	
	wire				q0d0, q0d1;
	wire				q1d0, q1d1;
	
	wire				q0e0, q0e1;
	wire				q1e0, q1e1;
	
	wire				q0f0, q0f1;
	wire				q1f0, q1f1;
	
	wire				q0g0, q0g1;
	wire				q1g0, q1g1;
	
	wire				q0h0, q0h1;
	wire				q1h0, q1h1;
	
	reg		[03:00]		x_r;
	reg		[03:00]		y_r;
	reg		[03:00]		z_r;
	reg		[03:00]		t_r;
	
	reg		[03:00]		r_r;
	reg		[03:00]		s_r;
	reg		[03:00]		u_r;
	reg		[03:00]		v_r;
	
	// assign;
	assign h0 = h0g0f0e0[3];
	assign g0 = h0g0f0e0[2];
	assign f0 = h0g0f0e0[1];
	assign e0 = h0g0f0e0[0];
	
	assign d0 = d0c0b0a0[3];
	assign c0 = d0c0b0a0[2];
	assign b0 = d0c0b0a0[1];
	assign a0 = d0c0b0a0[0];
	
	assign q0 = q0p0n0m0[3];
	assign p0 = q0p0n0m0[2];
	assign n0 = q0p0n0m0[1];
	assign m0 = q0p0n0m0[0];
	
	assign h1 = h1g1f1e1[3];
	assign g1 = h1g1f1e1[2];
	assign f1 = h1g1f1e1[1];
	assign e1 = h1g1f1e1[0];
	
	assign d1 = d1c1b1a1[3];
	assign c1 = d1c1b1a1[2];
	assign b1 = d1c1b1a1[1];
	assign a1 = d1c1b1a1[0];
	
	assign q1 = q1p1n1m1[3];
	assign p1 = q1p1n1m1[2];
	assign n1 = q1p1n1m1[1];
	assign m1 = q1p1n1m1[0];
	
	assign m0a0 = m0 & a0;
	assign m0a1 = m0 & a1;
	assign m1a0 = m1 & a0;
	assign m1a1 = m1 & a1;
	
	assign m0b0 = m0 & b0;
	assign m0b1 = m0 & b1;
	assign m1b0 = m1 & b0;
	assign m1b1 = m1 & b1;
	
	assign m0c0 = m0 & c0;
	assign m0c1 = m0 & c1;
	assign m1c0 = m1 & c0;
	assign m1c1 = m1 & c1;
	
	assign m0d0 = m0 & d0;
	assign m0d1 = m0 & d1;
	assign m1d0 = m1 & d0;
	assign m1d1 = m1 & d1;
	
	assign m0e0 = m0 & e0;
	assign m0e1 = m0 & e1;
	assign m1e0 = m1 & e0;
	assign m1e1 = m1 & e1;
	
	assign m0f0 = m0 & f0;
	assign m0f1 = m0 & f1;
	assign m1f0 = m1 & f0;
	assign m1f1 = m1 & f1;
	
	assign m0g0 = m0 & g0;
	assign m0g1 = m0 & g1;
	assign m1g0 = m1 & g0;
	assign m1g1 = m1 & g1;
	
	assign m0h0 = m0 & h0;
	assign m0h1 = m0 & h1;
	assign m1h0 = m1 & h0;
	assign m1h1 = m1 & h1;
	
	assign n0a0 = n0 & a0;
	assign n0a1 = n0 & a1;
	assign n1a0 = n1 & a0;
	assign n1a1 = n1 & a1;
	
	assign n0b0 = n0 & b0;
	assign n0b1 = n0 & b1;
	assign n1b0 = n1 & b0;
	assign n1b1 = n1 & b1;
	
	assign n0c0 = n0 & c0;
	assign n0c1 = n0 & c1;
	assign n1c0 = n1 & c0;
	assign n1c1 = n1 & c1;
	
	assign n0d0 = n0 & d0;
	assign n0d1 = n0 & d1;
	assign n1d0 = n1 & d0;
	assign n1d1 = n1 & d1;
	
	assign n0e0 = n0 & e0;
	assign n0e1 = n0 & e1;
	assign n1e0 = n1 & e0;
	assign n1e1 = n1 & e1;
	
	assign n0f0 = n0 & f0;
	assign n0f1 = n0 & f1;
	assign n1f0 = n1 & f0;
	assign n1f1 = n1 & f1;
	
	assign n0g0 = n0 & g0;
	assign n0g1 = n0 & g1;
	assign n1g0 = n1 & g0;
	assign n1g1 = n1 & g1;
	
	assign n0h0 = n0 & h0;
	assign n0h1 = n0 & h1;
	assign n1h0 = n1 & h0;
	assign n1h1 = n1 & h1;
	
	assign p0a0 = p0 & a0;
	assign p0a1 = p0 & a1;
	assign p1a0 = p1 & a0;
	assign p1a1 = p1 & a1;
	
	assign p0b0 = p0 & b0;
	assign p0b1 = p0 & b1;
	assign p1b0 = p1 & b0;
	assign p1b1 = p1 & b1;
	
	assign p0c0 = p0 & c0;
	assign p0c1 = p0 & c1;
	assign p1c0 = p1 & c0;
	assign p1c1 = p1 & c1;
	
	assign p0d0 = p0 & d0;
	assign p0d1 = p0 & d1;
	assign p1d0 = p1 & d0;
	assign p1d1 = p1 & d1;
	
	assign p0e0 = p0 & e0;
	assign p0e1 = p0 & e1;
	assign p1e0 = p1 & e0;
	assign p1e1 = p1 & e1;
	
	assign p0f0 = p0 & f0;
	assign p0f1 = p0 & f1;
	assign p1f0 = p1 & f0;
	assign p1f1 = p1 & f1;
	
	assign p0g0 = p0 & g0;
	assign p0g1 = p0 & g1;
	assign p1g0 = p1 & g0;
	assign p1g1 = p1 & g1;
	
	assign p0h0 = p0 & h0;
	assign p0h1 = p0 & h1;
	assign p1h0 = p1 & h0;
	assign p1h1 = p1 & h1;
	
	assign q0a0 = q0 & a0;
	assign q0a1 = q0 & a1;
	assign q1a0 = q1 & a0;
	assign q1a1 = q1 & a1;
	
	assign q0b0 = q0 & b0;
	assign q0b1 = q0 & b1;
	assign q1b0 = q1 & b0;
	assign q1b1 = q1 & b1;
	
	assign q0c0 = q0 & c0;
	assign q0c1 = q0 & c1;
	assign q1c0 = q1 & c0;
	assign q1c1 = q1 & c1;
	
	assign q0d0 = q0 & d0;
	assign q0d1 = q0 & d1;
	assign q1d0 = q1 & d0;
	assign q1d1 = q1 & d1;
	
	assign q0e0 = q0 & e0;
	assign q0e1 = q0 & e1;
	assign q1e0 = q1 & e0;
	assign q1e1 = q1 & e1;
	
	assign q0f0 = q0 & f0;
	assign q0f1 = q0 & f1;
	assign q1f0 = q1 & f0;
	assign q1f1 = q1 & f1;
	
	assign q0g0 = q0 & g0;
	assign q0g1 = q0 & g1;
	assign q1g0 = q1 & g0;
	assign q1g1 = q1 & g1;
	
	assign q0h0 = q0 & h0;
	assign q0h1 = q0 & h1;
	assign q1h0 = q1 & h0;
	assign q1h1 = q1 & h1;
	
	// x_r;
	always @(posedge clk)
	begin
		x_r[0] <= m0 ^ n0	   ^ m0e0 ^ n0e0 ^ p0e0 ^ m0f0 ^ q0f0 ^ m0g0 ^ p0g0 ^ n0h0 ^ q0h0 ^ a0;
		x_r[1] <= m0 ^ n0 ^ f1 ^ m0e1 ^ n0e1 ^ p0e1 ^ m0f1 ^ q0f1 ^ m0g1 ^ p0g1 ^ n0h1 ^ q0h1 ^ a0;
		x_r[2] <= m1 ^ n1	   ^ m1e0 ^ n1e0 ^ p1e0 ^ m1f0 ^ q1f0 ^ m1g0 ^ p1g0 ^ n1h0 ^ q1h0 ^ a0;
		x_r[3] <= m1 ^ n1 ^ f1 ^ m1e1 ^ n1e1 ^ p1e1 ^ m1f1 ^ q1f1 ^ m1g1 ^ p1g1 ^ n1h1 ^ q1h1 ^ a0;
	end
	
	// y_r;
	always @(posedge clk)
	begin
		y_r[0] <= n0	  ^ m0e0 ^ q0e0 ^ n0f0 ^ p0f0 ^ q0f0 ^ n0g0 ^ q0g0 ^ m0h0 ^ n0h0 ^ p0h0 ^ q0h0 ^ b0;
		y_r[1] <= n0 ^ g1 ^ m0e1 ^ q0e1 ^ n0f1 ^ p0f1 ^ q0f1 ^ n0g1 ^ q0g1 ^ m0h1 ^ n0h1 ^ p0h1 ^ q0h1 ^ b0;
		y_r[2] <= n1	  ^ m1e0 ^ q1e0 ^ n1f0 ^ p1f0 ^ q1f0 ^ n1g0 ^ q1g0 ^ m1h0 ^ n1h0 ^ p1h0 ^ q1h0 ^ b0;
		y_r[3] <= n1 ^ g1 ^ m1e1 ^ q1e1 ^ n1f1 ^ p1f1 ^ q1f1 ^ n1g1 ^ q1g1 ^ m1h1 ^ n1h1 ^ p1h1 ^ q1h1 ^ b0;
	end
	
	// z_r;
	always @(posedge clk)
	begin
		z_r[0] <= m0	  ^ m0e0 ^ p0e0 ^ n0f0 ^ q0f0 ^ m0g0 ^ p0g0 ^ q0g0 ^ n0h0 ^ p0h0 ^ c0;
		z_r[1] <= m0 ^ h1 ^ m0e1 ^ p0e1 ^ n0f1 ^ q0f1 ^ m0g1 ^ p0g1 ^ q0g1 ^ n0h1 ^ p0h1 ^ c0;
		z_r[2] <= m1	  ^ m1e0 ^ p1e0 ^ n1f0 ^ q1f0 ^ m1g0 ^ p1g0 ^ q1g0 ^ n1h0 ^ p1h0 ^ c0;
		z_r[3] <= m1 ^ h1 ^ m1e1 ^ p1e1 ^ n1f1 ^ q1f1 ^ m1g1 ^ p1g1 ^ q1g1 ^ n1h1 ^ p1h1 ^ c0;
	end
	
	// t_r;
	always @(posedge clk)
	begin
		t_r[0] <= p0 ^ q0 ^ e0 ^ h0 ^ n0e0 ^ q0e0 ^ m0f0 ^ n0f0 ^ p0f0 ^ q0f0 ^ n0g0 ^ p0g0 ^ m0h0 ^ n0h0 ^ q0h0 ^ d0;
		t_r[1] <= p0 ^ q0 ^ f1 ^ g1 ^ n0e1 ^ q0e1 ^ m0f1 ^ n0f1 ^ p0f1 ^ q0f1 ^ n0g1 ^ p0g1 ^ m0h1 ^ n0h1 ^ q0h1 ^ d0;
		t_r[2] <= p1 ^ q1 ^ e0 ^ h0 ^ n1e0 ^ q1e0 ^ m1f0 ^ n1f0 ^ p1f0 ^ q1f0 ^ n1g0 ^ p1g0 ^ m1h0 ^ n1h0 ^ q1h0 ^ d0;
		t_r[3] <= p1 ^ q1 ^ f1 ^ g1 ^ n1e1 ^ q1e1 ^ m1f1 ^ n1f1 ^ p1f1 ^ q1f1 ^ n1g1 ^ p1g1 ^ m1h1 ^ n1h1 ^ q1h1 ^ d0;
	end
	
	// r_r;
	always @(posedge clk)
	begin
		r_r[0] <= m0 ^ n0	   ^ m0a0 ^ n0a0 ^ p0a0 ^ m0b0 ^ q0b0 ^ m0c0 ^ p0c0 ^ n0d0 ^ q0d0 ^ e0;
		r_r[1] <= m0 ^ n0 ^ b1 ^ m0a1 ^ n0a1 ^ p0a1 ^ m0b1 ^ q0b1 ^ m0c1 ^ p0c1 ^ n0d1 ^ q0d1 ^ e0;
		r_r[2] <= m1 ^ n1	   ^ m1a0 ^ n1a0 ^ p1a0 ^ m1b0 ^ q1b0 ^ m1c0 ^ p1c0 ^ n1d0 ^ q1d0 ^ e0;
		r_r[3] <= m1 ^ n1 ^ b1 ^ m1a1 ^ n1a1 ^ p1a1 ^ m1b1 ^ q1b1 ^ m1c1 ^ p1c1 ^ n1d1 ^ q1d1 ^ e0;
	end
	
	// s_r;
	always @(posedge clk)
	begin
		s_r[0] <= n0	  ^ m0a0 ^ q0a0 ^ n0b0 ^ p0b0 ^ q0b0 ^ n0c0 ^ q0c0 ^ m0d0 ^ n0d0 ^ p0d0 ^ q0d0 ^ f0;
		s_r[1] <= n0 ^ c1 ^ m0a1 ^ q0a1 ^ n0b1 ^ p0b1 ^ q0b1 ^ n0c1 ^ q0c1 ^ m0d1 ^ n0d1 ^ p0d1 ^ q0d1 ^ f0;
		s_r[2] <= n1	  ^ m1a0 ^ q1a0 ^ n1b0 ^ p1b0 ^ q1b0 ^ n1c0 ^ q1c0 ^ m1d0 ^ n1d0 ^ p1d0 ^ q1d0 ^ f0;
		s_r[3] <= n1 ^ c1 ^ m1a1 ^ q1a1 ^ n1b1 ^ p1b1 ^ q1b1 ^ n1c1 ^ q1c1 ^ m1d1 ^ n1d1 ^ p1d1 ^ q1d1 ^ f0;
	end
	
	// u_r;
	always @(posedge clk)
	begin
		u_r[0] <= m0	  ^ m0a0 ^ p0a0 ^ n0b0 ^ q0b0 ^ m0c0 ^ p0c0 ^ q0c0 ^ n0d0 ^ p0d0 ^ g0;
		u_r[1] <= m0 ^ d1 ^ m0a1 ^ p0a1 ^ n0b1 ^ q0b1 ^ m0c1 ^ p0c1 ^ q0c1 ^ n0d1 ^ p0d1 ^ g0;
		u_r[2] <= m1	  ^ m1a0 ^ p1a0 ^ n1b0 ^ q1b0 ^ m1c0 ^ p1c0 ^ q1c0 ^ n1d0 ^ p1d0 ^ g0;
		u_r[3] <= m1 ^ d1 ^ m1a1 ^ p1a1 ^ n1b1 ^ q1b1 ^ m1c1 ^ p1c1 ^ q1c1 ^ n1d1 ^ p1d1 ^ g0;
	end
	
	// v_r;
	always @(posedge clk)
	begin
		v_r[0] <= p0 ^ q0 ^ a0 ^ d0 ^ n0a0 ^ q0a0 ^ m0b0 ^ n0b0 ^ p0b0 ^ q0b0 ^ n0c0 ^ p0c0 ^ m0d0 ^ n0d0 ^ q0d0 ^ h0;
		v_r[1] <= p0 ^ q0 ^ b1 ^ c1 ^ n0a1 ^ q0a1 ^ m0b1 ^ n0b1 ^ p0b1 ^ q0b1 ^ n0c1 ^ p0c1 ^ m0d1 ^ n0d1 ^ q0d1 ^ h0;
		v_r[2] <= p1 ^ q1 ^ a0 ^ d0 ^ n1a0 ^ q1a0 ^ m1b0 ^ n1b0 ^ p1b0 ^ q1b0 ^ n1c0 ^ p1c0 ^ m1d0 ^ n1d0 ^ q1d0 ^ h0;
		v_r[3] <= p1 ^ q1 ^ b1 ^ c1 ^ n1a1 ^ q1a1 ^ m1b1 ^ n1b1 ^ p1b1 ^ q1b1 ^ n1c1 ^ p1c1 ^ m1d1 ^ n1d1 ^ q1d1 ^ h0;
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
	
	assign r[0] = r_r[0] ^ r_r[1];
	assign r[1] = r_r[2] ^ r_r[3];
	
	assign s[0] = s_r[0] ^ s_r[1];
	assign s[1] = s_r[2] ^ s_r[3];
	
	assign u[0] = u_r[0] ^ u_r[1];
	assign u[1] = u_r[2] ^ u_r[3];
	
	assign v[0] = v_r[0] ^ v_r[1];
	assign v[1] = v_r[2] ^ v_r[3];
	
endmodule
