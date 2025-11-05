// module dff(q, d, clk, reset);
//     input d, clk, reset;
//     output reg q;

//     always @(posedge clk) begin
//         if (reset)
//             q <= 1'b0;
//         else
//             q <= d;
//     end
// endmodule

// module piso(so, pi, load, clk, reset);
//     input [3:0] pi;       
//     input load, clk, reset;
//     output so;            

//     wire q0, q1, q2, q3;  
//     wire d0, d1, d2, d3;  

//     assign d0 = load ? pi[0] : 1'b0;     
//     assign d1 = load ? pi[1] : q0;
//     assign d2 = load ? pi[2] : q1;
//     assign d3 = load ? pi[3] : q2;

//     // Instantiate 4 D flip-flops
//     dff dff0(q0, d0, clk, reset);
//     dff dff1(q1, d1, clk, reset);
//     dff dff2(q2, d2, clk, reset);
//     dff dff3(q3, d3, clk, reset);

//     assign so = q3;  // serial output (MSB)
// endmodule


// without d flip flop

module piso(so, pi, load, clk, reset);
    input [3:0] pi;        
    input load, clk, reset; 
    output so;             

    reg [3:0] temp;        

    always @(posedge clk or posedge reset) begin
        if (reset)
            temp <= 4'b0000;          
        else if (load)
            temp <= pi;               
        else
            temp <= {1'b0, temp[3:1]}; 
    end

    assign so = temp[0]; 
endmodule



