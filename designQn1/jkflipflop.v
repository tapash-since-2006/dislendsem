//Write behavioral Verilog code for a positive edge-triggered JK FF with synchronous active
//high reset

module jkflipflop(q,j,k,clk,reset);
    input j,k,clk, reset;
    output reg q;


    always @(posedge clk) begin
        if(reset==1'b1) begin
            q<=1'b0;
        end
        else begin
            case ({j,k})
            2'b00: q<=q;
            2'b10: q<=1'b1;
            2'b01: q<=1'b0;
            2'b11: q<=~q;
            default:q<=q;
            endcase
        end
    end
endmodule