module eighttooneMUX(y,i,s);
    input [7:0]i;
    input [2:0]s;
    output y;

    wire [4:0] temp;

    twotooneMUX t0(temp[0], i[1:0],s[0]);
    twotooneMUX t1(temp[1], i[3:2],s[0]);
    twotooneMUX t2(temp[2], i[5:4],s[0]);
    twotooneMUX t3(temp[3], i[7:6],s[0]);

    fourtooneMUX f1(temp[4], temp[3:0], s[2:1]);

    assign y=temp[4];
endmodule