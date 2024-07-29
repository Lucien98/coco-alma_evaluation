#include "Vcircuit.h"
#include "testbench.h"
#include <stdio.h>
#include <stdlib.h>

int sbox_affine[16] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0xc, 0xd, 0xe, 0xf, 0xa, 0xb
};

int main(int argc, char **argv) 
{
    Verilated::commandArgs(argc, argv);
    Testbench<Vcircuit> *tb = new Testbench<Vcircuit>();
    tb->opentrace("tmp.vcd");
    
    int X, Y;
    for (int i = 0; i < 1; ++i)
    {
        X = i;//rand() & 0xF;
        Y = sbox_affine[X];

        int X0, X1;
        X0 = rand()  & 0xF;
        X1 = X^X0;

        tb->m_core->in1 = X0;
        tb->m_core->in2 = X1;

        tb->tick();
        tb->tick();

        int Q0, Q1;

        Q0 = tb->m_core->out1 & 0xF;
        Q1 = tb->m_core->out2 & 0xF;

        int Q = Q0 ^ Q1;
        printf("X: %d, ", X);
        printf("Q: %d, ", Q);

        if (Y != Q)
            printf("Error. \n");
        else
            printf("OK. \n");

        assert(Y == Q);

        tb->tick();

    }
    tb->closetrace();
}
