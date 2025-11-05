module tflipflop(q, t, clk, reset);
    input t, clk, reset;
    output reg q;

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 0;
        else if (t)
            q <= ~q;
    end
endmodule
