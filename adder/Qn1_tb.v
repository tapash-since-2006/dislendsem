`timescale 1ns/1ns
`include "Qn1.v"
module Qn1_tb;

    // Testbench signals
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;

    // Instantiate your ripple adder (Qn1)
    Qn1 uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    // Waveform dump
    initial begin
        $dumpfile("waveform.vcd");   // create VCD file
        $dumpvars(0, Qn1_tb);        // dump all signals in testbench
    end

    // Apply test inputs
    initial begin
        // Monitor all signals
        $monitor("Time=%0t | A=%b B=%b Cin=%b || Sum=%b Cout=%b", 
                  $time, A, B, Cin, Sum, Cout);

        // Test cases
        A = 4'b0000; B = 4'b0000; Cin = 0; #10;
        A = 4'b0101; B = 4'b0011; Cin = 0; #10;
        A = 4'b0101; B = 4'b0011; Cin = 1; #10;
        A = 4'b1111; B = 4'b0001; Cin = 0; #10;
        A = 4'b1111; B = 4'b1111; Cin = 1; #10;

        $finish; // end simulation
    end

endmodule
