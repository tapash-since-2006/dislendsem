

`timescale 1ns/1ns
`include "jkflipflop.v"
`include "dflipflop.v"
`include "helloone.v"
`include "hellotwo.v"
`include "hellothree.v"
`include "top.v"

module top_tb();
    reg clk, reset;
    wire [3:0] q_out;
    wire valid;

    top DUT(clk, reset, q_out, valid);

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);

        reset = 1;
        #10 reset = 0;

        #200;
        $finish;
    end
endmodule
d