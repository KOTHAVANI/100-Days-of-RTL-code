module Universal_Shift_Register(DATAOUT, clock, reset, MODE, DATAIN);
  output reg [3:0] DATAOUT;
  input clock, reset;
  input [1:0] MODE;
  input [3:0] DATAIN;
  
  always @(posedge clock)
  begin
    if(reset)
      DATAOUT <= 0;
    else
      begin
        case(MODE)
          2'b00 : DATAOUT <= DATAOUT;      // locked mode, do nothing
          2'b01 : DATAOUT <= {DATAIN[0], DATAIN[3:1]};//DATAOUT >> 1; 
          2'b10 : DATAOUT <= {DATAIN[2:0], DATAIN[3]};//DATAOUT << 1; 
          2'b11 : DATAOUT <= DATAIN;       // parallel in parallel out
        endcase
      end
  end
  
endmodule 
