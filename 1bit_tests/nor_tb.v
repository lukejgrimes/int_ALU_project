`timescale  1ns/1ns
`include "nor_gate.v"

module nor_tb;
reg a, b;
wire out;

nor_gate uut(a, b, out);

initial begin
    $dumpfile("nor_tb.vcd");
    $dumpvars(0, nor_tb);

    a = 0;
    b = 0;
    #10;

    a = 1;
    b = 0;
    #10;

    a = 0;
    b = 1;
    #10;

    a = 1;
    b = 1;
    #10;

    $display ( " Testing nor " ) ;
    $finish;

end

endmodule