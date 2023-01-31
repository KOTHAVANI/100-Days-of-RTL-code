module freq_div_odd
#(parameter N=7)
(
  input   clk_in,
  output   clk_out
);

//4-bit counter
reg  [3:0] count = 4'b0;        
reg     A1 = 0;
reg       B1 = 0;
reg     Tff_A = 0;
reg    Tff_B = 0;
wire    clock_out;
wire    wTff_A;
wire    wTff_B;

//Connects registers to wires for combinational logic
assign   wTff_A  = Tff_A; 
assign   wTff_B  = Tff_B; 
//XOR gate 
assign   clk_out = wTff_B ^ wTff_A; 

//Counter for division by N
always@(posedge clk_in)
 begin
  if(count == N-1) //Count to N-1. 
   begin          
    count <= 4'b0000;
   end 
  else
   begin
    count <= count + 1;
   end 
 end

//Set A to high for one clock cycle when counter is 0
always@(posedge clk_in)
 begin
  if(count == 4'b0000)
   A1 <= 1;
  else
   A1 <= 0;
 end

//Sets B to high for one clock cycle when counter is (N+1)/2
always@(posedge clk_in)
 begin
  if(count == (N+1)/2) //Use (N+1)/2
   B1 <= 1; 
  else
   B1 <= 0;
 end

//T flip flop toggles 
always@(negedge A1) // Toggle signal Tff_A 
 begin   //whenever A1 goes from 1 to 0
  Tff_A <= ~Tff_A;
 end

always@(negedge clk_in)
 begin
  if(B1) // Toggle signal Tff_B whenever      
   begin //B1 is 1
    Tff_B <= ~Tff_B;
   end
 end

endmodule
