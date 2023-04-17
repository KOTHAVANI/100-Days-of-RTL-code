// Code your testbench for demultiplexer
//top.sv
`include "interface.sv"
`include "test.sv"

 module testbench;
 
 demux_if pif();
 test tb(pif);
 
   demux m1(.d(pif.d),.sel(pif.sel),.y(pif.y));
 initial
 begin
 $dumpfile("dump.vcd");
 $dumpvars(1); 
 end
   
 endmodule
