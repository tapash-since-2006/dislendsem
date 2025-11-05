module dflipflop(q, d, clk, reset);
    input d, clk, reset;
    output reg q;

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 0;
        else
            q <= d;
    end
endmodule
