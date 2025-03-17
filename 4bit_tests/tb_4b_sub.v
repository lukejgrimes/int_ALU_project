`timescale  1ns/1ns
`include "4bit_operations/4b_sub.v"

module tb_4b_sub;
reg [3:0] a, b;
reg cin;
wire [3:0] out;
wire cout;

_4b_sub uut(a, b, cin, out, cout);

initial begin
    $dumpfile("tb_4b_sub.vcd");
    $dumpvars(0, tb_4b_sub);

    a = 4'b0001;
    b = 4'b0001;
    cin = 1'b1;
    // Expected output 2
    #10;

    $display ( " Testing sub " ) ;
    $finish;

end

endmodule