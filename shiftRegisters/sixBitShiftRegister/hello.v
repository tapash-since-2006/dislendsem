// Write structural Verilog code for a 6-bit shift register(using the paramter n)

module hello #(parameter  N=6)(so,clk,reset,si);
    input clk, reset, si;
    output so;
     
    reg [N-1:0] temp;

    always @(posedge clk or posedge reset) begin
        if(reset) temp<=0;
        else begin
            temp<={si,temp[N-1:1]};
        end
    end
    assign so=temp[0];
endmodule