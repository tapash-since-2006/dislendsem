module hello(po,so,y,clk,resetn,si);
    input clk, resetn, si;
    output [3:0]po;
    output so,y;

    wire [3:0] temp;

    dflipflop d3(temp[3],si,clk,resetn);
    dflipflop d2(temp[2],temp[3],clk,resetn);
    dflipflop d1(temp[1],temp[2],clk,resetn);
    dflipflop d0(temp[0],temp[1],clk,resetn);

    assign so=temp[0];

    assign po=temp;

    assign y=~temp[3]|~temp[2]&~temp[1];

endmodule