module hello(q, clk, reset);
    output [3:0] q;
    input clk, reset;

    tflipflop t0(q[0], 1'b1, clk, reset);      
    tflipflop t1(q[1], 1'b1, ~q[0], reset);
    tflipflop t2(q[2], 1'b1, ~q[1], reset);
    tflipflop t3(q[3], 1'b1, ~q[2], reset);
endmodule