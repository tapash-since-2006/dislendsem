module decoder2to4(
    input [1:0] A,
    input EN,
    output reg [3:0] Y
);
    always @(*) begin
        if (EN) begin
            if (A == 2'b00) Y = 4'b0001;
            else if (A == 2'b01) Y = 4'b0010;
            else if (A == 2'b10) Y = 4'b0100;
            else if (A == 2'b11) Y = 4'b1000;
            else Y = 4'b0000;
        end else begin
            Y = 4'b0000;
        end
    end
endmodule

module decoder3to8(
    input [2:0] A,
    input EN,
    output [7:0] Y
);
    wire [3:0] lower, upper;
    wire en_lower, en_upper;

    assign en_lower = EN & ~A[2];
    assign en_upper = EN &  A[2];

    // Positional mapping
    decoder2to4 d0(A[1:0], en_lower, lower);
    decoder2to4 d1(A[1:0], en_upper, upper);

    assign Y = {upper, lower};
endmodule

module decoder4to16(
    input [3:0] A,
    input EN,
    output [15:0] Y
);
    wire [7:0] lower, upper;
    wire en_lower, en_upper;

    assign en_lower = EN & ~A[3];
    assign en_upper = EN &  A[3];

    // Positional mapping
    decoder3to8 d0(A[2:0], en_lower, lower);
    decoder3to8 d1(A[2:0], en_upper, upper);

    assign Y = {upper, lower};
endmodule
