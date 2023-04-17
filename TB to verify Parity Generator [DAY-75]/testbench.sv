// Code your testbench here
//top.sv
`include "interface.sv"
`include "test.sv"

 module testbench;
 
 par_gen_if pif();
 test tb(pif);
 
   par_gen f1(.x(pif.x),.y(pif.y),.z(pif.z),.result(pif.result));
 initial
 begin
 $dumpfile("dump.vcd");
 $dumpvars(1);
 
 end
 endmodule
 

