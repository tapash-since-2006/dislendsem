module hellotwo(q, enable, clk, reset);
    input enable, clk, reset;
    output [3:0] q;
    wire [3:0] t;

    assign t[0] = enable & 1'b1;                 
    assign t[1] = enable & q[0];
    assign t[2] = enable & q[0] & q[1];
    assign t[3] = enable & q[0] & q[1] & q[2];

    tflipflop tff0(q[0], t[0], clk, reset);
    tflipflop tff1(q[1], t[1], clk, reset);
    tflipflop tff2(q[2], t[2], clk, reset);
    tflipflop tff3(q[3], t[3], clk, reset);
endmodule