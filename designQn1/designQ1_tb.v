`include "jkflipflop.v"
`include "designQ1.v"
`timescale 1ns/1ns

module designQ1_tb();
    reg a,b,e,x,clk,reset;
    wire [1:0]q;

    designQ1 Q1(q,a,b,e,x,clk,reset);

    initial begin
        clk=0;
        forever #5 clk=~clk;
    end

    initial begin 
        $dumpfile("designQ1_tb.vcd");
        $dumpvars(0, designQ1_tb);

        a=0;b=0;e=0;x=0;reset=1;

        #10 reset=0;
        
        #10 e=1;x=1;a=0;b=0;
        #20 a=1;x=0;b=0;
        #20 a=0;x=1;b=1;
        #20 a=1;x=0;b=1;
        #20 e=0;x=1;a=1;b=0;
        #20 e=0;x=0;a=0;b=0;
        #20 e=0;x=0;a=0;b=1;

        
    $finish;
    end
endmodule

