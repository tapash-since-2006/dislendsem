module hellotwo(bcd, valid);
    input [3:0] bcd;
    output valid;

    wire a3, a2, a1, a0;
    assign {a3, a2, a1, a0} = bcd;

    assign valid = ~(a3 & (a2 | a1));

endmodule
