// ============================================
// 3-bit Binary Multiplier (Combinational)
// ============================================
module multiplier_3bit(a, b, product);
    input  [2:0] a, b;
    output [5:0] product;

    wire [5:0] p0, p1, p2; // partial products

    // Partial products generation
    assign p0 = b[0] ? {3'b000, a}         : 6'b000000;
    assign p1 = b[1] ? {2'b00, a, 1'b0}    : 6'b000000;
    assign p2 = b[2] ? {1'b0, a, 2'b00}    : 6'b000000;

    // Add partial products
    assign product = p0 + p1 + p2;

endmodule
