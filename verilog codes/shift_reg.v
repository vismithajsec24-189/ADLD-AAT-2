
module universal_shift_register (
    input clk,
    input rst,
    input [1:0] sel,
    input [3:0] data_in,
    input serial_in_left,
    input serial_in_right,
    output reg [3:0] q
);

always @(posedge clk or posedge rst)
begin
    if (rst)
        q <= 4'b0000;
    else
    begin
        case (sel)
            2'b00: q <= q; 
            2'b01: q <= {serial_in_right, q[3:1]};
            2'b10: q <= {q[2:0], serial_in_left};
            2'b11: q <= data_in;
        endcase
    end
end

endmodule

