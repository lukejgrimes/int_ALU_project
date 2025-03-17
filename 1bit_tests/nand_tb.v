`timescale 1 ns / 1 ns
`include "nand_gate.v"

module nand_tb;

reg a, b;
wire out;

nand_gate uut(a, b, out);

initial begin
    $dumpfile("nand_tb.vcd");
    $dumpvars(0, nand_tb);

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

    $display ( " Testing nand " ) ;
    $finish;

end

endmodule