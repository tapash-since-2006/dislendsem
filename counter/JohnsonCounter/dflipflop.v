module dflipflop(q, d, clk, resetn, startingvalue);
    input d, clk, resetn, startingvalue;
    output reg q;

    always @(posedge clk or negedge resetn) begin
        if (~resetn)
            q <= startingvalue;
        else
            q <= d;
    end
endmodule
