module siso_dff( sin, clk, sout );
output sout ;
input sin ;
input clk ;   
wire w1,w2,w3;

d_flip_flop d0 (.din(sin),.clk(clk),.dout(w1));
d_flip_flop d1 (.din(w1),.clk(clk),.dout(w2));
d_flip_flop d2 (.din(w2),.clk(clk),.dout(w3));
d_flip_flop d3 (.din(w3),.clk(clk),.dout(sout));

endmodule

module d_flip_flop ( din, clk, dout );
output dout ;
reg dout;
input din ;
input clk ; 

always @ (posedge clk)
begin
  dout <= din;
end

endmodule
