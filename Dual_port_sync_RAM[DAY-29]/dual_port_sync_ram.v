module dual_port_sync_ram (clk, read_en, write_en, reset, rd_addr, wr_addr, data_in, data_out );

parameter ram_width = 8;
parameter addr_size = 4;
parameter ram_depth = 16;

input clk, reset, read_en, write_en;
input [ram_width-1:0] data_in;
input [addr_size-1:0] rd_addr, wr_addr;
output reg [ram_width-1:0] data_out;

integer i;

reg [ram_width-1:0] mem [ram_depth-1:0]; //memory declaration

always @ (posedge clk)
begin
if(reset)
begin
data_out <= 1'b0;
for (i=0; i<ram_depth; i=i+1)
mem[i] <= 0;
end
else
begin
if(write_en) //write operation
begin
mem[wr_addr] <= data_in;
end
if(read_en)  //read operation
begin
data_out <= mem[rd_addr];
end
end
end
endmodule
