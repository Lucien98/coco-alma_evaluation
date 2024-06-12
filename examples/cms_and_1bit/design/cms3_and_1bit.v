//---------------------------------------------------

module cms_and_3rdorder (clk_i, rst_i, 
        X0_i, X1_i, X2_i, X3_i,
        Y0_i, Y1_i, Y2_i, Y3_i,
        Z0_i, Z1_i, Z2_i, Z3_i, Z4_i, Z5_i,
        Z6_i, Z7_i, Z8_i, Z9_i, Z10_i, Z11_i,
        Z12_i, Z13_i, Z14_i, Z15_i,
        Q0_o, Q1_o, Q2_o, Q3_o);

    input clk_i; 
    input rst_i;
    input [0:0] X0_i, X1_i, X2_i, X3_i;
    input [0:0] Y0_i, Y1_i, Y2_i, Y3_i;
    input [0:0] Z0_i, Z1_i, Z2_i, Z3_i, Z4_i, Z5_i, Z6_i, Z7_i, Z8_i, Z9_i, Z10_i, Z11_i, Z12_i, Z13_i, Z14_i, Z15_i;
    output [0:0] Q0_o, Q1_o, Q2_o, Q3_o; 

    //Same domain
    wire [0:0] AX_AY;
    wire [0:0] BX_BY;
    wire [0:0] CX_CY;
    wire [0:0] DX_DY;

    assign AX_AY = X0_i & Y0_i;
    assign BX_BY = X1_i & Y1_i;
    assign CX_CY = X2_i & Y2_i;
    assign DX_DY = X3_i & Y3_i;

    //Cross domain + resharing
    wire [0:0] AX_BY;
    wire [0:0] AX_CY;
    wire [0:0] AX_DY;

    wire [0:0] BX_AY;
    wire [0:0] BX_CY;
    wire [0:0] BX_DY;

    wire [0:0] CX_AY;
    wire [0:0] CX_BY;
    wire [0:0] CX_DY;

    wire [0:0] DX_AY;
    wire [0:0] DX_BY;
    wire [0:0] DX_CY;

    assign AX_BY = X0_i & Y1_i;
    assign AX_CY = X0_i & Y2_i;
    assign AX_DY = X0_i & Y3_i;
    
    assign BX_AY = X1_i & Y0_i;
    assign BX_CY = X1_i & Y2_i;
    assign BX_DY = X1_i & Y3_i;

    assign CX_AY = X2_i & Y0_i;
    assign CX_BY = X2_i & Y1_i;
    assign CX_DY = X2_i & Y3_i;

    assign DX_AY = X3_i & Y0_i;
    assign DX_BY = X3_i & Y1_i;
    assign DX_CY = X3_i & Y2_i;

    reg [0:0] AX_AY_q;
    reg [0:0] BX_BY_q;
    reg [0:0] CX_CY_q;
    reg [0:0] DX_DY_q;


    reg [0:0] AX_BY_q;
    reg [0:0] AX_CY_q;
    reg [0:0] AX_DY_q;

    reg [0:0] BX_AY_q;
    reg [0:0] BX_CY_q;
    reg [0:0] BX_DY_q;

    reg [0:0] CX_AY_q;
    reg [0:0] CX_BY_q;
    reg [0:0] CX_DY_q;

    reg [0:0] DX_AY_q;
    reg [0:0] DX_BY_q;
    reg [0:0] DX_CY_q;

    

    always @(posedge clk_i) begin
        if(rst_i) begin

			AX_AY_q <= 1'b0;
            AX_BY_q <= 1'b0;
            AX_CY_q <= 1'b0;
            AX_DY_q <= 1'b0;

			BX_BY_q <= 1'b0;
            BX_AY_q <= 1'b0;
            BX_CY_q <= 1'b0;
            BX_DY_q <= 1'b0;

			CX_CY_q <= 1'b0;
            CX_AY_q <= 1'b0;
            CX_BY_q <= 1'b0;
            CX_DY_q <= 1'b0;

			DX_DY_q <= 1'b0;
            DX_AY_q <= 1'b0;
            DX_BY_q <= 1'b0;
            DX_CY_q <= 1'b0;

        end else begin
			AX_AY_q <= AX_AY ^ Z0_i ^ Z15_i;
            AX_BY_q <= AX_BY ^ Z1_i ^ Z0_i;
            AX_CY_q <= AX_CY ^ Z2_i ^ Z1_i;
            AX_DY_q <= AX_DY ^ Z3_i ^ Z2_i;

			BX_BY_q <= BX_BY ^ Z4_i ^ Z3_i;
            BX_AY_q <= BX_AY ^ Z5_i ^ Z4_i;
            BX_CY_q <= BX_CY ^ Z6_i ^ Z5_i;
            BX_DY_q <= BX_DY ^ Z7_i ^ Z6_i;

			CX_CY_q <= CX_CY ^ Z8_i ^ Z7_i;
            CX_AY_q <= CX_AY ^ Z9_i ^ Z8_i;
            CX_BY_q <= CX_BY ^ Z10_i ^ Z9_i;
            CX_DY_q <= CX_DY ^ Z11_i ^ Z10_i;

			DX_DY_q <= DX_DY ^ Z12_i ^ Z11_i;
            DX_AY_q <= DX_AY ^ Z13_i ^ Z12_i;
            DX_BY_q <= DX_BY ^ Z14_i ^ Z13_i;
            DX_CY_q <= DX_CY ^ Z15_i ^ Z14_i;
        end
    end

    assign Q0_o = AX_BY_q ^ AX_CY_q ^ AX_DY_q ^ AX_AY_q;
    assign Q1_o = BX_AY_q ^ BX_CY_q ^ BX_DY_q ^ BX_BY_q;
    assign Q2_o = CX_AY_q ^ CX_BY_q ^ CX_DY_q ^ CX_CY_q;
    assign Q3_o = DX_AY_q ^ DX_BY_q ^ DX_CY_q ^ DX_DY_q;


endmodule