// test_a2b.cpp
#include "Vcircuit.h"
#include "testbench.h"
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <time.h>

// 辅助函数：生成随机数向量
void gen_random_rnd(uint32_t *rnd_0, uint16_t *rnd_1) {
    // rnd_0 是 96 位，分成 6 个 16 位
    for (int i = 0; i < 6; i++) {
        rnd_0[i] = rand() & 0xFFFF;
    }
    *rnd_1 = rand() & 0xFFFF;
}

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);
    Testbench<Vcircuit> *tb = new Testbench<Vcircuit>();
    tb->opentrace("tmp.vcd");
    
    srand(time(NULL));
    
    // 预先生成随机数向量
    uint32_t rnd_0[6];
    uint16_t rnd_1;
    
    int pass_count = 0;
    int total_tests = 1000;
    
    for (int test = 0; test < total_tests; test++) {
        // 生成随机 A 和随机算术份额 A0
        uint8_t A = rand() & 0xF;
        uint8_t A0 = rand() & 0xF;
        uint8_t A1 = (A - A0) & 0xF;  // 模 16 减法
        
        // 生成 refresh 随机数
        uint8_t r_refresh0 = rand() & 0xF;
        uint8_t r_refresh1 = rand() & 0xF;
        
        // 生成 RC3_mod16 需要的随机数
        gen_random_rnd(rnd_0, &rnd_1);
        
        // 设置输入
        tb->m_core->a0 = A0;
        tb->m_core->a1 = A1;
        tb->m_core->rnd_refresh0 = r_refresh0;
        tb->m_core->rnd_refresh1 = r_refresh1;
        tb->m_core->rst_n = 1;
        
        // 设置 RC3_mod16 的随机数（需要通过 Verilator 的顶层端口）
        // 注意：需要根据实际的 Vcircuit 端口名调整
        // tb->m_core->rnd_0 = (rnd_0[5] << 80) | (rnd_0[4] << 64) | 
        //                     (rnd_0[3] << 48) | (rnd_0[2] << 32) | 
        //                     (rnd_0[1] << 16) | rnd_0[0];
        // tb->m_core->rnd_1 = rnd_1;
        
        // 向 RC3_mod16 的逻辑需要等待 3+ 周期
        // 初始进入需要 3 周期稳定，另外 refresh 和 加法器总共需要约 6 周期
        for (int i = 0; i < 10; i++) {
            tb->tick();
        }
        
        uint8_t B0 = tb->m_core->b0 & 0xF;
        uint8_t B1 = tb->m_core->b1 & 0xF;
        uint8_t B = B0 ^ B1;
        
        if (B != A) {
            printf("Test %d FAILED: A=%02X, A0=%02X, A1=%02X, B0=%02X, B1=%02X, B=%02X\n",
                   test, A, A0, A1, B0, B1, B);
        } else {
            pass_count++;
            if (test % 100 == 99) {
                printf("Progress: %d/%d passed\n", pass_count, test+1);
            }
        }
    }
    
    printf("\n========================================\n");
    printf("Tests passed: %d / %d\n", pass_count, total_tests);
    printf("========================================\n");
    
    assert(pass_count == total_tests);
    
    tb->closetrace();
    printf("All tests passed!\n");
    return 0;
}