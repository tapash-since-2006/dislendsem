
module full_adder_4bit(sum, cout, a, b, cin);
    input  [3:0] a, b;
    input  cin;
    output [3:0] sum;
    output cout;

    wire [3:0] p, g;
    wire [3:1] c;

    assign p = a ^ b;
    assign g = a & b;

    assign c[1] = g[0] | (p[0] & cin);
    assign c[2] = g[1] | (p[1] & c[1]);
    assign c[3] = g[2] | (p[2] & c[2]);
    assign cout = g[3] | (p[3] & c[3]);

    assign sum = p ^ {c[3], c[2], c[1], cin};
endmodule


module subtractor_4bit(diff, cout, a, b);
    input  [3:0] a, b;
    output [3:0] diff;
    output cout;

    wire [3:0] b_comp; 

    assign b_comp = ~b;

    full_adder_4bit adder1(diff, cout, a, b_comp, 1'b1);
endmodule
