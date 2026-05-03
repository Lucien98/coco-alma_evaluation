
`timescale 1ns/1ps

// latency = 3

// Fully pipeline PINI circuit in 3 clock cycles.
// This file has been automatically generated.
`ifdef FULLVERIF
(* fv_prop = "PINI", fv_strat = "composite", fv_order=d *)
`endif
module RC3mod_16 # ( parameter d=2 ) (
    clk,
    i0,
    i1,
    i2,
    i3,
    i4,
    i5,
    i6,
    i7,
    o0,
    o1,
    o2,
    o3,
    rnd_0,
    rnd_1,
);
`include "MSKand_hpc1.vh"
`include "MSKand_hpc2.vh"
`include "MSKand_hpc3.vh"
(* fv_type="clock" *)
input clk;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] i0;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] i1;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] i2;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] i3;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] i4;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] i5;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] i6;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] i7;
(* fv_type="sharing", fv_latency=3, fv_count=1 *)
output [d-1:0] o0;
(* fv_type="sharing", fv_latency=3, fv_count=1 *)
output [d-1:0] o1;
(* fv_type="sharing", fv_latency=3, fv_count=1 *)
output [d-1:0] o2;
(* fv_type="sharing", fv_latency=3, fv_count=1 *)
output [d-1:0] o3;
(* fv_type="random", fv_count=1, fv_rnd_count_0=1*(1*d*(d-1))+4*(1*d*(d-1)/2), fv_rnd_lat_0=0  *)
input [1*(1*d*(d-1))+4*(1*d*(d-1)/2)-1:0] rnd_0;
(* fv_type="random", fv_count=1, fv_rnd_count_0=2*(1*d*(d-1)/2), fv_rnd_lat_0=1  *)
input [2*(1*d*(d-1)/2)-1:0] rnd_1;
wire [d-1:0] c1_1;
wire [d-1:0] c2_2;
wire [d-1:0] c3_3;
wire [d-1:0] i0_0;
wire [d-1:0] i0_1;
wire [d-1:0] i1_0;
wire [d-1:0] i1_1;
wire [d-1:0] i2_0;
wire [d-1:0] i2_1;
wire [d-1:0] i2_2;
wire [d-1:0] i3_0;
wire [d-1:0] i4_0;
wire [d-1:0] i5_0;
wire [d-1:0] i5_1;
wire [d-1:0] i6_0;
wire [d-1:0] i6_1;
wire [d-1:0] i6_2;
wire [d-1:0] i7_0;
wire [d-1:0] o0_0;
wire [d-1:0] o0_1;
wire [d-1:0] o0_2;
wire [d-1:0] o0_3;
wire [d-1:0] o1_1;
wire [d-1:0] o1_2;
wire [d-1:0] o1_3;
wire [d-1:0] o2_2;
wire [d-1:0] o2_3;
wire [d-1:0] o3_3;
wire [d-1:0] t0_1_1;
wire [d-1:0] t0_2_2;
wire [d-1:0] t0_3_0;
wire [d-1:0] t0_3_1;
wire [d-1:0] t0_3_2;
wire [d-1:0] t0_3_3;
wire [d-1:0] t1_1_2;
wire [d-1:0] t1_2_2;
wire [d-1:0] t2_1_2;
wire [d-1:0] t3_1_2;
wire [d-1:0] t3_2_3;
wire [d-1:0] t4_1_2;
assign i0_0 = i0;
assign i1_0 = i1;
assign i2_0 = i2;
assign i3_0 = i3;
assign i4_0 = i4;
assign i5_0 = i5;
assign i6_0 = i6;
assign i7_0 = i7;
assign o0 = o0_3;
assign o1 = o1_3;
assign o2 = o2_3;
assign o3 = o3_3;




MSKxor #(.d(d)) comp_o0_0 (
    .out(o0_0),
    .ina(i0_0),
    .inb(i4_0)
);
MSKand_hpc3o #(.d(d)) comp_c1_1 (
    .out(c1_1),
    .rnd(rnd_0[0 +: 1*d*(d-1)]),
    .ina(i0_0),
    .ina_prev(i0_1),
    .inb(i4_0),
    .clk(clk)
);
MSKxor #(.d(d)) comp_t0_1_1 (
    .out(t0_1_1),
    .ina(i1_1),
    .inb(i5_1)
);
MSKxor #(.d(d)) comp_o1_1 (
    .out(o1_1),
    .ina(t0_1_1),
    .inb(c1_1)
);
MSKand_hpc2o_swapped #(.d(d)) comp_t1_1_2 (
    .out(t1_1_2),
    .rnd(rnd_0[1*(1*d*(d-1)) +: 1*d*(d-1)/2]),
    .ina(i1_0),
    .ina_prev(i1_1),
    .inb(i5_1),
    .clk(clk)
);
MSKand_hpc2o_swapped #(.d(d)) comp_t2_1_2 (
    .out(t2_1_2),
    .rnd(rnd_0[1*(1*d*(d-1))+1*(1*d*(d-1)/2) +: 1*d*(d-1)/2]),
    .ina(i5_0),
    .ina_prev(i5_1),
    .inb(c1_1),
    .clk(clk)
);
MSKand_hpc2o_swapped #(.d(d)) comp_t3_1_2 (
    .out(t3_1_2),
    .rnd(rnd_0[1*(1*d*(d-1))+2*(1*d*(d-1)/2) +: 1*d*(d-1)/2]),
    .ina(i1_0),
    .ina_prev(i1_1),
    .inb(c1_1),
    .clk(clk)
);
MSKxor #(.d(d)) comp_t4_1_2 (
    .out(t4_1_2),
    .ina(t1_1_2),
    .inb(t2_1_2)
);
MSKxor #(.d(d)) comp_c2_2 (
    .out(c2_2),
    .ina(t4_1_2),
    .inb(t3_1_2)
);
MSKxor #(.d(d)) comp_t0_2_2 (
    .out(t0_2_2),
    .ina(i2_2),
    .inb(i6_2)
);
MSKxor #(.d(d)) comp_o2_2 (
    .out(o2_2),
    .ina(t0_2_2),
    .inb(c2_2)
);
MSKand_hpc2o_swapped #(.d(d)) comp_t1_2_2 (
    .out(t1_2_2),
    .rnd(rnd_0[1*(1*d*(d-1))+3*(1*d*(d-1)/2) +: 1*d*(d-1)/2]),
    .ina(i2_0),
    .ina_prev(i2_1),
    .inb(i6_1),
    .clk(clk)
);
MSKand_hpc2o_swapped #(.d(d)) comp_t3_2_3 (
    .out(t3_2_3),
    .rnd(rnd_1[0 +: 1*d*(d-1)/2]),
    .ina(i2_1),
    .ina_prev(i2_2),
    .inb(c2_2),
    .clk(clk)
);
wire [d-1:0] c3_3_tof_late_0_0;
wire [d-1:0] c3_3_tof_late_0_1;
MSKxor #(.d(d)) comp_c3_3_tof_xor_late_0_0 (
    .ina(c3_3_tof_late_0_0),
    .inb(t3_2_3),
    .out(c3_3_tof_late_0_1)
);
assign c3_3 = c3_3_tof_late_0_1;
MSKand_hpc2o_swapped_tof #(.d(d)) comp_c3_3 (
    .inc(t1_2_2),
    .out(c3_3_tof_late_0_0),
    .rnd(rnd_1[1*(1*d*(d-1)/2) +: 1*d*(d-1)/2]),
    .ina(i6_1),
    .ina_prev(i6_2),
    .inb(c2_2),
    .clk(clk)
);
MSKxor #(.d(d)) comp_t0_3_0 (
    .out(t0_3_0),
    .ina(i3_0),
    .inb(i7_0)
);
MSKxor #(.d(d)) comp_o3_3 (
    .out(o3_3),
    .ina(t0_3_3),
    .inb(c3_3)
);
MSKreg #(.d(d)) reg_t0_3_0 (
    .in(t0_3_0),
    .out(t0_3_1),
    .clk(clk)
);
MSKreg #(.d(d)) reg_t0_3_1 (
    .in(t0_3_1),
    .out(t0_3_2),
    .clk(clk)
);
MSKreg #(.d(d)) reg_t0_3_2 (
    .in(t0_3_2),
    .out(t0_3_3),
    .clk(clk)
);
MSKreg #(.d(d)) reg_i0_0 (
    .in(i0_0),
    .out(i0_1),
    .clk(clk)
);
MSKreg #(.d(d)) reg_o0_0 (
    .in(o0_0),
    .out(o0_1),
    .clk(clk)
);
MSKreg #(.d(d)) reg_o0_1 (
    .in(o0_1),
    .out(o0_2),
    .clk(clk)
);
MSKreg #(.d(d)) reg_o0_2 (
    .in(o0_2),
    .out(o0_3),
    .clk(clk)
);
MSKreg #(.d(d)) reg_i5_0 (
    .in(i5_0),
    .out(i5_1),
    .clk(clk)
);
MSKreg #(.d(d)) reg_i6_0 (
    .in(i6_0),
    .out(i6_1),
    .clk(clk)
);
MSKreg #(.d(d)) reg_i6_1 (
    .in(i6_1),
    .out(i6_2),
    .clk(clk)
);
MSKreg #(.d(d)) reg_o1_1 (
    .in(o1_1),
    .out(o1_2),
    .clk(clk)
);
MSKreg #(.d(d)) reg_o1_2 (
    .in(o1_2),
    .out(o1_3),
    .clk(clk)
);
MSKreg #(.d(d)) reg_o2_2 (
    .in(o2_2),
    .out(o2_3),
    .clk(clk)
);
MSKreg #(.d(d)) reg_i1_0 (
    .in(i1_0),
    .out(i1_1),
    .clk(clk)
);
MSKreg #(.d(d)) reg_i2_0 (
    .in(i2_0),
    .out(i2_1),
    .clk(clk)
);
MSKreg #(.d(d),.count(1)) reg_i2_1 (
    .in(i2_1),
    .out(i2_2),
    .clk(clk)
);
endmodule
