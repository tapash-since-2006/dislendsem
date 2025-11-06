module pipo(po,so,pi,clk,reset);
    input clk,reset;
    output so;
    output reg [3:0] po;
    input [3:0] pi;

    always @ (posedge clk or posedge reset) begin
        if(reset) po<=4'b0000;
        else begin
            po<=pi;
        end
    end

    assign so=po[0];
endmodule