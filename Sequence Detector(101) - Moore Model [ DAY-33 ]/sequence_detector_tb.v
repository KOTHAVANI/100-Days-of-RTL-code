module sequence_detector_tb();
		
reg  din,clock,reset;
wire dout;
parameter CYCLE = 10;
integer i;
		
sequence_detector dut(.seq_in(din), .clock(clock), .reset(reset), .det_o(dout));
 
always
begin
#(CYCLE/2);
clock = 1'b0;
#(CYCLE/2);
clock = ~clock;
end

task initialize();
begin
din = 0;
end
endtask
					 
task delay();
begin
#i;
end
endtask

task RESET();
begin
delay(5);
reset=1'b1;
delay(10);
reset=1'b0;
end
endtask

task stimulus(input data);
begin
@(negedge clock);
din = data;
end
endtask				 
   
initial 
$monitor("Reset=%b, state=%b, Din=%b, Output Dout=%b", reset,state,din,dout);
								
always@(state or dout)
begin
if(state==2'b11 && dout==1)
$display("Correct output at state %b", state);
end
		
initial
begin
initialize;
RESET;
stimulus(0);
stimulus(1);
stimulus(0);
stimulus(1);
stimulus(0);
stimulus(1);
stimulus(1);
RESET;
stimulus(1);
stimulus(0);
stimulus(1);
stimulus(1);
delay(10);    
$finish;
end
			  		
endmodule     
