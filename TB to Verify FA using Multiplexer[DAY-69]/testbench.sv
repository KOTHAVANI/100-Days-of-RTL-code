// Code your testbench for full adder using multiplexer
`include "interface.sv"
`include "test.sv"

 module testbench;
 
 fulladder_if pif();
 test tb(pif);
 
   fulladder fa(.A(pif.A),.B(pif.B),.Cin(pif.Cin),.SUM(pif.SUM),.CARRY(pif.CARRY));
   
 initial
 begin
 $dumpfile("dump.vcd");
 $dumpvars();
 
 end
 endmodule
