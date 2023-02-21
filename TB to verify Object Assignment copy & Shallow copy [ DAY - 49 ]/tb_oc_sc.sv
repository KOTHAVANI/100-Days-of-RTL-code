// Testbench for object assignment & shallow copy & deep copy

class Fast_Foods;
  bit [15:0] Friedrice_Price;
  bit [15:0] Noodles_Price  ;
  int manchurian;
  
  function new();
    Friedrice_Price = 100;
    Noodles_Price = 60;
    manchurian = 120;
  endfunction
endclass

//-- class ---    
class spl_ff;
  
  //class properties
  bit [15:0] Egg_Fr_P;
  bit [15:0] Chicken_Noodles_Price  ;
  int veg_manchurian;
  Fast_Foods ff_h; //class handle
  
  //constructor
  function new();
    Egg_Fr_P  = 50;
    Chicken_Noodles_Price  = 60;
    veg_manchurian = 200;
    ff_h = new(); //creating object
  endfunction
  
  //method to display class properties
  function void display();
    $display("---------------------------------------------------------");
    $display("\t Egg_Fr_P   = %0d",Egg_Fr_P);
    $display("\t Chicken_Noodles_Price  = %0d",Chicken_Noodles_Price);
    $display("\t veg_manchurian  = %0d",veg_manchurian);
    $display("\t Friedrice_Price  = %0d",ff_h.Friedrice_Price);
    $display("\t Noodles_Price = %0d",ff_h.Noodles_Price);
    $display("\t manchurian  = %0d",ff_h.manchurian);
    $display("---------------------------------------------------------");
  endfunction
  
endclass

// -- module ---
module class_test;
  spl_ff pkt_1;
  spl_ff pkt_2;
  spl_ff pkt_3;

  initial begin
    
    pkt_1 = new();   //creating pkt_1 object
    $display("\t****  calling pkt_1 display  ****");
    pkt_1.display();
    
    //Shallow copy
    pkt_2 = new pkt_1;   //creating pkt_2 object and copying pkt_1 to pkt_2
    $display("\t****  calling pkt_2 display  ****");
    pkt_2.display();
    pkt_2.Chicken_Noodles_Price = 700;
    
    $display("\t****  calling pkt_2 display after changing pkt_2 properties ****");
    pkt_2.display();
    $display("\t****  calling pkt_1 display after changing pkt_2 properties ****");
    //changes made to pkt_2.ff_h properties reflected on pkt_1.ff_h, so only handle of the object get copied, this is called shallow copy 
    pkt_1.display();
    
    //object assignment
    pkt_3 = new();   //creating pkt_3 object and copying pkt_1 to pkt_3
    $display("\t****  calling pkt_3 display  ****");
    pkt_3 = pkt_1;     //object assignment
    pkt_3.display(); 
    pkt_3.Egg_Fr_P = 280;  //changing values
    pkt_3.Chicken_Noodles_Price = 300;
       
    $display("\t****  calling pkt_3 display after changing pkt_3 properties **** " );
    pkt_3.display(); 
    $display("\t****  calling pkt_1 display after changing pkt_3 properties ****");
    pkt_1.display();  // in object assignment if we change values of pkt_3 it is reflected to pkt_1 also
       
  end 
endmodule
