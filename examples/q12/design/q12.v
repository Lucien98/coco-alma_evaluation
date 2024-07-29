module q12 (
 input clk,
 input rst_i,
 input [3:0] in1,
 input [3:0] in2,

 output reg [3:0] out1,
 output reg [3:0] out2,
  
  );

  reg [2:1] a;
  reg [2:1] b;
  reg [2:1] c;
  reg [2:1] d;

  reg [4:1] y;
  reg [4:1] z;

  always @(*) begin
    a = {in2[3],in1[3]};
    b = {in2[2],in1[2]};
    c = {in2[1],in1[1]};
    d = {in2[0],in1[0]};
  end


  always @(*) begin
  
    out1[3] = a[1];
    out2[3] = a[2];

    y[1] = (a[1] & c[1]) ^ b[1];
    y[2] =  a[1] & c[2];
    y[3] = (a[2] & c[1]) ^ b[2];
    y[4] =  a[2] & c[2];
    z[1] = (a[1] & b[1]) ^ (a[1] & c[1]) ^ c[1];
    z[2] = (a[1] & b[2]) ^ (a[1] & c[2]);
    z[3] = (a[2] & b[1]) ^ (a[2] & c[1]);
    z[4] = (a[2] & b[2]) ^ (a[2] & c[2]) ^ c[2];
    
    out1[2] = y[1] ^ y[2];
    out2[2] = y[3] ^ y[4];
    
    out1[1] = z[1] ^ z[2];
    out2[1] = z[3] ^ z[4];
    
    out1[0] = d[1];
    out2[0] = d[2];
  end



endmodule