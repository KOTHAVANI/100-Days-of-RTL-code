module dual_port_sync_ram_tb;

parameter ram_width = 8;
parameter addr_size = 4;
parameter ram_depth = 16;

reg clk, reset, read_en, write_en;
reg [ram_width-1:0] data_in;
reg [addr_size-1:0] rd_addr, wr_addr;
wire [ram_width-1:0] data_out;

integer i;

dual_port_sync_ram dut (.clk(clk), .reset(reset), .data_in(data_in), .rd_addr(rd_addr), .wr_addr(wr_addr), .read_en(read_en), .write_en(write_en), .data_out(data_out));
    
always #5 clk = ~clk;

initial 
begin
clk = 1;
rd_addr = 0;
read_en = 0;
write_en = 0;
reset = 0;
data_in = 0;
wr_addr = 0;  
#20;
//Write all the locations of RAM
write_en = 1;  
//reset = 1;
for(i=1; i <= 16; i = i + 1)
begin
data_in = i;
wr_addr = i-1;
#10;
end
write_en = 0;  
read_en = 1;  //read 
for(i=1; i <= 16; i = i + 1)
begin
rd_addr = i-1;
#10;
end
read_en = 0;
end

initial
begin
$monitor("Values of read_en=%b,write_en=%b, data_in=%b, data_out=%b ",read_en, write_en, data_in, data_out);
end
	  
endmodule
