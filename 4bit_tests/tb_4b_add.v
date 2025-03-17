`timescale  1ns/1ns
`include "4bit_operations/4b_add.v"

module tb_4b_add;
reg [3:0] a, b;
reg cin;
wire [3:0] out;
wire cout;

_4b_add uut(a, b, cin, out, cout);

initial begin
    $dumpfile("tb_4b_add.vcd");
    $dumpvars(0, tb_4b_add);

    a = 4'b0001;
    b = 4'b0001;
    cin = 1'b1;
    // Expected Output:out = 3, cout = 0
    #10;

    a = 4'b0001;
    b = 4'b0001;
    cin = 1'b0;
    // Expected Output:out = 2, cout = 0
    #10;

    a = 4'b1111;
    b = 4'b0001;
    cin = 1'b0;
    // Expected Output:out = 0, cout = 1
    #10;

    a = 4'b1111;
    b = 4'b0001;
    cin = 1'b1;
    // Expected Output:out = 1, cout = 1
    #10;

    $display ( " Testing add " ) ;
    $finish;

end

endmodule