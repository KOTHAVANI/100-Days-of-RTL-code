module Priority_Encoder_tb();
 
reg [7:0] in;
reg en;
wire [2:0] out;
 
Priority_Encoder dut(.out(out), .en(en), .in(in));

initial 
begin
 in = 0;
 en = 1;
 #10;        
 #10 in = 8'b00001001;
 #10 in = 8'b00000001;
 #10 in = 8'b01100110;
 #10 in = 8'b00010010;
 #10 in = 8'b00000011;
 #10 in = 8'b00110011;
 #10 in = 8'b00000100;
 end
 
 initial
 begin
 $monitor(" en = %b : in = %b : out = %b ", en, in, out ); 
 end
 
endmodule
