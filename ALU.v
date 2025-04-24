`include "4bit_operations/4b_add.v"
`include "4bit_operations/4b_sub.v"
`include "4bit_operations/4b_mult.v"
`include "4bit_operations/4b_div.v"

`include "4bit_gates/4b_and_gate.v"
`include "4bit_gates/4b_nand_gate.v"
`include "4bit_gates/4b_nor_gate.v"
`include "4bit_gates/4b_not_gate.v"
`include "4bit_gates/4b_or_gate.v"
`include "4bit_gates/4b_xnor_gate.v"
`include "4bit_gates/4b_xor_gate.v"
`include "4bit_gates/2x4b_shift.v"


// Opcodes
`define AND 4'b0000
`define NAND 4'b0001
`define NOR 4'b0010
`define NOT 4'b0011
`define OR 4'b0100
`define XNOR 4'b0101
`define XOR 4'b0110

`define ADD 4'b0111
`define SUB 4'b1000
`define MULT 4'b1001
`define DIV 4'b1010

`define SHIFT 4'b1011

module ALU (
    input [3:0] opcode,
    input [3:0] a,
    input [3:0] b,
    input cin,
    output reg [3:0] out,
    output reg [3:0] out_2,
    output reg cout
);
    // Function output wires
    wire  w_add_c, w_sub_c;
    wire [3:0] w_and, w_nand, w_nor, w_not, w_or, w_xnor, w_xor, w_div, w_div_r, w_mult_lo, w_mult_hi, w_add, w_sub, w_shift, w_shift_o;

    _4b_and_gate and4 (.a(a), .b(b), .out(w_and));
    _4b_nand_gate nand4 (.a(a), .b(b), .out(w_nand));
    _4b_nor_gate nor4 (.a(a), .b(b), .out(w_nor));
    _4b_not_gate not4 (.in(a), .out(w_not));
    _4b_or_gate or4 (.a(a), .b(b), .out(w_or));
    _4b_xnor_gate xnor4 (.a(a), .b(b), .out(w_xnor));
    _4b_xor_gate xor4 (.a(a), .b(b), .out(w_xor));

    _4b_add add4 (.a(a), .b(b), .cin(cin), .out(w_add), .cout(w_add_c));
    _4b_sub sub4 (.a(a), .b(b), .cin(cin), .out(w_sub), .cout(w_sub_c));
    _4b_mult mult4 (.a(a), .b(b), .out_lo(w_mult_lo), .out_hi(w_mult_hi));
    _4b_div div4 (.a(a), .b(b), .out(w_div), .remainder(w_div_r));

    _2x4_shift shift4 (.a(a), .b(b), .out(out), .y(out_2));
    
    // Decode Opcodes
    always @(*) begin
        out = 4'b0000;
        out_2 = 4'b0000;
        cout = 1'b0;

        case (opcode)
            `AND: out = w_and;
            `NAND: out = w_nand;
            `NOR: out = w_nor;
            `NOT: out = w_not;
            `OR: out = w_or;
            `XNOR: out = w_xnor;
            `XOR: out = w_xor;

            `ADD: begin
                out = w_add[3:0];
                cout = w_add[4];
            end
            `SUB: begin
                out = w_sub[3:0];
                cout = w_sub[4];
            end
            `MULT: begin
                out = w_mult_lo[3:0];
                out_2 = w_mult_hi[3:0];
            end
            `DIV: begin
                out = w_div[3:0];
                out_2 = w_div_r[3:0];
            end
            `SHIFT: begin
                out = w_shift[3:0];
                out_2 = w_shift_o[3:0];
            end
        endcase

    end

endmodule