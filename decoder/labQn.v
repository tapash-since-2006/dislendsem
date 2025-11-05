// Write behavioral Verilog code for a 2 to 4 decoder with active-high enable input and active
// low output using case statement. Using the 2 to 4 decoders above, design a 4 to 16 decoder
// with active-high enable input and active low output and write the Verilog code for the
// same


module decoder2to4_activeLowOutput(
    input [1:0] A,    // 2-bit input
    input EN,         // Active-high enable
    output reg [3:0] Y_n // 4-bit active-low output
);

    always @(*) begin
        // Default all outputs inactive (1 for active-low)
        Y_n = 4'b1111;

        if (EN) begin
            case (A)
                2'b00: Y_n = 4'b1110;  // Output 0 active
                2'b01: Y_n = 4'b1101;  // Output 1 active
                2'b10: Y_n = 4'b1011;  // Output 2 active
                2'b11: Y_n = 4'b0111;  // Output 3 active
                default: Y_n = 4'b1111;
            endcase
        end
    end

endmodule



module decoder4to16_activeLow(
    input [3:0] A,      // 4-bit input
    input EN,           // Active-high enable
    output [15:0] Y_n   // 16-bit active-low output
);

    wire [3:0] block0, block1, block2, block3;

    // Instantiate four 2-to-4 decoders
    decoder2to4_activeLowOutput dec0 (.A(A[1:0]), .EN(EN & (A[3:2]==2'b00)), .Y_n(block0));
    decoder2to4_activeLowOutput dec1 (.A(A[1:0]), .EN(EN & (A[3:2]==2'b01)), .Y_n(block1));
    decoder2to4_activeLowOutput dec2 (.A(A[1:0]), .EN(EN & (A[3:2]==2'b10)), .Y_n(block2));
    decoder2to4_activeLowOutput dec3 (.A(A[1:0]), .EN(EN & (A[3:2]==2'b11)), .Y_n(block3));

    // Combine outputs to form 16-bit active-low output
    assign Y_n = {block3, block2, block1, block0};

endmodule
