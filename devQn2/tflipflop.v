module tflipflop(q, t, clk, reset);
    output reg q;
    input t, clk, reset;

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else if (t)
            q <= ~q;
    end
endmodule

