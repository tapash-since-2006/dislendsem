`timescale 1ns/1ns
`include "dflipflop.v"
`include "hello.v"

module hello_tb;
    reg clk, resetn;
    wire [3:0] q;

    hello uut(q, clk, resetn);

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        $dumpfile("hello_tb.vcd");
        $dumpvars(0, hello_tb);

        resetn = 0;   
        #10 resetn = 1; 

        #200;
        $finish;
    end
endmodule
