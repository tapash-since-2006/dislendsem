
module helloone(q, clk, reset);
    input clk, reset;
    output [3:0] q;
    wire [3:0] q_internal;

    wire j0, k0, j1, k1, j2, k2, j3, k3;

    assign j0 = 1'b1;                 
    assign k0 = 1'b1;
    assign j1 = q_internal[0];        
    assign k1 = q_internal[0];
    assign j2 = q_internal[0] & q_internal[1];   
    assign k2 = q_internal[0] & q_internal[1];
    assign j3 = q_internal[0] & q_internal[1] & q_internal[2];
    assign k3 = q_internal[0] & q_internal[1] & q_internal[2];

    jkflipflop FF0(q_internal[0], j0, k0, clk, reset);
    jkflipflop FF1(q_internal[1], j1, k1, clk, reset);
    jkflipflop FF2(q_internal[2], j2, k2, clk, reset);
    jkflipflop FF3(q_internal[3], j3, k3, clk, reset);

    assign q = q_internal;

endmodule
