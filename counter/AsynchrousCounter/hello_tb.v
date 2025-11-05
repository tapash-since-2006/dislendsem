`timescale 1ns/1ns
`include "tflipflop.v"
`include "hello.v"


module hello_tb();
    reg clk, reset;
    wire [3:0] q;

    hello Q1(q, clk, reset);

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("hello_tb.vcd");
        $dumpvars(0, hello_tb);

        reset = 1; #10;     
        reset = 0;          

        #200;               
        $finish;
    end
endmodule
