#****************************************************************************
#
# SPDX-License-Identifier: MIT-0
# Copyright(c) 2019-2021 Intel Corporation.
#
#****************************************************************************
#
# Sample SDC for Agilex GHRD.
#
#****************************************************************************

set_time_format -unit ns -decimal_places 3
#create_generated_clock -name {soc_inst|subsys_pcie|mcdma|intel_pcie_ptile_mcdma_2|ast_hip|intel_pcie_ptile_ast_hip|inst|inst|maib_and_tile|xcvr_hip_native|rx_ch15} -source {soc_inst|subsys_pcie|mcdma|intel_pcie_ptile_mcdma_2|ast_hip|intel_pcie_ptile_ast_hip|inst|inst|maib_and_tile|z1565a~pld_pcs_rx_clk_out_ch15.reg} -divide_by 1 -multiply_by 1 { soc_inst|subsys_pcie|mcdma|intel_pcie_ptile_mcdma_2|ast_hip|intel_pcie_ptile_ast_hip|inst|inst|maib_and_tile|hdpldadapt_rx_chnl_15|pld_pcs_rx_clk_out1_dcm }
#create_generated_clock -name {soc_inst|iopll|iopll_0_outclk_100} -source {soc_inst|iopll|iopll_0|tennm_pll|refclk[0]} -divide_by 12 -multiply_by 12 -duty_cycle 50.00 { soc_inst|iopll|iopll_0|tennm_pll|outclk[2] }
#set_false_path -from [get_clocks {soc_inst|subsys_pcie|mcdma|intel_pcie_ptile_mcdma_2|ast_hip|intel_pcie_ptile_ast_hip|inst|inst|maib_and_tile|xcvr_hip_native|rx_ch15}] -to [get_clocks {soc_inst|iopll|iopll_0_outclk_100}]
set clk_250 [get_clocks {soc_inst|iopll|iopll_0_clk_250}]
set clk_100 [get_clocks {soc_inst|iopll|iopll_0_clk_100}]
set clk_pcie [get_clocks {soc_inst|subsys_pcie|intel_pcie_ptile_mcdma_0|intel_pcie_ptile_mcdma_0|ast_hip|intel_pcie_ptile_ast_hip|inst|inst|maib_and_tile|xcvr_hip_native|rx_ch15}]
                          
set_clock_groups -asynchronous -group $clk_250 -group $clk_100 -group $clk_pcie