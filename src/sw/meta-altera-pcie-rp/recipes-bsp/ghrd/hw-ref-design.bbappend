SUMMARY = "Layer to manage FPGA images for PCIe Root Port Example Designs"
DESCRIPTION = "Layer to manage FPGA images for PCIe Root Port Example Designs on Intel SoCFPGA Development Kits"
SECTION = "bsp"

LICENSE = "MIT & GPL-2.0-only"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:agilex7_dk_dev_agm039fes = "\
		file://agilex7_dk_dev_agm039fes_rped_ghrd.core.rbf;name=agilex7_dk_dev_agm039fes_rped_core \
		"

SRC_URI:agilex7_dk_si_agf014eb = "\
                file://agilex7_dk_si_agf014eb_gsrd_ghrd.core.rbf;name=agilex7_dk_si_agf014eb_gsrd_core \
                "

SRC_URI[agilex7_dk_dev_agm039fes_rped_core.sha256sum] = "4978f23a13f41ebc38ed6f8530d017cd7de20bd37e65aa6cc7d5aa445f41f040"
SRC_URI[agilex7_dk_si_agf014eb_gsrd_core.sha256sum] = "97a6c069782432226b214da6df6b1d7cad9d0c044baa1759bba247fcb1ab2771"

do_install() {
	# RPED: start hw-ref-design:do_install MACHINE is ${MACHINE} and IMAGE_TYPE is ${IMAGE_TYPE}
	
	install -D -m 0644 ${WORKDIR}/${MACHINE}_${IMAGE_TYPE}_${ARM64_GHRD_CORE_RBF} ${D}/boot/${ARM64_GHRD_CORE_RBF}

	# RPED: end hw-ref-design:do_install MACHINE is ${MACHINE} and IMAGE_TYPE is ${IMAGE_TYPE}
}

do_deploy() {
	# RPED: start hw-ref-design:do_deploy MACHINE is ${MACHINE} and IMAGE_TYPE is ${IMAGE_TYPE}

	install -D -m 0644 ${WORKDIR}/${MACHINE}_${IMAGE_TYPE}_${ARM64_GHRD_CORE_RBF} ${DEPLOYDIR}/${MACHINE}_${IMAGE_TYPE}_ghrd/${ARM64_GHRD_CORE_RBF}

	# RPED: end hw-ref-design:do_deploy MACHINE is ${MACHINE} and IMAGE_TYPE is ${IMAGE_TYPE}
}
