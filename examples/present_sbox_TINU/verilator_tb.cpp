#include "Vcircuit.h"
#include "testbench.h"
#include <stdio.h>
#include <stdlib.h>

int sbox[16] = {0xC, 0x5, 0x6, 0xB, 0x9, 0x0, 0xA, 0xD, 0x3, 0xE, 0xF, 0x8, 0x4, 0x7, 0x1, 0x2
};

int main(int argc, char **argv) 
{
    Verilated::commandArgs(argc, argv);
    Testbench<Vcircuit> *tb = new Testbench<Vcircuit>();
    tb->opentrace("tmp.vcd");
    
    // tb->reset();
    
    
    // tb->tick();

    int X, Y;
    X = rand() & 0xF;
    X=X+1;
    Y = sbox[X];

    int X0, X1, X2;
    X0 = rand()  & 0xF;
    X1 = rand()  & 0xF;
    X2 = X^X0^X1;

    tb->m_core->sboxIn1 = X0;
    tb->m_core->sboxIn2 = X1;
    tb->m_core->sboxIn3 = X2;

    tb->tick();
    // tb->tick();
    // tb->tick();

    int Q0, Q1, Q2;

    Q0 = tb->m_core->share1 & 0xF;
    Q1 = tb->m_core->share2 & 0xF;
    Q2 = tb->m_core->share3 & 0xF;

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
    
    tb->closetrace();

}
