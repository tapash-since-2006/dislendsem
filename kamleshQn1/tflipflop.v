module tflipflop(q,t,clk,reset);
    input t,clk,reset;
    output reg q;

    always @ (posedge clk or posedge reset) begin
        if(reset) begin
            q<=0;
        end else begin
            if(t==1) q<=~q;
            else q<=q;
        end
    end
endmodule