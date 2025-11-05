`timescale 1ns/1ns
`include "tflipflop.v"
`include "hello.v"
`include "helloone.v"
`include "top.v"

module hello_tb();
    reg [3:0]a,b;
    reg clk,reset;
    wire [1:0] q;

    top Q1(q,a,b,clk,reset);

    initial begin
        clk=0;
        forever #5 clk=~clk;
    end

    initial begin
        $dumpfile("hello_tb.vcd");
        $dumpvars(0, hello_tb);

        a=10;b=5;reset=1;

        #10 reset=0;
        #10 a=11; b=9;
        #10 a=9;b=1;
        #10 a=10;b=1;
        #10 a=7;b=5;

        $finish;

    end
endmodule