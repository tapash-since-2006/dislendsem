module hello(
    input clk,
    input reset,
    output [4:0] q,
    output flag
);
    wire q0, q1, q2, q3, q4;
    wire flag_ff;

    wire count17 = q4 & ~q3 & ~q2 & ~q1 & q0;

    jkflipflop FF0(.j(1'b1), .k(1'b1), .clk(clk), .reset(reset | count17), .q(q0));
    jkflipflop FF1(.j(q0), .k(q0), .clk(clk), .reset(reset | count17), .q(q1));
    jkflipflop FF2(.j(q1 & q0), .k(q1 & q0), .clk(clk), .reset(reset | count17), .q(q2));
    jkflipflop FF3(.j(q2 & q1 & q0), .k(q2 & q1 & q0), .clk(clk), .reset(reset | count17), .q(q3));
    jkflipflop FF4(.j(q3 & q2 & q1 & q0), .k(q3 & q2 & q1 & q0), .clk(clk), .reset(reset | count17), .q(q4));

    assign q = {q4, q3, q2, q1, q0};

    wire count_ge8 = q3 | (q4);  
    jkflipflop FLAG(.j(count_ge8), .k(count_ge8), .clk(clk), .reset(reset), .q(flag_ff));

    assign flag = flag_ff;
endmodule
