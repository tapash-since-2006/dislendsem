// ============================================
// 3-bit Binary Multiplier using AND + Adders
// ============================================
module half_adder(sum, carry, a, b);
    input a, b;
    output sum, carry;
    assign sum = a ^ b;
    assign carry = a & b;
endmodule

module full_adder(sum, carry, a, b, cin);
    input a, b, cin;
    output sum, carry;
    wire s1, c1, c2;
    half_adder HA1(s1, c1, a, b);
    half_adder HA2(sum, c2, s1, cin);
    assign carry = c1 | c2;
endmodule


// ============================================
// 3-bit Multiplier
// ============================================
module multiplier_3bit(a, b, product);
    input [2:0] a, b;
    output [5:0] product;

    // Partial products (AND plane)
    wire p00, p01, p02;
    wire p10, p11, p12;
    wire p20, p21, p22;

    assign p00 = a[0] & b[0];
    assign p01 = a[1] & b[0];
    assign p02 = a[2] & b[0];
    assign p10 = a[0] & b[1];
    assign p11 = a[1] & b[1];
    assign p12 = a[2] & b[1];
    assign p20 = a[0] & b[2];
    assign p21 = a[1] & b[2];
    assign p22 = a[2] & b[2];

    // Add the partial products
    // Column-wise addition
    wire s1, c1, s2, c2, s3, c3, s4, c4, s5, c5;

    // First bit (LSB)
    assign product[0] = p00;

    // Second column: p01 + p10
    half_adder HA1(s1, c1, p01, p10);
    assign product[1] = s1;

    // Third column: p02 + p11 + p20 + carry
    full_adder FA1(s2, c2, p02, p11, p20);
    full_adder FA2(s3, c3, s2, c1, 1'b0);
    assign product[2] = s3;

    // Fourth column: p12 + p21 + carry
    full_adder FA3(s4, c4, p12, p21, c2);
    assign product[3] = s4;

    // Fifth column: p22 + carry
    half_adder HA2(s5, c5, p22, c4);
    assign product[4] = s5;

    // Sixth bit (MSB)
    assign product[5] = c5 | c3;

endmodule
