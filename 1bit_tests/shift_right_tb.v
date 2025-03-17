`timescale 1ns/1ns
`include "shift_right.v"

module shift_right_tb;
reg [3:0] in;
wire [3:0] out;

shift_right uut(in, out);

initial begin
    $dumpfile("shift_right_tb.vcd");
    $dumpvars(0, shift_right_tb);
    in = 4'b1101; // >> 0110
    #10;

    in = 4'b0101; // >> 0010
    #10;

    in = 4'b0010; // >> 0001
    #10;

    in = 4'b1111; // >> 0111
    #10;

    in = 4'b0000; // >> 0000
    #10;


    $display( " Testing right shift " );
    $finish;

end

endmodule
