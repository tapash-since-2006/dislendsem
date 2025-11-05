`timescale 1ns/1ns
`include "ring_counter.v"

module ring_counter_tb;
    reg clk, resetn;
    wire [3:0] q;

    ring_counter uut(q, clk, resetn);

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        resetn = 0;
        #10 resetn = 1;
        #100 $stop;
    end

    initial begin
        $dumpfile("ring_counter.vcd");
        $dumpvars(0, ring_counter_tb);
        $monitor("Time=%0t | q=%b", $time, q);
    end
endmodule
