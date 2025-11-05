`timescale 1ns/1ns
`include "full_adder.v"
`include "four_bit_adder.v"
`include "bcd_adder.v"

module bcd_adder_tb();
    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    bcd_adder Q1(sum, cout, a, b, cin);

    initial begin
        $dumpfile("bcd_adder_tb.vcd");
        $dumpvars(0, bcd_adder_tb);

        a=4'd3; b=4'd5; cin=0; #10;  
        a=4'd7; b=4'd6; cin=0; #10;  
        a=4'd9; b=4'd9; cin=0; #10; 
        a=4'd4; b=4'd9; cin=0; #10;  
        a=4'd8; b=4'd7; cin=1; #10;  

        $finish;
    end
endmodule
