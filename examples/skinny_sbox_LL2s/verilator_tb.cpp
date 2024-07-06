#include "Vcircuit.h"
#include "testbench.h"
#include <stdio.h>
#include <stdlib.h>

// affine equivalent sbox?
// int sbox[16] = {0xC, 0xA, 0xD, 0x3, 0xE, 0xB, 0xF, 0x7, 0x8, 0x9, 0x1, 0x5, 0x0, 0x2, 0x4, 0x6
// };
int sbox[16] = {0xC, 0x6, 0x9, 0x0, 0x1, 0xA, 0x2, 0xB, 0x3, 0x8, 0x5, 0xD, 0x4, 0xE, 0x7, 0xF
};

int main(int argc, char **argv) 
{
    Verilated::commandArgs(argc, argv);
    Testbench<Vcircuit> *tb = new Testbench<Vcircuit>();
    tb->opentrace("tmp.vcd");
    
    // tb->reset();
    
    
    tb->tick();

    int X, Y, P, Q;

    for (int i = 0; i < 16; ++i)
    {
        X = i;//rand() & 0xF;
        Y = 15-i;//rand() & 0xF;

        P = sbox[X] & 0xF;
        Q = sbox[Y] & 0xF;

        int X0, X1, X2, Y0, Y1, Y2;
        X0 = rand()  & 0xF;
        X1 = rand()  & 0xF;
        X2 = X^X0^X1;
        Y0 = rand()  & 0xF;
        Y1 = rand()  & 0xF;
        Y2 = Y^Y0^Y1;

        tb->m_core->in1 = X0 ^ (Y0 << 4);
        tb->m_core->in2 = X1 ^ (Y1 << 4);
        tb->m_core->in3 = X2 ^ (Y2 << 4);

        tb->tick();
        tb->tick();

        int qp, p, q;

        qp = tb->m_core->out1 ^ tb->m_core->out2 ^ tb->m_core->out3;
        p = qp & 0xF;
        q = (qp >> 4) & 0xF;

        printf("P: %2d, ", P);
        printf("Q: %2d, ", Q);
        printf("p: %2d, ", p);
        printf("q: %2d: ", q);

        if (q != Q || p != P)
            printf("Error. \n");
        else
            printf("OK. \n");

        // assert(q==Q && p==P);
        tb->m_core->in1 = 0;//X0 ^ (Y0 << 4);
        tb->m_core->in2 = 0;//X1 ^ (Y1 << 4);
        tb->m_core->in3 = 0;//X2 ^ (Y2 << 4);

        tb->tick();
        tb->tick();
    }
        
    tb->closetrace();
}

