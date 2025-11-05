`timescale 1ns/1ns
`include "subtractor_4bit.v"

module subtractor_4bit_tb;
    reg [3:0] a, b;
    wire [3:0] diff;
    wire cout;

    subtractor_4bit uut(diff, cout, a, b);

    initial begin
        $dumpfile("subtractor_4bit_tb.vcd");
        $dumpvars(0, subtractor_4bit_tb);

        a = 4'd9; b = 4'd3; #10;   
        a = 4'd7; b = 4'd9; #10;   
        a = 4'd5; b = 4'd5; #10;   
        a = 4'd12; b = 4'd6; #10;  

        $finish;
    end
endmodule
