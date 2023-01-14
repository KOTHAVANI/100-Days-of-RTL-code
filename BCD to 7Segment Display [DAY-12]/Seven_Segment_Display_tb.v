module Seven_Segment_Display_tb;

    reg [3:0] bcd;
    wire [7:0] segment;
    integer i;

Seven_Segment_Display dut ( .bcd(bcd),  .segment(segment));

task initialize;
{ bcd } = 0;
endtask

task stimulus;
begin
for(i = 0; i < 16; i = i+1) 
begin 
{ bcd } = i;
#10;
end     
end
endtask

initial
begin
initialize;
stimulus;
$finish();
end

initial
$monitor("{bcd}=%b, {7segment}=%b", {bcd}, {segment});

/*initial begin
        for(i = 0;i < 16;i = i+1) 
        begin
            bcd = i; 
            #10; 
        end     
    end*/

endmodule
