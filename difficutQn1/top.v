module top(clk, reset, q_out, valid);
    input clk, reset;
    output [3:0] q_out;
    output valid;

    wire [3:0] counter_out;
    wire valid_signal;

    hello_one COUNTER(counter_out, clk, reset);

    hellotwo BCD_CHECK(counter_out, valid_signal);

    hellothree PIPO(q_out, counter_out, clk, reset);

    assign valid = valid_signal;

endmodule
