// Code your design here
module demux(d,sel,y);
  input  d;
  input [1:0] sel;
  output reg [3:0]  y;
  
  always @(*)
    begin
      case(sel)
        2'b00: begin
          y[0]=d; 
          y[3:1] = 0;
        end
        2'b01: begin
          y[1]=d; 
          y[0] = 0;
        end
        2'b10:
          begin
            y[2]=d; 
            y[1:0] = 0;
          end
        2'b11:
          begin
            y[3]=d; 
            y[2:0] = 0;
          end 
      endcase
    end
endmodule
