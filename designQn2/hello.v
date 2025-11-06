module hello(q,a,b,clk,reset);
    input clk, reset;
    input [3:0] a,b;
    output [3:0] q;
    wire flag;
    wire [3:0] temp;
    wire so;


    subtractor s(flag, a, b);
    mux m(temp,flag,a,b);
    pipo p(q,so,temp,clk,reset);

endmodule