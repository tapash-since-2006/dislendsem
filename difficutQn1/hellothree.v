module hellothree(q, d, clk, reset);
    input [3:0] d;       
    input clk, reset;    
    output [3:0] q;      

    dflipflop D0(q[0], d[0], clk, reset);
    dflipflop D1(q[1], d[1], clk, reset);
    dflipflop D2(q[2], d[2], clk, reset);
    dflipflop D3(q[3], d[3], clk, reset);
endmodule