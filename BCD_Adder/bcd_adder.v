module bcd_adder(sum, cout, a, b, cin);
    input [3:0] a, b;
    input cin;
    output [3:0] sum;
    output cout;

    wire [3:0] initial_sum;
    wire c1, c2;
    wire [3:0] correction;
    wire [3:0] final_sum;
    wire correction_needed;

    four_bit_adder adder1(initial_sum, c1, a, b, cin);

    assign correction_needed = c1 | (initial_sum[3] & (initial_sum[2] | initial_sum[1]));

    assign correction = correction_needed ? 4'b0110 : 4'b0000;

    four_bit_adder adder2(final_sum, c2, initial_sum, correction, 1'b0);

    assign sum  = final_sum;
    assign cout = correction_needed;
endmodule
