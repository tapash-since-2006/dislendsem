// asynchrous up counter

module helloone(q,clk,reset,val);
    input clk,reset,val;
    output [1:0]q;

    wire temp;

    assign temp=val?~q[0]:q[0];


    tflipflop tff1(q[0],1'b1,clk,reset);
    tflipflop tff2(q[1],1'b1,temp,reset);

endmodule