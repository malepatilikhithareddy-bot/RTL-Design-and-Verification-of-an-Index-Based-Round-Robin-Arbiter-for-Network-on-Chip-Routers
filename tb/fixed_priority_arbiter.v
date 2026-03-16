module fixed_priority_arbiter(
    input [3:0] request,
    input [1:0] priority,
    output reg [1:0] g_id
);

always @(*)
begin
    case(priority)

    2'b00:
        if(request[0]) g_id = 2'd0;
        else if(request[1]) g_id = 2'd1;
        else if(request[2]) g_id = 2'd2;
        else if(request[3]) g_id = 2'd3;
        else g_id = 2'd0;

    2'b01:
        if(request[1]) g_id = 2'd1;
        else if(request[2]) g_id = 2'd2;
        else if(request[3]) g_id = 2'd3;
        else if(request[0]) g_id = 2'd0;
        else g_id = 2'd0;

    2'b10:
        if(request[2]) g_id = 2'd2;
        else if(request[3]) g_id = 2'd3;
        else if(request[0]) g_id = 2'd0;
        else if(request[1]) g_id = 2'd1;
        else g_id = 2'd0;

    2'b11:
        if(request[3]) g_id = 2'd3;
        else if(request[0]) g_id = 2'd0;
        else if(request[1]) g_id = 2'd1;
        else if(request[2]) g_id = 2'd2;
        else g_id = 2'd0;

    endcase
end

endmodule
