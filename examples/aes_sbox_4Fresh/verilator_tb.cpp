#include "Vcircuit.h"
#include "testbench.h"
#include <stdio.h>
#include <stdlib.h>

int sbox[256] = {0x00, 0xFF, 0xEF, 0xF9, 0x34, 0x12, 0x16, 0xDC, 0x90, 0x2D, 0x04, 0x6B, 0x22, 0x66, 0xE7, 0xBC, 
0xC8, 0xA3, 0xCA, 0xAC, 0x26, 0xAD, 0x01, 0x65, 0xB2, 0x64, 0xA6, 0xE3, 0x0F, 0xF3, 0xB8, 0x8B, 
0x1A, 0x20, 0x1B, 0x2E, 0xC5, 0x84, 0x63, 0x9D, 0x94, 0xA0, 0xD9, 0x36, 0xBA, 0x72, 0xC3, 0xC2, 
0x7A, 0x8D, 0x79, 0x89, 0x87, 0x4C, 0x29, 0x5A, 0x78, 0xC4, 0xF2, 0xDF, 0x9E, 0x7D, 0x4D, 0xBE, 
0x3F, 0xF0, 0x6D, 0xD6, 0x85, 0x45, 0xAF, 0xF7, 0xBD, 0x80, 0x35, 0x1E, 0x3A, 0x8C, 0x6F, 0xF6, 
0xEE, 0x33, 0x7E, 0xCB, 0x7B, 0x73, 0x4F, 0xFC, 0x41, 0x9B, 0x5B, 0xD1, 0x44, 0x11, 0xFE, 0x9F, 
0x60, 0x9A, 0xB4, 0x75, 0x05, 0x42, 0x92, 0xA5, 0x50, 0x24, 0x2F, 0xFD, 0xEC, 0x86, 0x0D, 0xE5, 
0xBF, 0xF5, 0x07, 0xE6, 0x48, 0x5C, 0x82, 0x32, 0x0A, 0x49, 0x23, 0x28, 0x95, 0x71, 0x67, 0x31, 
0xCE, 0x68, 0x97, 0x98, 0xF8, 0x1F, 0x03, 0x93, 0x8F, 0xF1, 0xAE, 0xD5, 0x06, 0xA9, 0xD4, 0xEB, 
0x02, 0xA1, 0x13, 0x76, 0x2A, 0x38, 0x19, 0xE0, 0x52, 0xC9, 0x0E, 0x91, 0x27, 0xAB, 0x6E, 0x70, 
0x8E, 0xC1, 0xD3, 0x3D, 0x46, 0x2B, 0x7F, 0xFA, 0xDA, 0x62, 0xE1, 0x53, 0x4A, 0x4E, 0x8A, 0xA8, 
0x88, 0x99, 0x96, 0x47, 0xB7, 0x37, 0x40, 0xB6, 0x14, 0xB9, 0x61, 0xCD, 0x55, 0xAA, 0xB0, 0x6C, 
0x5F, 0xFB, 0x2C, 0x3C, 0x83, 0xA2, 0x18, 0xDE, 0x9C, 0x25, 0xED, 0x81, 0x17, 0x59, 0xE2, 0xB1, 
0xE9, 0xD7, 0x4B, 0x57, 0x15, 0x7C, 0x30, 0x39, 0x51, 0xC7, 0xEA, 0x5D, 0xA7, 0xD8, 0xD0, 0x5E, 
0xDD, 0x77, 0x0B, 0xC6, 0x43, 0x21, 0xB5, 0x1D, 0x09, 0xD2, 0xF4, 0xCF, 0xCC, 0xBB, 0x69, 0x74, 
0xE4, 0xA4, 0xB3, 0x3B, 0x08, 0xDB, 0x56, 0x10, 0x54, 0x58, 0x3E, 0x6A, 0x1C, 0xE8, 0x0C, 0xC0, 
};


int main(int argc, char **argv) 
{
    Verilated::commandArgs(argc, argv);
    Testbench<Vcircuit> *tb = new Testbench<Vcircuit>();
    tb->opentrace("tmp.vcd");
    
    // tb->reset();
    
    
    // tb->tick();

    int X, Y;
    X = rand() & 0xFF;
    Y = sbox[X];

    int X0, X1;
    X0 = rand()  & 0xFF;
    X1 = X^X0;

    tb->m_core->h0g0f0e0d0c0b0a0 = X0;
    tb->m_core->h1g1f1e1d1c1b1a1 = X1;

    tb->tick();
    tb->tick();
    tb->tick();
    tb->tick();
    tb->tick();
    // tb->tick();

    int Q0, Q1;

    Q0 = tb->m_core->v0u0s0r0t0z0y0x0 & 0xFF;
    Q1 = tb->m_core->v1u1s1r1t1z1y1x1 & 0xFF;

    int Q = Q0 ^ Q1;
    printf("X: %2x\n", X);
    printf("Y: %2x\n", Y);
    printf("Q: %2x\n", Q);
    // printf("X0: %d %2x\n", X0, X0);
    // printf("X1: %d %2x\n", X1, X1);
    // printf("Q0: %d %2x\n", Q0, Q0);
    // printf("Q1: %d %2x\n", Q1, Q1);

    if (Y != Q)
        printf("Error. \n\n");
    else
        printf("OK. \n\n");

    assert(Y == Q);
    tb->tick();
    
    tb->closetrace();
}
