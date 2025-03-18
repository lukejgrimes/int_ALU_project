`timescale 1 ns / 1 ns
`include "4bit_gates/4b_nor_gate.v"

module tb_4b_nor;

reg [3:0] a, b;
wire [3:0] out;

_4b_nor_gate uut(a, b, out);

initial begin
    $dumpfile("tb_4b_nor.vcd");
    $dumpvars(0, tb_4b_nor);

    a = 4'b0000;
    b = 4'b1111;
    #10; 

    a = 4'b1110;
    b = 4'b0010;
    #10; 

    $display ( " Testing nor " ) ;
    $finish;

end

endmodule