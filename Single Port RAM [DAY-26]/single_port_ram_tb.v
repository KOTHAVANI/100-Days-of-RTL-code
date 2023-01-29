module single_port_ram_tb();

parameter addr_width = 3;
parameter data_width = 8;
parameter depth = 16;

reg clk,rstn,en,wr_rd;
reg [data_width-1:0]data_in;
reg [addr_width-1:0]addr;
wire [data_width-1:0]data_out;
wire out_en;

reg [data_width-1:0] temp [depth-1:0];
reg [addr_width-1:0]addr_l;
reg [data_width-1:0]data_out_l;

  single_port_ram dut(.clk(clk),.rstn(rstn),.en(en),.addr(addr),.wr_rd(wr_rd),.data_in(data_in),.data_out(data_out),.out_en(out_en));

initial 
begin
clk = 1'b0;
forever #5 clk = ~clk;
end

initial
begin
en = 1'b1;
rstn = 1'b0;
#10;
rstn = 1'b1;
end

task write_mem();
begin
wr_rd = 1;
addr = $random;
data_in = $random;
addr_l = addr;
temp[addr_l] = data_in;
$display ("write packet : en = %h, wr_rd = %h, addr = %h, data_in = %h",en,wr_rd,addr,data_in);
end
endtask
 
task read_mem();
begin
wr_rd = 0;
addr = addr_l;
wait (out_en)
data_out_l = data_out;
$display ("read packet : en = %h, wr_rd = %h, addr = %h, data_out = %h",en,wr_rd,addr,data_out);
end
endtask

task comp();
if (temp [addr_l] == data_out_l)
begin
$display("Ram is Passed");
$display("temp[%h] = %h, data_out_l = %h",addr_l,temp[addr_l],data_out_l);
end
else
begin
$display("Ram is Failed");
$display("temp[%h] = %h, data_out_l = %h",addr_l,temp[addr_l],data_out_l);
end
endtask

initial
begin
repeat(10) begin
write_mem();
#50;
read_mem();
comp();
end
end

initial
begin
#1000;
$finish;
end

endmodule
