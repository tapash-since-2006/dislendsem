module dflipflop(q, clk, reset, d);
    input clk, reset, d;
    output reg q;
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule

module sync_up_counter(q, clk, reset);
    input clk, reset;
    output [1:0] q;
    wire t0, t1;
    assign t0 = ~q[0];
    assign t1 = q[0] ^ q[1];
    dflipflop df0(q[0], clk, reset, t0);
    dflipflop df1(q[1], clk, reset, t1);
endmodule

module addition(A, B, Y);
    input [2:0] A, B;
    output [3:0] Y;
    wire c0, c1, c2;
    assign {c0, Y[0]} = A[0] + B[0];
    assign {c1, Y[1]} = A[1] + B[1] + c0;
    assign {c2, Y[2]} = A[2] + B[2] + c1;
    assign Y[3] = c2;
endmodule

module subtraction(A, B, Y);
    input [2:0] A, B;
    output [3:0] Y;
    wire [2:0] B_comp;
    wire c0, c1, c2;
    assign B_comp = ~B;
    assign {c0, Y[0]} = A[0] + B_comp[0] + 1'b1;
    assign {c1, Y[1]} = A[1] + B_comp[1] + c0;
    assign {c2, Y[2]} = A[2] + B_comp[2] + c1;
    assign Y[3] = ~c2;
endmodule

module bitwise_and(A, B, Y);
    input [2:0] A, B;
    output [3:0] Y;
    assign Y = {1'b0, A & B};
endmodule

module bitwise_or(A, B, Y);
    input [2:0] A, B;
    output [3:0] Y;
    assign Y = {1'b0, A | B};
endmodule

module mux4to1_4bit(in0, in1, in2, in3, sel, out);
    input [3:0] in0, in1, in2, in3;
    input [1:0] sel;
    output [3:0] out;
    assign out = (sel == 2'b00) ? in0 :
                 (sel == 2'b01) ? in1 :
                 (sel == 2'b10) ? in2 :
                 (sel == 2'b11) ? in3 : 4'b0;
endmodule

module hello(A, B, clk, reset, Y);
    input [2:0] A, B;
    input clk, reset;
    output [3:0] Y;
    wire [1:0] sel;
    wire [3:0] add_Y, sub_Y, and_Y, or_Y;
    sync_up_counter counter_inst(sel, clk, reset);
    addition add_inst(A, B, add_Y);
    subtraction sub_inst(A, B, sub_Y);
    bitwise_and and_inst(A, B, and_Y);
    bitwise_or or_inst(A, B, or_Y);
    mux4to1_4bit mux_inst(add_Y, sub_Y, and_Y, or_Y, sel, Y);
endmodule
