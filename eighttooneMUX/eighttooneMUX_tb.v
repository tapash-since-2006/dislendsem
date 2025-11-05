`timescale 1ns/1ns
`include "twotooneMUX.v"
`include "fourtooneMUX.v"
`include "eighttooneMUX.v"

module eighttooneMUX_tb();
    reg [7:0]i;
    reg [2:0]s;
    wire y;

    eighttooneMUX Q1(y,i,s);

    initial begin
        $dumpfile("eighttooneMUX_tb.vcd");
        $dumpvars(0, eighttooneMUX_tb);

        i = 8'b11100101; s = 4'b0000; #10;
        s = 4'b0001; #10;
        s = 4'b0010; #10;
        s = 4'b0011; #10;
        s = 4'b0100; #10;
        s = 4'b0101; #10;
        s = 4'b0110; #10;
        s = 4'b0111; #10;

        $finish;
    end
endmodule