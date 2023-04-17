// Code your testbench for SV Callback

`include "driver.sv"

class env;
  bit inject_err;
  driver drv;
  err_driver drv_err;
  
  function new();
    drv = new();
    drv_err = new();
  endfunction
  
  task execute;
    if(inject_err) drv = drv_err;
    // Sending a packet
    drv.pkt_sender();
    $display("Sending packet = %s", drv.pkt.name());
  endtask
endclass

module callback_example();
  env env_o;
  initial begin
    // Sending GOOD packet
    env_o = new();
    env_o.inject_err = 0;
    repeat(5) env_o.execute;
    
    // Injecting an error
    env_o = new();
    env_o.inject_err = 1;
    repeat(5) env_o.execute;
    
    // Sending GOOD packet
    env_o = new();
    env_o.inject_err = 0;
    repeat(5) env_o.execute;
  end
endmodule
