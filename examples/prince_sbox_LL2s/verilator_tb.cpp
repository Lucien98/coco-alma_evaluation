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

    int X, Y, P, Q;
    X = rand() & 0xF;
    Y = rand() & 0xF;

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
    // tb->tick();
    // tb->tick();

    int qp, p, q;

    qp = tb->m_core->out1 ^ tb->m_core->out2 ^ tb->m_core->out3;
    p = qp & 0xF;
    q = (qp >> 4) & 0xF;

    printf("P: %d\n", P);
    printf("Q: %d\n", Q);
    printf("p: %d\n", p);
    printf("q: %d\n", q);

    if (q != Q || p != P)
        printf("Error. \n\n");
    else
        printf("OK. \n\n");

    assert(q==Q && p==P);

    tb->tick();
    
    tb->closetrace();
}
