module _4b_mult (
    input [3:0] a, b,
    output [3:0] out_lo,
    output [3:0] out_hi
);

    assign {out_hi, out_lo} = a * b;

endmodule