module InAffC(
    input  [3:0] A,
    output [3:0] Z
    );
    assign Z[0] = A[1];
    assign Z[1] = A[0];
    assign Z[2] = A[2];
    assign Z[3] = ~ A[0] ^ A[3];
endmodule
