module incrementer(
    input [1:0] g_id,
    output [1:0] next_priority
);

assign next_priority = g_id + 1;

endmodule
