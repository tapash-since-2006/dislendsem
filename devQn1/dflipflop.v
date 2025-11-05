module dflipflop(q, d, clk, resetn);
    input d, clk, resetn;
    output reg q;

    always @(posedge clk or negedge resetn) begin
        if (~resetn)
            q <= 0;
        else
            q <= d;
    end
endmodule
