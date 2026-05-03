// A2B_1order.v
// 一阶算术转布尔掩码转换
// 输入：算术份额 a0, a1 (4-bit)，满足 A = a0 + a1 (mod 16)
// 输出：布尔份额 b0, b1 (4-bit)，满足 A = b0 ^ b1

module A2B (
    input clk,
    input rst_n,
    input [3:0] a0, a1,           // 算术份额输入
    output [3:0] b0, b1,          // 布尔份额输出
    // 随机数输入（每个 refresh 需要独立的随机数）
    input [3:0] rnd_refresh0,     // 刷新 a0 用的随机数
    input [3:0] rnd_refresh1,     // 刷新 a1 用的随机数
    // RC3_mod16 需要的随机数（直接连接外部随机源）
    input [95:0] rnd_0,           // RC3_mod16 的 rnd_0 端口
    input [15:0] rnd_1            // RC3_mod16 的 rnd_1 端口
);

    // ============================================
    // 步骤1: 将算术份额 refresh 成布尔份额
    // 对 a0: 生成布尔份额 (s0, s1) 满足 a0 = s0 ^ s1
    // 方法：选随机 r，s0 = a0 ^ r，s1 = r
    // ============================================
    wire [3:0] s0_a0, s1_a0;      // a0 的两个布尔份额
    wire [3:0] s0_a1, s1_a1;      // a1 的两个布尔份额
    
    assign s1_a0 = rnd_refresh0;
    assign s0_a0 = a0 ^ s1_a0;
    
    assign s1_a1 = rnd_refresh1;
    assign s0_a1 = a1 ^ s1_a1;
    
    // ============================================
    // 步骤2: 用 SecAdd 计算 A = a0 + a1
    // RC3_mod16 输入：前 4 个是第一个加数的份额，后 4 个是第二个加数的份额
    // 第一个加数 = a0，第二个加数 = a1
    // ============================================
    wire [1:0] add_out0, add_out1, add_out2, add_out3;
    
    RC3mod_16 #(.d(2)) secadd_inst (
        .clk(clk),
        .i0({s0_a0[0], s1_a0[0]}),   // LSB of a0
        .i1({s0_a0[1], s1_a0[1]}),
        .i2({s0_a0[2], s1_a0[2]}),
        .i3({s0_a0[3], s1_a0[3]}),
        .i4({s0_a1[0], s1_a1[0]}),   // LSB of a1
        .i5({s0_a1[1], s1_a1[1]}),
        .i6({s0_a1[2], s1_a1[2]}),
        .i7({s0_a1[3], s1_a1[3]}),
        .o0(add_out0),
        .o1(add_out1),
        .o2(add_out2),
        .o3(add_out3),
        .rnd_0(rnd_0),
        .rnd_1(rnd_1)
    );
    
    // ============================================
    // 步骤3: 输出布尔份额
    // add_out0[0] ^ add_out0[1] = (a0 + a1) 的第 0 位
    // 可以直接输出 add_out 作为布尔份额
    // ============================================
    assign b0 = {add_out3[0], add_out2[0], add_out1[0], add_out0[0]};
    assign b1 = {add_out3[1], add_out2[1], add_out1[1], add_out0[1]};

endmodule