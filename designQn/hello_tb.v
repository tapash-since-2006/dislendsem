`timescale 1ns/1ns
`include "hello.v"

module hello_tb();
    reg [2:0] A, B;
    reg clk, reset;
    wire [3:0] Y;

    hello Q1(A, B, clk, reset, Y);

    initial begin 
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin

        $dumpfile("hello_tb.vcd");
        $dumpvars(0, hello_tb);


        reset = 1;
        A = 3'b000;
        B = 3'b000;
        #12 reset = 0;

        // Test 1
        A = 3'b010; // 2
        B = 3'b001; // 1
        #40;

        // Test 2
        A = 3'b101; // 5
        B = 3'b011; // 3
        #40;

        // Test 3
        A = 3'b111; // 7
        B = 3'b010; // 2
        #40;

        // Test 4
        A = 3'b011; // 3
        B = 3'b110; // 6
        #40;

        $finish;
    end
endmodule
