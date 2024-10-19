/*
 * Copyright (c) 2024 Jay Ell
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_counter (
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
//    output wire [7:0] uo_out,   // Dedicated outputs 
//    input  wire [7:0] uio_in,   // IOs: Input path
//    output wire [7:0] uio_out,  // IOs: Output path
//    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       clk,      // clock
    input  wire       rst_n,    // reset_n - low to reset   
    input  wire       load,     // counter load pulse - high to load
    output wire [3:0] c_out,    // counter state
    input wire [3:0] c_in,    // load value
    output wire Q0,
    output wire Q1,
    output wire Q2,
    output wire Q3
);

  // All output pins must be assigned. If not used, assign to 0.
  
  always @ (posedge clk)
    if (~rst_n)
      c_out <= 0;
    else if (load)
      c_out <= c_in;
    else
      c_out <= c_out+1;
      
     assign Q0=c_out[0];
     assign Q1=c_out[1];
     assign Q2=c_out[2];
     assign Q3=c_out[3];

  // List all unused inputs to prevent warnings
//     wire _unused = &{ena, uio_in[7:0]};

endmodule
