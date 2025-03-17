`timescale  1ns/1ns
`include "not_gate.v"

module not_tb;
reg in;
wire out;

not_gate uut(in, out);

initial begin
    $dumpfile("not_tb.vcd");
    $dumpvars(0, not_tb);

    in = 0;
    #10;

    in = 1;
    #10;

    $display ( " Testing not " ) ;
    $finish;

end

endmodule