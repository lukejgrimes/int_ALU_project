`timescale  1ns/1ns
`include "4bit_operations/4b_div.v"

module tb_4b_div;
reg [3:0] a, b;
wire [3:0] out;
wire [3:0] remainder;

_4b_div uut(a, b, out, remainder);

initial begin
    $dumpfile("tb_4b_div.vcd");
    $dumpvars(0, tb_4b_div);

    a = 4'b0100; // 4
    b = 4'b0010; // 2
    // Expected output: Out = 2, Remainder = 0
    #10;

    a = 4'b0111; // 7
    b = 4'b0011; // 3
    // Expected output: Out = 2, Remainder = 1
    #10;

    a = 4'b0011; // 3
    b = 4'b0111; // 7
    // Expected output: Out = 0, Remainder = 3
    #10;


    $display ( " Testing div " ) ;
    $finish;

end

endmodule