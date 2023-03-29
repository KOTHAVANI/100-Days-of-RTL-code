// Code your testbench for full subtractor
`include "interface.sv"
`include "test.sv"

 module testbench;
 
 fs_if pif();
 test tb(pif);
 
   FS f1(.a(pif.a),.b(pif.b),.difference(pif.difference),.bin(pif.bin),.borrow(pif.borrow));
   
 initial
 begin
 $dumpfile("dump.vcd");
 $dumpvars(); 
 end
   
 endmodule
