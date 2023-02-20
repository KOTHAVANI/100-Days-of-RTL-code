// tb interface for alu 

//including interfcae can be done in 2 ways  
// 1. `include "interface.sv"
// 2.  by interface syntax 
interface alu_intf;
  logic  [3:0] a ;
  logic  [3:0] b ;  
  logic  [6:0] c ;
  logic  [6:0] d ;
  logic  [6:0] e ;
  logic  [6:0] f ;
  logic  [6:0] g ;
  logic  [6:0] h ;
  logic  [6:0] i ;
  logic  [6:0] j ;
  logic  [6:0] k ;
  logic  [6:0] l ;
  logic  [6:0] m ;
  logic  [6:0] n ;
endinterface

module tb_alu;
   
  //creatinng instance of interface
  alu_intf i_intf();
  
  //DUT instance, interface signals are connected to the DUT ports
  alu DUT (
    .a(i_intf.a),
    .b(i_intf.b),
    .c(i_intf.c),
    .d(i_intf.d),
    .e(i_intf.e),
    .f(i_intf.f),
    .g(i_intf.g),
    .h(i_intf.h),
    .i(i_intf.i),
    .j(i_intf.j),
    .k(i_intf.k),
    .l(i_intf.l),
    .m(i_intf.m),
    .n(i_intf.n)
   );
  
  initial begin //{
    i_intf.a = 6;
    i_intf.b = 4;
    
    $display("Value of a = %0d, b = %0d",i_intf.a,i_intf.b);
    #5;
    $display(" c = %0d  , d = %0d , e = %0d , f = %0d , g = %0d  , h = %0d , i = %0d , j = %0d , k = %0d , l = %0d , m = %0d , n = %0d " ,i_intf.c, i_intf.d, i_intf.e, i_intf.f, i_intf.g, i_intf.h, i_intf.i, i_intf.j, i_intf.k, i_intf.l, i_intf.m, i_intf.n );
  end //}

  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
endmodule
