module _4b_add (
    input [3:0] a, b, 
    input cin, 
    output [3:0] out,
    output cout
);

    assign {cout, out} = a + b + cin; // Assign the most significant bit of sum to cout
    
endmodule