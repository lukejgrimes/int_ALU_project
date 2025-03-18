`timescale 1 ns / 1 ns
`include "4bit_gates/4b_not_gate.v"

module tb_4b_not;

reg [3:0] in;
wire [3:0] out;

_4b_not_gate uut(in, out);

initial begin
    $dumpfile("tb_4b_not.vcd");
    $dumpvars(0, tb_4b_not);

    in = 4'b0000;
    #10; 

    in = 4'b1110;
    #10; 

    $display ( " Testing not " ) ;
    $finish;

end

endmodule