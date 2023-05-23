//TB Constraint to generate a pattern 01112131415161718191 
  
module tb;

class const_eg;
  rand int x[];
  constraint size{x.size==20;}
  constraint ran{foreach(x[i])
    if(i%2!=0)
      x[i]==1;
                  else
      x[i] == (i+1)/2;}
endclass

const_eg r_h=new();
  
initial begin
  assert(r_h.randomize());
  $display("%p",r_h);
end
  
endmodule
