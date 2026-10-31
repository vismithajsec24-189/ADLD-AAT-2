
module ALU_8bit_tb;

reg [7:0] A, B;
reg [3:0] ALU_Sel;

wire [7:0] ALU_Out;
wire Carry, Zero;

// Instantiate ALU
ALU_8bit uut (
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .ALU_Out(ALU_Out),
    .Carry(Carry),
    .Zero(Zero)
);

// Generate waveform
initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, ALU_8bit_tb);
end

// Apply test inputs
initial begin
    A = 8'd20;
    B = 8'd10;

    ALU_Sel = 4'b0000; #10;  // Addition
    ALU_Sel = 4'b0001; #10;  // Subtraction
    ALU_Sel = 4'b0010; #10;  // AND
    ALU_Sel = 4'b0011; #10;  // OR
    ALU_Sel = 4'b0100; #10;  // XOR
    ALU_Sel = 4'b0101; #10;  // NOT
    ALU_Sel = 4'b0110; #10;  // Left Shift
    ALU_Sel = 4'b0111; #10;  // Right Shift
    ALU_Sel = 4'b1000; #10;  // NAND
    ALU_Sel = 4'b1001; #10;  // NOR
    ALU_Sel = 4'b1010; #10;  // XNOR
    ALU_Sel = 4'b1011; #10;  // Less Than

    #10;
    $finish;
end

// Display output
initial begin
    $monitor("Time=%0t A=%d B=%d Sel=%b Output=%d Carry=%b Zero=%b",
             $time, A, B, ALU_Sel, ALU_Out, Carry, Zero);
end

endmodule

