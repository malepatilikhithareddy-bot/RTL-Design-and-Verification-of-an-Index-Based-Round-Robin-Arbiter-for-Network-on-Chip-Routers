module priority_reg(
    input clk,
    input reset,
    input [1:0] next_priority,
    output reg [1:0] priority
);

always @(posedge clk or posedge reset)
begin
    if(reset)
        priority <= 2'b00;
    else
        priority <= next_priority;
end

endmodule
