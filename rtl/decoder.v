module decoder(
    input [1:0] g_id,
    output reg [3:0] grant
);

always @(*)
begin
    case(g_id)
        2'd0: grant = 4'b0001;
        2'd1: grant = 4'b0010;
        2'd2: grant = 4'b0100;
        2'd3: grant = 4'b1000;
        default: grant = 4'b0000;
    endcase
end

endmodule
