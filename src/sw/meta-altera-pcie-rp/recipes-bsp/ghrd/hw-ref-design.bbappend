SUMMARY = "Layer to manage FPGA images for PCIe Root Port Example Designs"
DESCRIPTION = "Layer to manage FPGA images for PCIe Root Port Example Designs on Intel SoCFPGA Development Kits"
SECTION = "bsp"

LICENSE = "MIT & GPL-2.0-only"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:agilex7_dk_dev_agm039fes = "\
		${@bb.utils.contains("IMAGE_TYPE", "rped", "https://github.com/altera-fpga/agilex7-ed-pcie-rp/releases/download/24.3-1/agilex7_dk_dev_agm039fes_rped_${ARM64_GHRD_CORE_RBF};name=agilex7_dk_dev_agm039fes_rped_core", "", d)} \
		"

SRC_URI[agilex7_dk_dev_agm039fes_rped_core.sha256sum] = "7fc93b1f0226e3aad86d7233a8de6921c4603879ecd3a1256c0d3437bcbcdb45"

do_install() {
	# RPED: start hw-ref-design:do_install MACHINE is ${MACHINE} and IMAGE_TYPE is ${IMAGE_TYPE}
	
	install -D -m 0644 ${WORKDIR}/${MACHINE}_${IMAGE_TYPE}_${ARM64_GHRD_CORE_RBF} ${DEPLOYDIR}/${MACHINE}_${IMAGE}_ghrd/${ARM64_GHRD_CORE_RBF}

	# RPED: end hw-ref-design:do_install MACHINE is ${MACHINE} and IMAGE_TYPE is ${IMAGE_TYPE}
}

do_deploy() {
	# RPED: start hw-ref-design:do_deploy MACHINE is ${MACHINE} and IMAGE_TYPE is ${IMAGE_TYPE}

	install -D -m 0644 ${WORKDIR}/${MACHINE}_${IMAGE_TYPE}_${ARM64_GHRD_CORE_RBF} ${DEPLOYDIR}/${MACHINE}_${IMAGE_TYPE}_ghrd/${ARM64_GHRD_CORE_RBF}

	# RPED: end hw-ref-design:do_deploy MACHINE is ${MACHINE} and IMAGE_TYPE is ${IMAGE_TYPE}
}
