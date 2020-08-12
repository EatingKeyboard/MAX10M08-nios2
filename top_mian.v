module top_mian (input    clk,
                 input    rst_n,
					  input    rxd,
					  output   txd  
);
//wire define
wire    clk_100m;
wire    clk_100m_shift;

wire    locked;
wire    sys_rst_n;

//
assign sys_rst_n = rst_n & locked;
//assign sdram_clk = clk_100m_shift;

    pll u_pll(
	     .inclk0             (clk),
	     .areset             (~rst_n),
	
	     .c0                 (clk_100m),
	     .c1                 (clk_100m_shift),
	     .locked             (locked)
    );
	 
    nios u0_nios2 (
        .clk_clk        (clk_100m),   //    clk.clk
		  .reset_reset_n  (sys_rst_n),  //  reset.reset_n
        .uart_0_rxd     (rxd),        // uart_0.rxd
        .uart_0_txd     (txd)         //       .txd
    );

endmodule
