module hello(so,pi,clk,reset,shift,load);
    input clk,reset,shift,load;
    input [3:0] pi;
    output so;
    reg [3:0] temp;

    always @(posedge clk or posedge reset) begin
        if(reset) temp<=4'b0000;
        else begin
            casex({shift, load})
            2'b00:temp<={1'b0,temp[2:0]};
            2'b01:temp<=pi;
            2'b1x:temp<=temp;
            default:temp<=temp;
            endcase
        end
    end

    assign so=temp[3];
endmodule