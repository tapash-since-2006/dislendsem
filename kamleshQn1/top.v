// top module connecting everyhting
module top(q,a,b,clk,reset);
    input [3:0]a,b;
    input clk,reset;
    output [1:0] q;
    
    wire [3:0] temp1;
    wire t1;
    wire val;

    hello h1(temp1,t1,val,a,b);
    helloone h2(q,clk,reset,val);

endmodule