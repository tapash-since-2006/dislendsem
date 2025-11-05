`timescale 1ns/1ns
`include "jkflipflop.v"
`include "hello.v"

module hello_tb();
    reg clk, reset;
    wire [4:0] q;
    wire flag;

    hello U1(clk, reset, q, flag);

    initial begin
    clk = 0;
    forever #5 clk = ~clk; 
    end

    initial begin
        $dumpfile("hello_tb.vcd");
        $dumpvars(0, hello_tb);

        reset = 1;
        #10 reset = 0;  

        #500 $finish; 
    end
endmodule
