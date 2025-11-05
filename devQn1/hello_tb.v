`timescale 1ns/1ns
`include "dflipflop.v"
`include "hello.v"


module hello_tb();
    reg clk,resetn,si;
    wire [3:0]po;
    wire so,y;

    hello Q1(po,so,y,clk,resetn,si);

    initial begin
        clk=0;
        forever #5 clk=~clk;
    end

    initial begin
        $dumpfile("hello_tb.vcd");
        $dumpvars(0, hello_tb);

        resetn=0;

        #20 si=1;resetn=1;
        #10 si=0;
        #10 si=1;
        #10 si=1;
        #10 si=1;
        #10 si=1;
        #10 si=0;
        #10 si=0;
        #10 si=0;
        #10 si=1;
        #10 si=1;

        $finish;
    end
endmodule

