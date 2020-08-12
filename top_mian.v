module top_mian (input     clk,
                 input     rst_n,
					  input     rxd,
					  output    txd,
					  output    [7:0]led,  
					  
					  output    sdram_clk,
					  output    [11:0]sdram_addr,   
				  	  output    [1:0]sdram_ba,     
					  output    sdram_cas_n,  
					  output    sdram_cke,    
					  output    sdram_cs_n,   
					  inout     [15:0]sdram_dq,     
					  output    [1:0]sdram_dqm,    
					  output    sdram_ras_n,  
					  output    sdram_we_n   	 				  
);
//wire define
wire    clk_100m;
wire    clk_100m_shift;

wire    locked;
wire    sys_rst_n;

//
assign sys_rst_n = rst_n & locked;
assign sdram_clk = clk_100m_shift;

    pll u_pll(
	     .inclk0             (clk),
	     .areset             (~rst_n),
	
	     .c0                 (clk_100m),
	     .c1                 (clk_100m_shift),
	     .locked             (locked)
    );
	 
    nios u_nios2 (
        .clk_clk        (clk_100m),      //    clk.clk
		  .reset_reset_n  (sys_rst_n),     //  reset.reset_n
        .uart_0_rxd     (rxd),           // uart_0.rxd
        .uart_0_txd     (txd),           //       .txd
		  
		  .sdram_addr     (sdram_addr),    //  sdram.addr
        .sdram_ba       (sdram_ba),      //       .ba
        .sdram_cas_n    (sdram_cas_n),   //       .cas_n
        .sdram_cke      (sdram_cke),     //       .cke
        .sdram_cs_n     (sdram_cs_n),    //       .cs_n
        .sdram_dq       (sdram_dq),      //       .dq
        .sdram_dqm      (sdram_dqm),     //       .dqm
        .sdram_ras_n    (sdram_ras_n),   //       .ras_n
        .sdram_we_n     (sdram_we_n),    //       .we_n
		  
		  .gpioa_export   (led)            //  gpioa.export
    );

endmodule
