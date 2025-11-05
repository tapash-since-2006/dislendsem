`timescale 1ns/1ns
`include "dflipflop.v"
`include "tflipflop.v"
`include "hello.v"
`include "hellotwo.v"
`include "top.v"

module hello_tb();
    reg clk,reset,load;
    reg [3:0]pi;
    wire so;
    wire [3:0]q;

    top Q1(q,so,clk,reset,load,pi);

    initial begin
        clk=0;
        forever #5 clk=~clk;
    end

    initial begin
    $dumpfile("hello_tb.vcd");
    $dumpvars(0, hello_tb);

    pi = 4'b0000; load = 0; reset = 1;
    #10 reset = 0;

    load = 1; pi = 4'b1011; #10;
    load = 0;               
    #80;

    load = 1; pi = 4'b1100; #10;
    load = 0;               
    #80;

    $finish;
end

endmodule