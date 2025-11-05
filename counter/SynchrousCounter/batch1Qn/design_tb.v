`timescale 1ns/1ns
`include "tflipflop.v"
`include "hello.v"

module design_tb;
    reg clk, reset;
    wire [3:0] q;
    wire y;

    hello Q1(y, q, clk, reset);

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("design_tb.vcd");
        $dumpvars(0, design_tb);

        reset = 1;
        #10 reset = 0;

        #200 $finish;
    end
endmodule
