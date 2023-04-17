// Code your testbench for transmission gate
//top.sv
`include "interface.sv"
`include "test.sv"

 module testbench;
 
 transmissiongate_if pif();
 test tb(pif);
 
   transmissiongate f1(.a(pif.a),.control(pif.control),.y(pif.y));
   
 initial
 begin
 $dumpfile("dump.vcd");
 $dumpvars(1);
 
 end
 endmodule
 

