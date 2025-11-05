// subtractor

module fulladder(y,cout,a,b,cin);
    input a,b,cin;
    output y,cout;

    assign y=a^b^cin;
    assign cout=(a&b)|(a&cin)|(b&cin);

endmodule


module fourbitadder(y,cout,a,b,cin);
    input [3:0] a,b;
    input cin;
    output [3:0] y;
    output cout;

    wire [2:0] temp;

    fulladder fa0(y[0],temp[0],a[0],b[0],cin);
    fulladder fa1(y[1],temp[1],a[1],b[1],temp[0]);
    fulladder fa2(y[2],temp[2],a[2],b[2],temp[1]);
    fulladder fa3(y[3],cout,a[3],b[3],temp[2]);

endmodule


module hello(y,cout,val,a,b);
    input [3:0] a,b;
    output [3:0] y;
    output cout,val;

    fourbitadder f1(y,cout,a,~b,1'b1);

    assign val=(y<5?1:0);
endmodule