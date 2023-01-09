module demux_1_8(input i,input [2:0]s,output [0:7]y);
assign y[0]=(i & ~s[2] & ~s[1]& ~s[0]);
assign y[1]=(i & ~s[2] & ~s[1]& s[0]);
assign y[2]=(i & ~s[2] & s[1]& ~s[0]);
assign y[3]=(i & ~s[2] & s[1]& s[0]);
assign y[4]=(i & s[2] & ~s[1]& ~s[0]);
assign y[5]=(i & s[2] & ~s[1]& s[0]);
assign y[6]=(i & s[2] & s[1]& ~s[0]);
assign y[7]=(i & s[2] & s[1]& s[0]);
endmodule

module Decoder_using_Demux(input A,B,C, output [0:7]Y);
wire [0:7]X;
demux_1_8 DUT(1'b1,{A,B,C},X);
assign Y=~X;
endmodule
