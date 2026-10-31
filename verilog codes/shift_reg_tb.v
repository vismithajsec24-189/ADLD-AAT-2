
module tb_universal_shift_register;

reg clk, rst;
reg [1:0] sel;
reg [3:0] data_in;
reg serial_in_left, serial_in_right;
wire [3:0] q;

universal_shift_register uut (
    .clk(clk),
    .rst(rst),
    .sel(sel),
    .data_in(data_in),
    .serial_in_left(serial_in_left),
    .serial_in_right(serial_in_right),
    .q(q)
);

// Clock generation
always #5 clk = ~clk;

// Waveform generation
initial begin
    $dumpfile("universal_shift_register.vcd");
    $dumpvars(0, tb_universal_shift_register);
end

initial begin
    clk = 0;
    rst = 1;
    sel = 0;
    data_in = 0;
    serial_in_left = 0;
    serial_in_right = 0;

    #10 rst = 0;

    // Parallel Load
    sel = 2'b11;
    data_in = 4'b1010;
    #10;

    // Shift Right
    sel = 2'b01;
    serial_in_right = 1;
    #10;

    // Shift Left
    sel = 2'b10;
    serial_in_left = 0;
    #10;

    // Hold
    sel = 2'b00;
    #10;

    $finish;
end

initial begin
    $monitor("Time=%0t sel=%b q=%b", $time, sel, q);
end

endmodule

