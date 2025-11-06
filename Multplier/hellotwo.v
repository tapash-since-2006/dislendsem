//=================================================
// 4-bit Array Multiplier (using Full Adders)
//
// Implements the shift-and-add logic from the diagram.
// Inputs: a[3:0], b[3:0]
// Output: z[7:0]
//=================================================
module multiplier_4bit_array(
    input [3:0] a,
    input [3:0] b,
    output [7:0] z
);

    //====================
    // 1. Partial Product (PP) Generation
    //====================
    // Wire for each p_ij term (p<a_index><b_index>)
    wire p00, p10, p20, p30; // Row 0 (multiplied by b[0])
    wire p01, p11, p21, p31; // Row 1 (multiplied by b[1])
    wire p02, p12, p22, p32; // Row 2 (multiplied by b[2])
    wire p03, p13, p23, p33; // Row 3 (multiplied by b[3])

    // 16 AND gates to create the partial products
    assign p00 = a[0] & b[0]; assign p10 = a[1] & b[0]; assign p20 = a[2] & b[0]; assign p30 = a[3] & b[0];
    assign p01 = a[0] & b[1]; assign p11 = a[1] & b[1]; assign p21 = a[2] & b[1]; assign p31 = a[3] & b[1];
    assign p02 = a[0] & b[2]; assign p12 = a[1] & b[2]; assign p22 = a[2] & b[2]; assign p32 = a[3] & b[2];
    assign p03 = a[0] & b[3]; assign p13 = a[1] & b[3]; assign p23 = a[2] & b[3]; assign p33 = a[3] & b[3];
    
    
    //====================
    // 2. Adder Array
    //====================
    
    // z[0] is just p00, no adder needed
    assign z[0] = p00;

    // --- Row 1 of Adders (Adds PP Row 0 and PP Row 1) ---
    // Intermediate wires for sums (s) and carries (c)
    // s<row>_<column>, c<row>_<column>
    wire s1_2, s1_3, s1_4;
    wire c1_1, c1_2, c1_3, c1_4;

    // Col z[1]: (p10 + p01). Sum is z[1] (final).
    full_adder fa_1_1 (.sum(z[1]), .cout(c1_1), .a(p10), .b(p01), .cin(1'b0));
    
    // Col z[2]: (p20 + p11) + carry. Sum (s1_2) goes to next row.
    full_adder fa_1_2 (.sum(s1_2), .cout(c1_2), .a(p20), .b(p11), .cin(c1_1));
    
    // Col z[3]: (p30 + p21) + carry. Sum (s1_3) goes to next row.
    full_adder fa_1_3 (.sum(s1_3), .cout(c1_3), .a(p30), .b(p21), .cin(c1_2));
    
    // Col z[4]: (p31 + 0) + carry. Sum (s1_4) and Carry (c1_4) go to next row.
    full_adder fa_1_4 (.sum(s1_4), .cout(c1_4), .a(p31), .b(1'b0), .cin(c1_3));


    // --- Row 2 of Adders (Adds Row 1 Sums to PP Row 2) ---
    wire s2_3, s2_4, s2_5;
    wire c2_2, c2_3, c2_4, c2_5;
    
    // Col z[2]: (s1_2 + p02). Sum is z[2] (final).
    full_adder fa_2_2 (.sum(z[2]), .cout(c2_2), .a(s1_2), .b(p02), .cin(1'b0));
    
    // Col z[3]: (s1_3 + p12) + carry. Sum (s2_3) goes to next row.
    full_adder fa_2_3 (.sum(s2_3), .cout(c2_3), .a(s1_3), .b(p12), .cin(c2_2));
    
    // Col z[4]: (s1_4 + p22) + carry. Sum (s2_4) goes to next row.
    full_adder fa_2_4 (.sum(s2_4), .cout(c2_4), .a(s1_4), .b(p22), .cin(c2_3));
    
    // Col z[5]: (c1_4 + p32) + carry. Sum (s2_5) and Carry (c2_5) go to next row.
    full_adder fa_2_5 (.sum(s2_5), .cout(c2_5), .a(c1_4), .b(p32), .cin(c2_4));

    
    // --- Row 3 of Adders (Adds Row 2 Sums to PP Row 3) ---
    // This is the final row, so its sums are the final z[3]..z[7] bits.
    // It is a 4-bit ripple-carry adder.
    wire c3_3, c3_4, c3_5; 
    
    // Col z[3]: (s2_3 + p03). Sum is z[3] (final).
    full_adder fa_3_3 (.sum(z[3]), .cout(c3_3), .a(s2_3), .b(p03), .cin(1'b0));
    
    // Col z[4]: (s2_4 + p13) + carry. Sum is z[4] (final).
    full_adder fa_3_4 (.sum(z[4]), .cout(c3_4), .a(s2_4), .b(p13), .cin(c3_3));
    
    // Col z[5]: (s2_5 + p23) + carry. Sum is z[5] (final).
    full_adder fa_3_5 (.sum(z[5]), .cout(c3_5), .a(s2_5), .b(p23), .cin(c3_4));
    
    // Col z[6]: (c2_5 + p33) + carry. Sum is z[6] (final).
    // The final carry-out is z[7] (final).
    full_adder fa_3_6 (.sum(z[6]), .cout(z[7]), .a(c2_5), .b(p33), .cin(c3_5));

endmodule