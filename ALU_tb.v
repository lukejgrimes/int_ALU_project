`timescale 1ns/1ns
`include "ALU.v"

module alu_tb;
  reg [3:0] a;
  reg [3:0] b;
  reg [3:0] opcode;
  reg cin;
  wire [3:0] out;
  wire [3:0] out_2;
  wire cout;

  ALU uut (
    .opcode(opcode),
    .a(a),
    .b(b),
    .cin(cin),
    .out(out),
    .out_2(out_2),
    .cout(cout)
  );

  initial begin
    $dumpfile("alu_tb.vcd");
    $dumpvars(0, alu_tb);

    a = 4'b1010; b = 4'b1100; cin = 1'b0;
    opcode = `AND;   #10; // -> out=1000, out_2=0000, cout=0
    opcode = `NAND;  #10; // -> out=0111, out_2=0000, cout=0
    opcode = `OR;    #10; // -> out=1110, out_2=0000, cout=0
    opcode = `NOR;   #10; // -> out=0001, out_2=0000, cout=0
    opcode = `XOR;   #10; // -> out=0110, out_2=0000, cout=0
    opcode = `XNOR;  #10; // -> out=1001, out_2=0000, cout=0
    opcode = `NOT;   #10; // -> out=0101, out_2=0000, cout=0

    a = 4'd3; b = 4'd5; cin = 1'b0;
    opcode = `ADD;   #10; // -> out=1000, out_2=0000, cout=0
    opcode = `SUB;   #10; // -> out=1110, out_2=0000, cout=1

    a = 4'd3; b = 4'd4;
    opcode = `MULT;  #10; // -> out=1100, out_2=0000, cout=0
    opcode = `DIV;   #10; // -> out=0000, out_2=0011, cout=0

    a = 4'b1010; b = 4'b0010; cin = 1'b0;
    opcode = `SHIFT; #10; // -> out=0100, out_2=0001, cout=0

    #10 $finish;

  end
endmodule