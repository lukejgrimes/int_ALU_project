// Don't Use yet, it doesn't work

module _4b_sub (
    input [3:0] a, b,
    input cin,
    output [3:0] out,
    output cout
);

wire [4:0] temp;
assign temp = {1'b0, a} - {1'b0, b} - cin;
assign cout = temp[4]
assign out = temp[3:0]
    
endmodule