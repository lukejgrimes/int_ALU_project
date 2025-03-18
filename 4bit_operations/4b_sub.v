// Don't Use yet, it doesn't work

module _4b_sub (
    input [3:0] a, b,
    input cin,
    output [3:0] out,
    output cout
);

assign {cout, out} = a + ~b + cin; // Use two's complement addition
    
endmodule