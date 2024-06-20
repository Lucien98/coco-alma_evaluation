#include "Vcircuit.h"
#include "testbench.h"
#include <stdio.h>
#include <stdlib.h>

#define N 4

int sbox[32] = {0x0, 0x9, 0x12, 0xB, 0x5, 0xC, 0x16, 0xF, 0xA, 0x3, 0x18, 0x1, 0xD, 0x4, 0x1E, 0x7, 0x14, 0x15, 0x6, 0x17, 0x11, 0x10, 0x2, 0x13, 0x1A, 0x1B, 0x8, 0x19, 0x1D, 0x1C, 0xE, 0x1F
};

int main(int argc, char **argv) 
{
    Verilated::commandArgs(argc, argv);
    Testbench<Vcircuit> *tb = new Testbench<Vcircuit>();
    tb->opentrace("tmp.vcd");
    
    // tb->reset();
    
    
    tb->tick();

    int mask = 1;
    for (int i = 0; i < N-1; ++i)
    {
        mask ^= (1 << i+1);
    }
    printf("%d\n", mask);
    // shares of a,b,c,d,e
    int aa, bb, cc, dd, ee;

    aa = rand() & mask;
    bb = rand() & mask;
    cc = rand() & mask;
    dd = rand() & mask;
    ee = rand() & mask;

    printf("%d, %d, %d, %d, %d\n", aa, bb, cc, dd, ee);
    int a=0, b=0, c=0, d=0, e=0;

    for (int i = 0; i < N; ++i)
    {
        a ^= (aa >> i) & 0x01;
        a &= 0x01;
        printf("%d, ", a);

        b ^= (bb >> i) & 0x01;
        b &= 0x01;
        printf("%d, ", b);

        c ^= (cc >> i) & 0x01;
        c &= 0x01;
        printf("%d, ", c);

        d ^= (dd >> i) & 0x01;
        d &= 0x01;
        printf("%d, ", d);

        e ^= (ee >> i) & 0x01;
        e &= 0x01;
        printf("%d\n", e);

    }


    int X, Y;
    // a:lsb
    X = a*1 + b*2 + c*4 + d*8 + e*16;
    Y = sbox[X];

    tb->m_core->aa = aa;
    tb->m_core->bb = bb;
    tb->m_core->cc = cc;
    tb->m_core->dd = dd;
    tb->m_core->ee = ee;

    tb->tick();
    tb->tick();
    tb->tick();

    int ap, bp, cp, dp, ep;

    ap = tb->m_core->ap;
    bp = tb->m_core->bp;
    cp = tb->m_core->cp;
    dp = tb->m_core->dp;
    ep = tb->m_core->ep;

    int x=0, y=0, z=0, t=0, w=0;

    for (int i = 0; i < N*N-1; ++i)
    {
        x ^= (ap >> i) & 0x01;
        x &= 0x01;

        y ^= (bp >> i) & 0x01;
        y &= 0x01;

        z ^= (cp >> i) & 0x01;
        z &= 0x01;

        t ^= (dp >> i) & 0x01;
        t &= 0x01;

        w ^= (ep >> i) & 0x01;
        w &= 0x01;

    }

    int Q = 1*x + 2*y + 4*z + 8*t + 16*w;


    printf("X: %d\n", X);
    printf("Y: %d\n", Y);
    printf("Q: %d\n", Q);

    if (Y != Q)
        printf("Error. \n\n");
    else
        printf("OK. \n\n");

    assert(Y == Q);

    tb->tick();
    
    tb->closetrace();
}
