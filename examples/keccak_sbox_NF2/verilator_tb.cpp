#include "Vcircuit.h"
#include "testbench.h"
#include <stdio.h>
#include <stdlib.h>

#define N 3

int sbox[32] = {0x0, 0x9, 0x12, 0xB, 0x5, 0xC, 0x16, 0xF, 0xA, 0x3, 0x18, 0x1, 0xD, 0x4, 0x1E, 0x7, 0x14, 0x15, 0x6, 0x17, 0x11, 0x10, 0x2, 0x13, 0x1A, 0x1B, 0x8, 0x19, 0x1D, 0x1C, 0xE, 0x1F
};

int main(int argc, char **argv) 
{
    Verilated::commandArgs(argc, argv);
    Testbench<Vcircuit> *tb = new Testbench<Vcircuit>();
    tb->opentrace("tmp.vcd");
    
    // tb->reset();
    
    
    tb->tick();
    tb->tick();

    int X, Y;
    X = (rand() + 2) & 0x1F;
    Y = sbox[X];

    int XShare[N];
    XShare[N-1] = X;
    for (int i = 0; i < N - 1; ++i)
    {
        XShare[i] = rand() & 0x1F;
        XShare[N-1] ^= XShare[i];
    }

    tb->m_core->in1 = XShare[0] & 0x1F;
    tb->m_core->in2 = XShare[1] & 0x1F;
    tb->m_core->in3 = XShare[2] & 0x1F;

    tb->tick();
    tb->tick();
    tb->tick();

    int QShare[N];

    // int QShares = tb->m_core->OutputxDO;
    QShare[0] = tb->m_core->out1;
    QShare[1] = tb->m_core->out2;
    QShare[2] = tb->m_core->out3;

    int Q = 0;

    for (int i = 0; i < N; ++i)
    {
        Q ^= QShare[i];
    }

    for (int i = 0; i < N; ++i)
    {
        printf("X[%d]: %d\n", i, XShare[i]);
    }

    for (int i = 0; i < N; ++i)
    {
        printf("Y[%d]: %d\n", i, QShare[i]);
    }

    printf("X: %d\n", X);
    printf("Y: %d\n", Y);
    printf("Q: %d\n", Q);

    if (Y != Q)
        printf("Error. \n\n");
    else
        printf("OK. \n\n");

    // assert(Y == Q);

    tb->tick();
    
    tb->closetrace();
}
