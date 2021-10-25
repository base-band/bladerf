module top (
  input   cv_clk2 /* synthesis chip_pin = "H13" */,
  output  led1    /* synthesis chip_pin = "K19" */
);

reg [31:0] run;



always @(posedge cv_clk2) begin
  run <= run + 1;
end
// assign led1 = run[10];

//////////////////////////////////
// hacking in a reset
reg [3:0] run2;
reg myreset;

always @(posedge cv_clk2) begin
    if( run2 == 4'hf ) begin
        myreset <= 0;
    end else begin
        run2 <= run2 + 1;
        myreset <= 1;
    end
end
//////////////////////////////////



parameter VERILATE = 1'b1;


blade_top #(.VERILATE (VERILATE)


        // these need to be uncommented and the paths worked out

        // .SCALAR_MEM_0 (`CS22_SCALAR_0),
        // .SCALAR_MEM_1 (`CS22_SCALAR_1),
        // .SCALAR_MEM_2 (`CS22_SCALAR_2),
        // .SCALAR_MEM_3 (`CS22_SCALAR_3),
        // .VMEM0 (`CS22_VMEM0),
        // .VMEM1 (`CS22_VMEM1),
        // .VMEM2 (`CS22_VMEM2),
        // .VMEM3 (`CS22_VMEM3),
        // .VMEM4 (`CS22_VMEM4),
        // .VMEM5 (`CS22_VMEM5),
        // .VMEM6 (`CS22_VMEM6),
        // .VMEM7 (`CS22_VMEM7),
        // .VMEM8 (`CS22_VMEM8),
        // .VMEM9 (`CS22_VMEM9),
        // .VMEM10 (`CS22_VMEM10),
        // .VMEM11 (`CS22_VMEM11),
        // .VMEM12 (`CS22_VMEM12),
        // .VMEM13 (`CS22_VMEM13),
        // .VMEM14 (`CS22_VMEM14),
        // .VMEM15 (`CS22_VMEM15)
        )
    blade_top (
        .CLK                                (clk),
        .FPGA_LED                           (led1),

        // input
        .t0_data                            (adc_data_out),
        .t0_valid                           (adc_data_out_valid),
        .t0_ready                           (adc_data_out_ready),   // ready
        .t0_last                            (1'b0),

        // output
        .i0_data                            (o_rx_data_eth),
        .i0_valid                           (o_rx_valid_eth),
        .i0_ready                           (i_rx_ready_eth), // ready
        .i0_last                            (),
        .HS_NORTH_IN_RB                     (), // i_ringbus
        .HS_SOUTH_OUT_RB                    (), // o_ringbus

        .MIB_MASTER_RESET (myreset)
  );




endmodule
