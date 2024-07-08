#include "Vcircuit.h"
#include "testbench.h"
#include <stdio.h>
#include <stdlib.h>

int sbox[16] = {0xB,0xF,0x3,0x2,0xA,0xC,0x9,0x1,0x6,0x7,0x8,0x0,0xE,0x5,0xD,0x4
};
int sbox_inverse_affine[16] = {0xB ,0x7 ,0x3 ,0x2 ,0xF ,0xD ,0x8 ,0x9 ,0xA ,0x6 ,0x4 ,0x0 ,0x5 ,0xE ,0xC ,0x1
};
int sbox_affine[16] = {0xB ,0xF ,0x3 ,0x2 ,0xA ,0xC ,0x9 ,0x1 ,0x6 ,0x7 ,0x8 ,0x0 ,0xE ,0x5 ,0xD ,0x4 
};

int main(int argc, char **argv) 
{
    Verilated::commandArgs(argc, argv);
    Testbench<Vcircuit> *tb = new Testbench<Vcircuit>();
    tb->opentrace("tmp.vcd");
    
    // tb->reset();
    
    
    // tb->tick();
    // tb->tick();

    int X, Y;
    for (int i = 0; i < 1; ++i)
    {
        X = 15-i;//rand() & 0xF;
        // X=X+1;
        Y = sbox[X];

        int X0, X1, X2;
        X0 = rand()  & 0xF;
        X1 = rand()  & 0xF;
        X2 = X^X0^X1;

        tb->m_core->in1 = X0;
        tb->m_core->in2 = X1;
        tb->m_core->in3 = X2;

        tb->tick();
        // tb->tick();
        // tb->tick();

        int Q0, Q1, Q2;

        Q0 = tb->m_core->out1 & 0xF;
        Q1 = tb->m_core->out2 & 0xF;
        Q2 = tb->m_core->out3 & 0xF;

        int Q = Q0 ^ Q1 ^Q2;
        printf("X: %d\n", X);
        printf("Q: %d\n", Q);
        printf("X0: %d\n", X0);
        printf("X1: %d\n", X1);
        printf("Q0: %d\n", Q0);
        printf("Q1: %d\n", Q1);

        if (Y != Q)
            printf("Error. \n\n");
        else
            printf("OK. \n\n");

        assert(Y == Q);

        tb->tick();
    }
        
    tb->closetrace();
}
