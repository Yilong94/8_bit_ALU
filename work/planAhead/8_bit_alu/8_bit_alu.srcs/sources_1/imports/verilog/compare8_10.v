/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module compare8_10 (
    input [5:0] alufn,
    input z,
    input v,
    input n,
    output reg [7:0] out
  );
  
  
  
  always @* begin
    
    case (alufn[1+1-:2])
      2'h1: begin
        out = z;
      end
      2'h2: begin
        out = n ^ v;
      end
      2'h3: begin
        out = z | (n ^ v);
      end
      default: begin
        out = 1'h0;
      end
    endcase
  end
endmodule
