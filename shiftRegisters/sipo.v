module sipo(so, po, si, reset, clk);
    input si, clk, reset;
    output [3:0] po;
    output so;

    reg w1, w2, w3, w4;  

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            w1 <= 0;
            w2 <= 0;
            w3 <= 0;
            w4 <= 0;
        end
        else begin
            w4 <= w3;
            w3 <= w2;
            w2 <= w1;
            w1 <= si;   
        end
    end

    assign po = {w4, w3, w2, w1};  
    assign so = w4;                
endmodule


// // N-bit Serial-In Parallel-Out (SIPO) Register
// module sipo #(parameter N = 4) (so, po, si, reset, clk);
//     input si, clk, reset;
//     output [N-1:0] po;
//     output so;

//     reg [N-1:0] shift_reg;  

//     always @(posedge clk or posedge reset) begin
//         if (reset)
//             shift_reg <= 0;
//         else
//             shift_reg <= {shift_reg[N-2:0], si}; // shift left, insert new serial input
//     end

//     assign po = shift_reg;  
//     assign so = shift_reg[N-1];  // Serial output (MSB)
// endmodule


// `timescale 1ns/1ns

// module sipo_tb;
//     parameter N = 4;
//     reg si, clk, reset;
//     wire [N-1:0] po;
//     wire so;

//     // Instantiate the SIPO module
//     sipo #(N) uut(so, po, si, reset, clk);

//     // Clock generation: 10ns period
//     initial begin
//         clk = 0;
//         forever #5 clk = ~clk;
//     end

//     // Test sequence
//     initial begin
//         $dumpfile("sipo_tb.vcd");
//         $dumpvars(0, sipo_tb);

//         // Initialize
//         reset = 1; si = 0;
//         #10 reset = 0;

//         // Apply serial input bits
//         si = 1; #10;
//         si = 0; #10;
//         si = 1; #10;
//         si = 1; #10;
//         si = 0; #10;

//         // Observe output
//         #20;
//         $finish;
//     end

//     // Display output on each clock edge
//     always @(posedge clk)
//         $display("Time=%0t | SI=%b | PO=%b | SO=%b", $time, si, po, so);
// endmodule
