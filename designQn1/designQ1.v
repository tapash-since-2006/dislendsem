module designQ1(q,a,b,e,x,clk,reset);
    input a,b,e,clk,x,reset;
    output [1:0]q;
    wire ja,ka,jb,kb;

    assign ja=e&(b&x|~b&~x);
    assign ka=ja;
    assign jb=e;
    assign kb=e;

    jkflipflop jk1(q[1], ja, ka, clk, reset);
    jkflipflop jk2(q[0], jb, kb, clk, reset);
    
endmodule