module _4b_xnor_gate(input [3:0] a, b, output [3:0] out);
    assign out = ~(a ^ b);

endmodule