module mux (y,s,a,b);
    input s;
    input [3:0] a,b;
    output [3:0]y;

    assign y=s?a:b;
endmodule