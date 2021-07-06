module top (
  input   cv_clk2 /* synthesis chip_pin = "H13" */,
  output  led1    /* synthesis chip_pin = "K19" */
);

reg [31:0] run;

always @(posedge cv_clk2)
  run <= run + 1;

assign led1 = run[10];

endmodule
