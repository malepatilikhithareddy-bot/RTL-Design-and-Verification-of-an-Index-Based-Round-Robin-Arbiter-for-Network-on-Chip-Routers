module irr_arbiter_top(
    input clk,
    input reset,
    input [3:0] request,
    output [3:0] grant,
    output [1:0] g_id
);

wire [1:0] priority;
wire [1:0] next_priority;

priority_reg PR(
    .clk(clk),
    .reset(reset),
    .next_priority(next_priority),
    .priority(priority)
);

fixed_priority_arbiter FPA(
    .request(request),
    .priority(priority),
    .g_id(g_id)
);

decoder DEC(
    .g_id(g_id),
    .grant(grant)
);

incrementer INC(
    .g_id(g_id),
    .next_priority(next_priority)
);

endmodule
