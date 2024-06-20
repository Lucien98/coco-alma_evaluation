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
    
    
    tb->tick();

    int X, Y;
    X = rand() & 0xF;
    Y = sbox[X];

    int X0, X1;
    X0 = rand()  & 0xF;
    X1 = X^X0;

    tb->m_core->input1 = X0;
    tb->m_core->input2 = X1;

    tb->tick();
    tb->tick();

    int Q0, Q1;

    Q0 = tb->m_core->output1 & 0xF;
    Q1 = tb->m_core->output2 & 0xF;

    int Q = Q0 ^ Q1;
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
