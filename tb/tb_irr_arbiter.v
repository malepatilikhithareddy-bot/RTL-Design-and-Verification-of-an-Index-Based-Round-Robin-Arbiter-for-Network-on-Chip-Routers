`timescale 1ns/1ps

module tb_irr_arbiter;

reg clk;
reg reset;
reg [3:0] request;

wire [3:0] grant;
wire [1:0] g_id;

irr_arbiter_top DUT(
    .clk(clk),
    .reset(reset),
    .request(request),
    .grant(grant),
    .g_id(g_id)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    reset = 1;
    request = 4'b0000;

    #10 reset = 0;

    #10 request = 4'b1111;
    #40 request = 4'b0101;
    #40 request = 4'b0011;
    #40 request = 4'b1000;
    #40 request = 4'b0000;

    #50 $finish;
end

initial begin
    $monitor("Time=%0t Request=%b Grant=%b Grant_ID=%d",
              $time, request, grant, g_id);
end

endmodule
