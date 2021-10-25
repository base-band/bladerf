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


`define BLADE_SCALAR_0       "mem/loopback/scalar0.mif"
`define BLADE_SCALAR_1       "mem/loopback/scalar1.mif"
`define BLADE_SCALAR_2       "mem/loopback/scalar2.mif"
`define BLADE_SCALAR_3       "mem/loopback/scalar3.mif"
`define BLADE_VMEM0          "mem/loopback/vmem0.mif"
`define BLADE_VMEM1          "mem/loopback/vmem1.mif"
`define BLADE_VMEM2          "mem/loopback/vmem2.mif"
`define BLADE_VMEM3          "mem/loopback/vmem3.mif"
`define BLADE_VMEM4          "mem/loopback/vmem4.mif"
`define BLADE_VMEM5          "mem/loopback/vmem5.mif"
`define BLADE_VMEM6          "mem/loopback/vmem6.mif"
`define BLADE_VMEM7          "mem/loopback/vmem7.mif"
`define BLADE_VMEM8          "mem/loopback/vmem8.mif"
`define BLADE_VMEM9          "mem/loopback/vmem9.mif"
`define BLADE_VMEM10         "mem/loopback/vmem10.mif"
`define BLADE_VMEM11         "mem/loopback/vmem11.mif"
`define BLADE_VMEM12         "mem/loopback/vmem12.mif"
`define BLADE_VMEM13         "mem/loopback/vmem13.mif"
`define BLADE_VMEM14         "mem/loopback/vmem14.mif"
`define BLADE_VMEM15         "mem/loopback/vmem15.mif"


blade_top #(
        .VERILATE (VERILATE),
        .SCALAR_MEM_0 (`BLADE_SCALAR_0),
        .SCALAR_MEM_1 (`BLADE_SCALAR_1),
        .SCALAR_MEM_2 (`BLADE_SCALAR_2),
        .SCALAR_MEM_3 (`BLADE_SCALAR_3),
        .VMEM0 (`BLADE_VMEM0),
        .VMEM1 (`BLADE_VMEM1),
        .VMEM2 (`BLADE_VMEM2),
        .VMEM3 (`BLADE_VMEM3),
        .VMEM4 (`BLADE_VMEM4),
        .VMEM5 (`BLADE_VMEM5),
        .VMEM6 (`BLADE_VMEM6),
        .VMEM7 (`BLADE_VMEM7),
        .VMEM8 (`BLADE_VMEM8),
        .VMEM9 (`BLADE_VMEM9),
        .VMEM10 (`BLADE_VMEM10),
        .VMEM11 (`BLADE_VMEM11),
        .VMEM12 (`BLADE_VMEM12),
        .VMEM13 (`BLADE_VMEM13),
        .VMEM14 (`BLADE_VMEM14),
        .VMEM15 (`BLADE_VMEM15)
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
