module top(q, so, clk, reset, load, pi);
    input clk, reset, load;
    input [3:0] pi;
    output [3:0] q;
    output so;

    hello piso_inst(so, pi, load, clk, reset);

    hellotwo counter_inst(q, so, clk, reset);

endmodule