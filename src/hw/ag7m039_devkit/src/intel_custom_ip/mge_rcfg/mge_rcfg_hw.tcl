#****************************************************************************
#
# (C) 2019-2020 Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions and other 
# software and tools, and its AMPP partner logic functions, and any output 
# files from any of the foregoing (including device programming or simulation 
# files), and any associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License Subscription 
# Agreement, Intel FPGA IP License Agreement, or other applicable 
# license agreement, including, without limitation, that your use is for the 
# sole purpose of programming logic devices manufactured by Intel and sold by 
# Intel or its authorized distributors.  Please refer to the applicable 
# agreement for further details.
#
#****************************************************************************
#
# mge_rcfg "Intel MGE Reconfig" v1.0
# 
#****************************************************************************

package require -exact qsys 13.0


# 
# module mge_rcfg
# 
set_module_property DESCRIPTION                     "MGE Reconfig"
set_module_property NAME                            mge_rcfg
set_module_property VERSION                         19.1.0
set_module_property INTERNAL                        false
set_module_property OPAQUE_ADDRESS_MAP              true
set_module_property GROUP                           "Example Designs/Ethernet/Misc"
set_module_property AUTHOR                          "Intel Corporation"
set_module_property DISPLAY_NAME                    "MGE Reconfig"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE    true
set_module_property EDITABLE                        true
set_module_property ANALYZE_HDL                     false
set_module_property REPORT_TO_TALKBACK              false
set_module_property ALLOW_GREYBOX_GENERATION        false
set_module_property ELABORATION_CALLBACK            elaboration


# 
# file sets
#
add_fileset             synthesis_fileset       QUARTUS_SYNTH       proc_add_source_file 
set_fileset_property    synthesis_fileset       TOP_LEVEL           mge_rcfg_top

add_fileset             sim_verilog_fileset     SIM_VERILOG         proc_add_source_file
set_fileset_property    sim_verilog_fileset     TOP_LEVEL           mge_rcfg_top 

add_fileset             sim_vhdl_fileset        SIM_VHDL            proc_add_source_file
set_fileset_property    sim_vhdl_fileset        TOP_LEVEL           mge_rcfg_top 

proc proc_add_source_file { entity_name } {
add_fileset_file        mge_rcfg_top.sv         SYSTEM_VERILOG PATH    "mge_rcfg_top.sv"
add_fileset_file        mge_rcfg_fsm.sv         SYSTEM_VERILOG PATH    "mge_rcfg_fsm.sv"
add_fileset_file        alt_mge_phy_reconfig_parameters_CFG0.mif  MIF            PATH        "alt_mge_phy_reconfig_parameters_CFG0.mif"
add_fileset_file        alt_mge_phy_reconfig_parameters_CFG0.sv   SYSTEM_VERILOG PATH    "alt_mge_phy_reconfig_parameters_CFG0.sv"
add_fileset_file        alt_mge_phy_reconfig_parameters_CFG1.mif  MIF            PATH        "alt_mge_phy_reconfig_parameters_CFG1.mif"
add_fileset_file        alt_mge_phy_reconfig_parameters_CFG1.sv   SYSTEM_VERILOG PATH    "alt_mge_phy_reconfig_parameters_CFG1.sv"
add_fileset_file        alt_mge_rcfg_ch_recal.v                   VERILOG        PATH    "alt_mge_rcfg_ch_recal.v"
add_fileset_file        alt_mge_rcfg_mif_master.v                 VERILOG        PATH    "alt_mge_rcfg_mif_master.v"
add_fileset_file        alt_mge_rcfg_mif_rom.v                    VERILOG        PATH    "alt_mge_rcfg_mif_rom.v"
add_fileset_file        alt_mge_rcfg.sv                           SYSTEM_VERILOG PATH    "alt_mge_rcfg.sv"
add_fileset_file        alt_mge_rcfg_txpll_switch.v               VERILOG        PATH    "alt_mge_rcfg_txpll_switch.v"
}

# 
# parameters
#
# SYSTEM_INFO parameter to obtain device_family
add_parameter           DEVICE_FAMILY STRING ""
set_parameter_property  DEVICE_FAMILY SYSTEM_INFO "DEVICE_FAMILY"
set_parameter_property  DEVICE_FAMILY VISIBLE false

add_parameter           NUM_OF_CHANNEL  INTEGER         2
set_parameter_property  NUM_OF_CHANNEL  DISPLAY_NAME    "Number of Channels"
set_parameter_property  NUM_OF_CHANNEL  ALLOWED_RANGES  {"1" "2"}
set_parameter_property  NUM_OF_CHANNEL  HDL_PARAMETER   true

# SYSTEM_INFO parameter to obtain clockrate
add_parameter           clockRate   INTEGER             0
set_parameter_property  clockRate   DISPLAY_NAME        {clockRate}
set_parameter_property  clockRate   VISIBLE             {0}
set_parameter_property  clockRate   HDL_PARAMETER       {0}
set_parameter_property  clockRate   SYSTEM_INFO         {CLOCK_RATE clock_sink}
set_parameter_property  clockRate   SYSTEM_INFO_TYPE    {CLOCK_RATE}
set_parameter_property  clockRate   SYSTEM_INFO_ARG     {clock_sink}

proc is_dual_channel {parameter} {
    if {[get_parameter_value $parameter] == "2"} {
	return 1
    } else {
	return 0
    }
}

proc get_avmm_width {parameter} {
    if {[get_parameter_value $parameter] == "2"} {
	return 12
    } else {
	return 11
    }
}

# ------------------------------------------------------------------------------
# Elaboration Callback
# ------------------------------------------------------------------------------
proc elaboration {} {
# 
# connection point DMA_Handshaking
#
    if { [is_dual_channel NUM_OF_CHANNEL] } {
        # 
        # connection point tx_cal_busy_chan2
        # 
        add_interface tx_cal_busy_chan2 conduit end
        set_interface_property tx_cal_busy_chan2 associatedClock ""
        set_interface_property tx_cal_busy_chan2 associatedReset ""
        set_interface_property tx_cal_busy_chan2 ENABLED true
        set_interface_property tx_cal_busy_chan2 EXPORT_OF ""
        set_interface_property tx_cal_busy_chan2 PORT_NAME_MAP ""
        set_interface_property tx_cal_busy_chan2 CMSIS_SVD_VARIABLES ""
        set_interface_property tx_cal_busy_chan2 SVD_ADDRESS_GROUP ""
        
        add_interface_port tx_cal_busy_chan2 tx_cal_busy_chan2 tx_cal_busy Input 1
        
        # 
        # connection point rx_cal_busy_chan2
        # 
        add_interface rx_cal_busy_chan2 conduit end
        set_interface_property rx_cal_busy_chan2 associatedClock ""
        set_interface_property rx_cal_busy_chan2 associatedReset ""
        set_interface_property rx_cal_busy_chan2 ENABLED true
        set_interface_property rx_cal_busy_chan2 EXPORT_OF ""
        set_interface_property rx_cal_busy_chan2 PORT_NAME_MAP ""
        set_interface_property rx_cal_busy_chan2 CMSIS_SVD_VARIABLES ""
        set_interface_property rx_cal_busy_chan2 SVD_ADDRESS_GROUP ""
        
        add_interface_port rx_cal_busy_chan2 rx_cal_busy_chan2 rx_cal_busy Input 1

        # 
        # connection point tx_cal_busy_chan2_out
        # 
        add_interface tx_cal_busy_chan2_out conduit end
        set_interface_property tx_cal_busy_chan2_out associatedClock ""
        set_interface_property tx_cal_busy_chan2_out associatedReset ""
        set_interface_property tx_cal_busy_chan2_out ENABLED true
        set_interface_property tx_cal_busy_chan2_out EXPORT_OF ""
        set_interface_property tx_cal_busy_chan2_out PORT_NAME_MAP ""
        set_interface_property tx_cal_busy_chan2_out CMSIS_SVD_VARIABLES ""
        set_interface_property tx_cal_busy_chan2_out SVD_ADDRESS_GROUP ""
        
        add_interface_port tx_cal_busy_chan2_out tx_cal_busy_chan2_out tx_cal_busy Output 1

        # 
        # connection point rx_cal_busy_chan2_out
        # 
        add_interface rx_cal_busy_chan2_out conduit end
        set_interface_property rx_cal_busy_chan2_out associatedClock ""
        set_interface_property rx_cal_busy_chan2_out associatedReset ""
        set_interface_property rx_cal_busy_chan2_out ENABLED true
        set_interface_property rx_cal_busy_chan2_out EXPORT_OF ""
        set_interface_property rx_cal_busy_chan2_out PORT_NAME_MAP ""
        set_interface_property rx_cal_busy_chan2_out CMSIS_SVD_VARIABLES ""
        set_interface_property rx_cal_busy_chan2_out SVD_ADDRESS_GROUP ""
        
        add_interface_port rx_cal_busy_chan2_out rx_cal_busy_chan2_out rx_cal_busy Output 1

        # 
        # connection point xcvr_mode_chan2
        # 
        add_interface xcvr_mode_chan2 conduit end
        set_interface_property xcvr_mode_chan2 associatedClock ""
        set_interface_property xcvr_mode_chan2 associatedReset ""
        set_interface_property xcvr_mode_chan2 ENABLED true
        set_interface_property xcvr_mode_chan2 EXPORT_OF ""
        set_interface_property xcvr_mode_chan2 PORT_NAME_MAP ""
        set_interface_property xcvr_mode_chan2 CMSIS_SVD_VARIABLES ""
        set_interface_property xcvr_mode_chan2 SVD_ADDRESS_GROUP ""
        
        add_interface_port xcvr_mode_chan2 xcvr_mode_chan2 export Output 2

        # 
        # connection point mge_chan2_resetn
        # 
        add_interface mge_chan2_resetn reset start
        set_interface_property mge_chan2_resetn associatedClock clock
        set_interface_property mge_chan2_resetn associatedDirectReset ""
        set_interface_property mge_chan2_resetn associatedResetSinks reset_sink
        set_interface_property mge_chan2_resetn synchronousEdges DEASSERT
        set_interface_property mge_chan2_resetn ENABLED true
        set_interface_property mge_chan2_resetn EXPORT_OF ""
        set_interface_property mge_chan2_resetn PORT_NAME_MAP ""
        set_interface_property mge_chan2_resetn CMSIS_SVD_VARIABLES ""
        set_interface_property mge_chan2_resetn SVD_ADDRESS_GROUP ""
        
        add_interface_port mge_chan2_resetn mge_chan2_resetn reset_n Output 1
        
        # 
        # connection point pll_select_chan2
        # 
        add_interface pll_select_chan2 conduit end
        set_interface_property pll_select_chan2 associatedClock ""
        set_interface_property pll_select_chan2 associatedReset ""
        set_interface_property pll_select_chan2 ENABLED true
        set_interface_property pll_select_chan2 EXPORT_OF ""
        set_interface_property pll_select_chan2 PORT_NAME_MAP ""
        set_interface_property pll_select_chan2 CMSIS_SVD_VARIABLES ""
        set_interface_property pll_select_chan2 SVD_ADDRESS_GROUP ""
        
        add_interface_port pll_select_chan2 pll_select_chan2 pll_select Output 1

    } else {
                # 
        # connection point tx_cal_busy_chan2
        # 
        add_interface tx_cal_busy_chan2 conduit end
        set_interface_property tx_cal_busy_chan2 associatedClock ""
        set_interface_property tx_cal_busy_chan2 associatedReset ""
        set_interface_property tx_cal_busy_chan2 ENABLED true
        set_interface_property tx_cal_busy_chan2 EXPORT_OF ""
        set_interface_property tx_cal_busy_chan2 PORT_NAME_MAP ""
        set_interface_property tx_cal_busy_chan2 CMSIS_SVD_VARIABLES ""
        set_interface_property tx_cal_busy_chan2 SVD_ADDRESS_GROUP ""
        
        add_interface_port tx_cal_busy_chan2 tx_cal_busy_chan2 tx_cal_busy Input 1
        
        # 
        # connection point rx_cal_busy_chan2
        # 
        add_interface rx_cal_busy_chan2 conduit end
        set_interface_property rx_cal_busy_chan2 associatedClock ""
        set_interface_property rx_cal_busy_chan2 associatedReset ""
        set_interface_property rx_cal_busy_chan2 ENABLED true
        set_interface_property rx_cal_busy_chan2 EXPORT_OF ""
        set_interface_property rx_cal_busy_chan2 PORT_NAME_MAP ""
        set_interface_property rx_cal_busy_chan2 CMSIS_SVD_VARIABLES ""
        set_interface_property rx_cal_busy_chan2 SVD_ADDRESS_GROUP ""
        
        add_interface_port rx_cal_busy_chan2 rx_cal_busy_chan2 rx_cal_busy Input 1

        # 
        # connection point tx_cal_busy_chan2_out
        # 
        add_interface tx_cal_busy_chan2_out conduit end
        set_interface_property tx_cal_busy_chan2_out associatedClock ""
        set_interface_property tx_cal_busy_chan2_out associatedReset ""
        set_interface_property tx_cal_busy_chan2_out ENABLED true
        set_interface_property tx_cal_busy_chan2_out EXPORT_OF ""
        set_interface_property tx_cal_busy_chan2_out PORT_NAME_MAP ""
        set_interface_property tx_cal_busy_chan2_out CMSIS_SVD_VARIABLES ""
        set_interface_property tx_cal_busy_chan2_out SVD_ADDRESS_GROUP ""
        
        add_interface_port tx_cal_busy_chan2_out tx_cal_busy_chan2_out tx_cal_busy Output 1

        # 
        # connection point rx_cal_busy_chan2_out
        # 
        add_interface rx_cal_busy_chan2_out conduit end
        set_interface_property rx_cal_busy_chan2_out associatedClock ""
        set_interface_property rx_cal_busy_chan2_out associatedReset ""
        set_interface_property rx_cal_busy_chan2_out ENABLED true
        set_interface_property rx_cal_busy_chan2_out EXPORT_OF ""
        set_interface_property rx_cal_busy_chan2_out PORT_NAME_MAP ""
        set_interface_property rx_cal_busy_chan2_out CMSIS_SVD_VARIABLES ""
        set_interface_property rx_cal_busy_chan2_out SVD_ADDRESS_GROUP ""
        
        add_interface_port rx_cal_busy_chan2_out rx_cal_busy_chan2_out rx_cal_busy Output 1

        # 
        # connection point xcvr_mode_chan2
        # 
        add_interface xcvr_mode_chan2 conduit end
        set_interface_property xcvr_mode_chan2 associatedClock ""
        set_interface_property xcvr_mode_chan2 associatedReset ""
        set_interface_property xcvr_mode_chan2 ENABLED true
        set_interface_property xcvr_mode_chan2 EXPORT_OF ""
        set_interface_property xcvr_mode_chan2 PORT_NAME_MAP ""
        set_interface_property xcvr_mode_chan2 CMSIS_SVD_VARIABLES ""
        set_interface_property xcvr_mode_chan2 SVD_ADDRESS_GROUP ""
        
        add_interface_port xcvr_mode_chan2 xcvr_mode_chan2 export Output 2
        
        # 
        # connection point mge_chan2_resetn
        # 
        add_interface mge_chan2_resetn reset start
        set_interface_property mge_chan2_resetn associatedClock clock
        set_interface_property mge_chan2_resetn associatedDirectReset ""
        set_interface_property mge_chan2_resetn associatedResetSinks reset_sink
        set_interface_property mge_chan2_resetn synchronousEdges DEASSERT
        set_interface_property mge_chan2_resetn ENABLED true
        set_interface_property mge_chan2_resetn EXPORT_OF ""
        set_interface_property mge_chan2_resetn PORT_NAME_MAP ""
        set_interface_property mge_chan2_resetn CMSIS_SVD_VARIABLES ""
        set_interface_property mge_chan2_resetn SVD_ADDRESS_GROUP ""
        
        add_interface_port mge_chan2_resetn mge_chan2_resetn reset_n Output 1
        
        # 
        # connection point pll_select_chan2
        # 
        add_interface pll_select_chan2 conduit end
        set_interface_property pll_select_chan2 associatedClock ""
        set_interface_property pll_select_chan2 associatedReset ""
        set_interface_property pll_select_chan2 ENABLED true
        set_interface_property pll_select_chan2 EXPORT_OF ""
        set_interface_property pll_select_chan2 PORT_NAME_MAP ""
        set_interface_property pll_select_chan2 CMSIS_SVD_VARIABLES ""
        set_interface_property pll_select_chan2 SVD_ADDRESS_GROUP ""
        
        add_interface_port pll_select_chan2 pll_select_chan2 pll_select Output 1
        
        set_port_property       tx_cal_busy_chan2        termination true
        set_port_property       rx_cal_busy_chan2        termination true
        set_port_property       tx_cal_busy_chan2_out    termination true
        set_port_property       rx_cal_busy_chan2_out    termination true
        set_port_property       xcvr_mode_chan2          termination true
        set_port_property       mge_chan2_resetn         termination true
        set_port_property       pll_select_chan2         termination true
        
        set_port_property       tx_cal_busy_chan2        termination_value   0
        set_port_property       rx_cal_busy_chan2        termination_value   0
    }
    
    # 
    # connection point reconfig_xcvr_master
    # 
    add_interface reconfig_xcvr_master avalon start
    set_interface_property reconfig_xcvr_master addressUnits WORDS
    set_interface_property reconfig_xcvr_master associatedClock clock
    set_interface_property reconfig_xcvr_master associatedReset reset_sink
    set_interface_property reconfig_xcvr_master bitsPerSymbol 8
    set_interface_property reconfig_xcvr_master burstOnBurstBoundariesOnly false
    set_interface_property reconfig_xcvr_master burstcountUnits WORDS
    set_interface_property reconfig_xcvr_master maximumPendingReadTransactions 0
    set_interface_property reconfig_xcvr_master maximumPendingWriteTransactions 0
    set_interface_property reconfig_xcvr_master timingUnits Cycles
    set_interface_property reconfig_xcvr_master waitrequestAllowance 0
    set_interface_property reconfig_xcvr_master writeWaitTime 0
    set_interface_property reconfig_xcvr_master ENABLED true
    
    add_interface_port reconfig_xcvr_master reconfig_xcvr_master_address address Output [get_avmm_width NUM_OF_CHANNEL]
    add_interface_port reconfig_xcvr_master reconfig_xcvr_master_read read Output 1
    add_interface_port reconfig_xcvr_master reconfig_xcvr_master_write write Output 1
    add_interface_port reconfig_xcvr_master reconfig_xcvr_master_writedata writedata Output 32
    add_interface_port reconfig_xcvr_master reconfig_xcvr_master_readdata readdata Input 32
    add_interface_port reconfig_xcvr_master reconfig_xcvr_master_waitrequest waitrequest Input 1
}

# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock clk clk Input 1


# 
# connection point reset_sink
# 
add_interface reset_sink reset end
set_interface_property reset_sink associatedClock clock
set_interface_property reset_sink synchronousEdges DEASSERT
set_interface_property reset_sink ENABLED true
set_interface_property reset_sink EXPORT_OF ""
set_interface_property reset_sink PORT_NAME_MAP ""
set_interface_property reset_sink CMSIS_SVD_VARIABLES ""
set_interface_property reset_sink SVD_ADDRESS_GROUP ""

add_interface_port reset_sink rst_n reset_n Input 1

# 
# connection point tx_cal_busy_chan1
# 
add_interface tx_cal_busy_chan1 conduit end
set_interface_property tx_cal_busy_chan1 associatedClock ""
set_interface_property tx_cal_busy_chan1 associatedReset ""
set_interface_property tx_cal_busy_chan1 ENABLED true
set_interface_property tx_cal_busy_chan1 EXPORT_OF ""
set_interface_property tx_cal_busy_chan1 PORT_NAME_MAP ""
set_interface_property tx_cal_busy_chan1 CMSIS_SVD_VARIABLES ""
set_interface_property tx_cal_busy_chan1 SVD_ADDRESS_GROUP ""

add_interface_port tx_cal_busy_chan1 tx_cal_busy_chan1 tx_cal_busy Input 1


# 
# connection point rx_cal_busy_chan1
# 
add_interface rx_cal_busy_chan1 conduit end
set_interface_property rx_cal_busy_chan1 associatedClock ""
set_interface_property rx_cal_busy_chan1 associatedReset ""
set_interface_property rx_cal_busy_chan1 ENABLED true
set_interface_property rx_cal_busy_chan1 EXPORT_OF ""
set_interface_property rx_cal_busy_chan1 PORT_NAME_MAP ""
set_interface_property rx_cal_busy_chan1 CMSIS_SVD_VARIABLES ""
set_interface_property rx_cal_busy_chan1 SVD_ADDRESS_GROUP ""

add_interface_port rx_cal_busy_chan1 rx_cal_busy_chan1 rx_cal_busy Input 1


# 
# connection point tx_cal_busy_chan1_out
# 
add_interface tx_cal_busy_chan1_out conduit end
set_interface_property tx_cal_busy_chan1_out associatedClock ""
set_interface_property tx_cal_busy_chan1_out associatedReset ""
set_interface_property tx_cal_busy_chan1_out ENABLED true
set_interface_property tx_cal_busy_chan1_out EXPORT_OF ""
set_interface_property tx_cal_busy_chan1_out PORT_NAME_MAP ""
set_interface_property tx_cal_busy_chan1_out CMSIS_SVD_VARIABLES ""
set_interface_property tx_cal_busy_chan1_out SVD_ADDRESS_GROUP ""

add_interface_port tx_cal_busy_chan1_out tx_cal_busy_chan1_out tx_cal_busy Output 1


# 
# connection point rx_cal_busy_chan1_out
# 
add_interface rx_cal_busy_chan1_out conduit end
set_interface_property rx_cal_busy_chan1_out associatedClock ""
set_interface_property rx_cal_busy_chan1_out associatedReset ""
set_interface_property rx_cal_busy_chan1_out ENABLED true
set_interface_property rx_cal_busy_chan1_out EXPORT_OF ""
set_interface_property rx_cal_busy_chan1_out PORT_NAME_MAP ""
set_interface_property rx_cal_busy_chan1_out CMSIS_SVD_VARIABLES ""
set_interface_property rx_cal_busy_chan1_out SVD_ADDRESS_GROUP ""

add_interface_port rx_cal_busy_chan1_out rx_cal_busy_chan1_out rx_cal_busy Output 1

# 
# connection point xcvr_mode_chan1
# 
add_interface xcvr_mode_chan1 conduit end
set_interface_property xcvr_mode_chan1 associatedClock ""
set_interface_property xcvr_mode_chan1 associatedReset ""
set_interface_property xcvr_mode_chan1 ENABLED true
set_interface_property xcvr_mode_chan1 EXPORT_OF ""
set_interface_property xcvr_mode_chan1 PORT_NAME_MAP ""
set_interface_property xcvr_mode_chan1 CMSIS_SVD_VARIABLES ""
set_interface_property xcvr_mode_chan1 SVD_ADDRESS_GROUP ""

add_interface_port xcvr_mode_chan1 xcvr_mode_chan1 export Output 2

# 
# connection point mge_chan1_resetn
# 
add_interface mge_chan1_resetn reset start
set_interface_property mge_chan1_resetn associatedClock clock
set_interface_property mge_chan1_resetn associatedDirectReset ""
set_interface_property mge_chan1_resetn associatedResetSinks reset_sink
set_interface_property mge_chan1_resetn synchronousEdges DEASSERT
set_interface_property mge_chan1_resetn ENABLED true
set_interface_property mge_chan1_resetn EXPORT_OF ""
set_interface_property mge_chan1_resetn PORT_NAME_MAP ""
set_interface_property mge_chan1_resetn CMSIS_SVD_VARIABLES ""
set_interface_property mge_chan1_resetn SVD_ADDRESS_GROUP ""

add_interface_port mge_chan1_resetn mge_chan1_resetn reset_n Output 1

# 
# connection point pll_select_chan1
# 
add_interface pll_select_chan1 conduit end
set_interface_property pll_select_chan1 associatedClock ""
set_interface_property pll_select_chan1 associatedReset ""
set_interface_property pll_select_chan1 ENABLED true
set_interface_property pll_select_chan1 EXPORT_OF ""
set_interface_property pll_select_chan1 PORT_NAME_MAP ""
set_interface_property pll_select_chan1 CMSIS_SVD_VARIABLES ""
set_interface_property pll_select_chan1 SVD_ADDRESS_GROUP ""

add_interface_port pll_select_chan1 pll_select_chan1 pll_select Output 1

# 
# connection point status
# 
add_interface status conduit end
set_interface_property status associatedClock ""
set_interface_property status associatedReset ""
set_interface_property status ENABLED true
set_interface_property status EXPORT_OF ""
set_interface_property status PORT_NAME_MAP ""
set_interface_property status CMSIS_SVD_VARIABLES ""
set_interface_property status SVD_ADDRESS_GROUP ""

add_interface_port status status export Output 4
