module hello(so, pi, load, clk, reset);
    input [3:0] pi;       
    input load, clk, reset;
    output so;            

    wire q0, q1, q2, q3;  
    wire d0, d1, d2, d3;  

    assign d3 = load ? pi[3] : 1'b0;     
    assign d2 = load ? pi[2] : q3;
    assign d1 = load ? pi[1] : q2;
    assign d0 = load ? pi[0] : q1;

    dflipflop D3(q3, d3, clk, reset);
    dflipflop D2(q2, d2, clk, reset);
    dflipflop D1(q1, d1, clk, reset);
    dflipflop D0(q0, d0, clk, reset);

    assign so = q0;  
endmodule
