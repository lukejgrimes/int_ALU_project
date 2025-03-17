module _4b_div (
    input [3:0] a, b,
    output [3:0] out, remainder
);

    assign out = (b == 0) ? 4'b0000 : a / b; // If division by zero, output 0 with remainder 2
    assign remainder = (b == 0) ? a : a % b;

endmodule