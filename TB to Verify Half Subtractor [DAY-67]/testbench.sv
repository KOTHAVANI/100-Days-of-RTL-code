// Code your testbench for half subtractor
`include "interface.sv"
`include "test.sv"

 module testbench;
 
 hs_if pif();
 test tb(pif);
 
   HS h1(.a(pif.a),.b(pif.b),.borrow(pif.borrow),.difference(pif.difference));
   
 initial
 begin
 $dumpfile("dump.vcd");
 $dumpvars(); 
 end
   
 endmodule
