module test_v2();

  parameter WIDTH = 32;
  parameter DEPTH_LEN = 4;
  
  reg i_clk, i_rst_n;
  reg [WIDTH-1:0] i_data;
  reg wr_en, rd_en;
  wire [WIDTH-1:0] o_data;
  wire o_full;
  wire o_empty;
  
  syncFIFO_v2 #( .WIDTH(4), .DEPTH_LEN(4)) DUT (
                    .i_clk(i_clk), .i_rst_n(i_rst_n), .i_data(i_data), .wr_en(wr_en),
                    .rd_en(rd_en), .o_data(o_data), .o_full(o_full), .o_empty(o_empty)
                     );

  initial begin
    // below two lines are used to show waveform
    $dumpfile("dump.vcd");
    $dumpvars;
  end

  initial begin
    i_clk = 1'b0;
    i_rst_n = 1'b0;
    wr_en = 1'b0;
    rd_en = 1'b0;
    i_data = 32'h00000000;
    #100 i_rst_n = 1'b1;

    write_task;
    #20;
      @(negedge i_clk);
    wr_en = 1'b0;
    read_task;
    #10;
    write_task;
    #100 $finish;
  end

  always #5 i_clk <= ~i_clk;

  task write_task;
  begin
    @(negedge i_clk);
    wr_en = 1'b1;
    repeat(10)
    begin
      @(negedge i_clk);
        i_data = $urandom($random)%16;
      @(posedge i_clk);
  // 		$display(" FIFO WRITE DATA");
  // 		$display("in data:  %d", i_data);
    end
  end
endtask

  task read_task;
  begin
    @(negedge i_clk);
    rd_en = 1'b1;
    repeat(10)
    begin
      @(posedge i_clk);
      @(posedge i_clk);
  // 		$display(" FIFO READ DATA");
  //       $display("rd data: ", $time);
  // 		$display("out data:  %d", o_data);
    end
  end
endtask

endmodule
