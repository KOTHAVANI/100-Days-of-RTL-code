module single_port_ram(clk,rstn,en,addr,wr_rd,data_in,data_out,out_en);

parameter addr_width = 3;
parameter data_width = 8;
parameter depth = 16;

input clk,rstn,en,wr_rd;
input [data_width-1:0]data_in;
input [addr_width-1:0]addr;
output reg [data_width-1:0]data_out;
output reg out_en;

integer i;

reg [data_width-1:0] mem [depth-1:0]; //memory declaration

always @(posedge clk)
if(en)
begin
if(!rstn)
begin
data_out <= 1'b0;
for (i=0;i<(2**addr_width);i=i+1)
begin
mem[i]=0;
end
//$display ("mem = %p",mem);
end
else
begin
if(wr_rd == 1) //write operation
begin
mem[addr] <= data_in;
end
else  //read operation
begin
data_out <= mem[addr];
out_en <= 1;
@ (posedge clk);
out_en <= 0;
end
end
end
else
$display("ram is disabled");
endmodule
