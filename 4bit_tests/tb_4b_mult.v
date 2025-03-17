`timescale  1ns/1ns
`include "4bit_operations/4b_mult.v"

module tb_4b_mult;
reg [3:0] a, b;
wire [3:0] out_lo;
wire [3:0] out_hi;

_4b_mult uut(a, b, out_lo, out_hi);

initial begin
    $dumpfile("tb_4b_mult.vcd");
    $dumpvars(0, tb_4b_mult);

    a = 4'b0011; // 3
    b = 4'b0010; // 2
    // Expected Output: out_lo = 6, out_hi = 0
    #10;

    a = 4'b1000; // 8
    b = 4'b0100; // 4
    // Expected Output: out_lo = 0, out_hi = 2
    #10;

    a = 4'b0111; // 7  
    b = 4'b0111; // 7
    // Expected Output: out_lo = 1, out_hi = 3
    #10;

    a = 4'b1111; // 15
    b = 4'b1111; // 15
    // Expected Output: out_lo = 1, out_hi = 14
    #10;

    $display ( " Testing mult " ) ;
    $finish;

end

endmodule