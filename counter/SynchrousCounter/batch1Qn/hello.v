module hello(y,q,clk,reset);
    input clk, reset;
    output reg y;
    output [3:0] q;
    wire [3:0] t;

    assign t[0] = 1'b1;                 
    assign t[1] = q[0];
    assign t[2] = q[0] & q[1];
    assign t[3] = q[0] & q[1] & q[2];

    tflipflop tff0(q[0], t[0], clk, reset);
    tflipflop tff1(q[1], t[1], clk, reset);
    tflipflop tff2(q[2], t[2], clk, reset);
    tflipflop tff3(q[3], t[3], clk, reset);

    always @(*) begin
        if (q == 4'b0011 || q == 4'b1001)
            y = 1'b1;
        else
            y = 1'b0;
    end
endmodule
