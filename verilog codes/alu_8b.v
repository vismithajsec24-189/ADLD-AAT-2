
module ALU_8bit (
    input  [7:0] A,
    input  [7:0] B,
    input  [3:0] ALU_Sel,
    output reg [7:0] ALU_Out,
    output reg Carry,
    output Zero
);

always @(*) begin
    Carry = 0;
    ALU_Out = 8'b00000000;

    case (ALU_Sel)

        4'b0000: {Carry, ALU_Out} = A + B;       // Addition
        4'b0001: ALU_Out = A - B;                // Subtraction
        4'b0010: ALU_Out = A & B;                // AND
        4'b0011: ALU_Out = A | B;                // OR
        4'b0100: ALU_Out = A ^ B;                // XOR
        4'b0101: ALU_Out = ~A;                   // NOT
        4'b0110: ALU_Out = A << 1;               // Left Shift
        4'b0111: ALU_Out = A >> 1;               // Right Shift
        4'b1000: ALU_Out = ~(A & B);             // NAND
        4'b1001: ALU_Out = ~(A | B);             // NOR
        4'b1010: ALU_Out = ~(A ^ B);             // XNOR
        4'b1011: ALU_Out = (A < B) ? 8'b00000001 : 8'b00000000; // Less Than

        default: ALU_Out = 8'b00000000;

    endcase
end

assign Zero = (ALU_Out == 8'b00000000);

endmodule

