`timescale 1ns/1ns
`include "pipo.v"
`include "mux.v"
`include "subtractor.v"
`include "hello.v"

module hello_tb();
    // Declare a and b as signed registers
    reg clk, reset;
    reg signed [3:0] a,b; // Declaring inputs as signed
    wire signed [3:0] q; // Declaring output as signed

    hello Q1(q,a,b,clk,reset);

    initial begin
        clk=0;
        forever #5 clk=~clk;
    end

    initial begin
        $dumpfile("hello_tb.vcd");
        $dumpvars(0, hello_tb);

        // All values are within the 4-bit signed range (-8 to 7)

        a=5; b=-2; reset=1; // 5 and -2
        #10 reset=0;
        #20 a=-7; b=5;      // -7 and 5
        #20 a=6; b=3;       // 6 and 3
        #20 a=-6; b=-4;     // -6 and -4
        #20 a=7; b=-8;      // 7 and -8
        #20 a=0; b=0;       // Test equality
        #20 a=-1; b=1;      // -1 and 1

        $finish;
    end

endmodule