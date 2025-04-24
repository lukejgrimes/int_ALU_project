module _2x4_shift (
  input  wire [3:0] a,   // data in
  input  wire [3:0] b,   // [0]=dir, [3]=fill
  output wire [3:0] out, // shifted result
  output wire [3:0] y    // “overflow” (bit shifted off, zero-padded)
);

  // If b[0]==0: shift left by 1, fill LSB with b[3], overflow=y[0]=a[3]
  // If b[0]==1: shift right by 1, fill MSB with b[3], overflow=y[3]=a[0]
  assign out = b[0]
               ? { b[3],   a[3:1] }  // right
               : { a[2:0], b[3]   }  // left
  ;
  assign y   = b[0]
               ? { a[0], 3'b000 }    // right-shift overflow
               : { 3'b000, a[3] }    // left-shift overflow
  ;
endmodule