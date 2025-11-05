`timescale 1ns/1ns
`include "hello.v"

module hello_tb();
    reg clk, reset, si;
    wire so;

    hello #(4) Q1(so,clk,reset,si);

    initial begin
        clk=0;
        forever #5 clk=~clk;
    end

    initial begin
        $dumpfile("hello_tb.vcd");
        $dumpvars(0, hello_tb);

        si=1;reset=1;
        #10 reset=0;
        #10 si=1;
        #10 si=0;
        #10 si=0;
        #10 si=1;
        #10 si=0;
        #10 si=1;
        #10 si=0;
        #10 si=0;
        #10 si=0;
        #10 si=1;
        #10 si=1;

        $finish;
    end
endmodule

