// TB Constraint to generate a dynamic array with random but unique values without using sv unique constraint

class const_eg;
  
rand bit[3:0] my_array[]; //dynamic array of bit[3:0] 
  
constraint c_rand_array { 
my_array.size == 9 ;// or any size constraint 
foreach (my_array[i]) 
if(i >0) my_array[i] > my_array[i-1]; 
} 
  
function void post_randomize(); 
my_array.shuffle(); 
endfunction
 
function void display();
    $display("my_array = %p",my_array);
endfunction
  
endclass

program array_randomization;
  
  const_eg pkt;

  initial begin
    pkt = new();
    pkt.randomize();
    pkt.display();   
  end
  
endprogram 
