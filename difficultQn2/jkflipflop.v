module jkflipflop(
    input j, k, clk, reset,
    output reg q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 0;
        else begin
            case ({j, k})
                2'b00: q <= q;       // hold
                2'b01: q <= 0;       // reset
                2'b10: q <= 1;       // set
                2'b11: q <= ~q;      // toggle
            endcase
        end
    end
endmodule
