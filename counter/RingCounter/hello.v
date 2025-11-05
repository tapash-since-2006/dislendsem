module hello(q, clk, resetn);
    input clk, resetn;
    output [3:0] q;
    wire [3:0] d;

    assign d[3] = q[0];
    assign d[2] = q[3];
    assign d[1] = q[2];
    assign d[0] = q[1];

    dflipflop D0(q[0], d[0], clk, resetn, 1'b0);
    dflipflop D1(q[1], d[1], clk, resetn, 1'b0);
    dflipflop D2(q[2], d[2], clk, resetn, 1'b0);
    dflipflop D3(q[3], d[3], clk, resetn, 1'b1);
endmodule
