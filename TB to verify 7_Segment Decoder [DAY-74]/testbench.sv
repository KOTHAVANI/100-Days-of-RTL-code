// Code your testbench 
//top.sv
`include "interface.sv"
`include "test.sv"

 module testbench;
 
 Seven_Segment_Display_if pif();
 test tb(pif);
 
   Seven_Segment_Display  d1(.bcd(pif.bcd),.segment(pif.segment));
   
 initial
 begin
 $dumpfile("dump.vcd");
 $dumpvars(1); 
 end
   
 endmodule
