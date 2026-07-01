SUMMARY = "Intel SoCFPGA Development Kit devicetrees for PCIe Root Port Example Designs"
DESCRIPTION = "Devicetree addons for PCIe Root Port Example Designs on Intel SoCFPGA Development Kits"
SECTION = "bsp"

LICENSE = "MIT & GPL-2.0-only"

do_configure:append() {
	# RPED: device-tree MACHINE is ${MACHINE} and IMAGE_TYPE is ${IMAGE_TYPE}

	if [[ "${MACHINE}" == "agilex7_dk_dev_agm039fes" ]]; then
		cp ${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts/intel/socfpga_agilex7m_socdk_pcie_root_port.dts ${WORKDIR}/socfpga_agilex7_socdk.dts
	elif [[ "${MACHINE}" == "agilex7_dk_si_agf014eb" ]]; then
                cp ${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dts ${WORKDIR}/socfpga_agilex7_socdk.dts
	fi
}
