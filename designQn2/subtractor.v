module fullAdder(sum,cout,a,b,cin);
    input a,b,cin;
    output sum,cout;

    assign sum=a^b^cin;
    assign cout=(a&b)|(a&cin)|(b&cin);

endmodule

module subtractor(flag, a, b);
    input [3:0] a,b;
    output flag;

    wire [3:0] sum;
    wire [3:0] c;

    wire n;
    wire v;
    wire zero;

    wire [3:0]bn;

    assign bn[0]=~b[0];
    assign bn[1]=~b[1];
    assign bn[2]=~b[2];
    assign bn[3]=~b[3];

    fullAdder fa0(sum[0],c[0],a[0],bn[0],1'b1);
    fullAdder fa1(sum[1],c[1],a[1],bn[1],c[0]);
    fullAdder fa2(sum[2],c[2],a[2],bn[2],c[1]);
    fullAdder fa3(sum[3],c[3],a[3],bn[3],c[2]);

    assign n=sum[3];
    assign v=c[2]^c[3];

    assign flag=n^v;

endmodule


