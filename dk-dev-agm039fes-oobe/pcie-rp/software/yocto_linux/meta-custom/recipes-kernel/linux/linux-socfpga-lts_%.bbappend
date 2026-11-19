KERNEL_REPO = "git://github.com/altera-fpga/linux-socfpga.git"
LINUX_VERSION = "6.18.37"
KBRANCH = "socfpga-6.18.37-lts"
KERNEL_VERSION_SANITY_SKIP = "1"
LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

# Append GSRD specific kernel config fragments and Patches.
FILESEXTRAPATHS:prepend := "${THISDIR}/device-tree:${THISDIR}/linux-socfpga-lts:${THISDIR}/linux-socfpga-lts/configs:${THISDIR}/linux-socfpga-lts/patches:"

python () {
    import os

    enable = d.getVar("FPGA_CORE_PGM_ENABLE") or "0"

    #
    # Handle CUSTOM_LINUX_DTS_FILE only if FPGA_CORE_PGM_ENABLE == "1"
    #
    custom_dts = d.getVar("CUSTOM_LINUX_DTS_FILE")

    if enable == "1":
        if not custom_dts:
            bb.fatal("CUSTOM_LINUX_DTS_FILE must be set when FPGA_CORE_PGM_ENABLE = 1")
        # Compute DTB
        dtb = os.path.basename(custom_dts).replace(".dts", ".dtb")
        d.setVar("FPGA_LINUX_DTB_FILE", dtb)
    else:
        # Optional → do NOT fatal, but set DTB_FILE empty so no invalid append happens
        d.setVar("FPGA_LINUX_DTB_FILE", "")

    #
    # LINUX_DTS_FILE is ALWAYS required
    #
    linux_dts = d.getVar("LINUX_DTS_FILE")
    if not linux_dts:
        bb.fatal("LINUX_DTS_FILE must be set (base Linux DTS missing)")

    linux_dtb = os.path.basename(linux_dts).replace(".dts", ".dtb")
    d.setVar("LINUX_DTB_FILE", linux_dtb)
}


#KERNEL_DEVICETREE:append = " intel/${FPGA_LINUX_DTB_FILE}"
KERNEL_DEVICETREE:append = "${@(' intel/%s' % d.getVar('FPGA_LINUX_DTB_FILE')) if d.getVar('FPGA_LINUX_DTB_FILE') else ''}"


#IMAGE_BOOT_FILES:append = " ${FPGA_LINUX_DTB_FILE}"
IMAGE_BOOT_FILES:append = "${@(' %s' % d.getVar('FPGA_LINUX_DTB_FILE')) if d.getVar('FPGA_LINUX_DTB_FILE') else ''}"


SRC_URI:append = " file://gpio_sys.scc \
		   file://usb_adapter.scc \
		   file://jffs2.scc \
		   file://ubifs.scc \
"

# Auto-add all DTS / DTSI into SRC_URI at PARSE TIME
python __anonymous () {
    import os

    layerdir = d.getVar("LAYERDIR_meta_custom")
    tree = os.path.join(layerdir, "recipes-kernel/linux/device-tree")

    if not os.path.isdir(tree):
        bb.fatal("Device-tree folder not found: %s" % tree)

    for fname in os.listdir(tree):
        if fname.endswith(".dts") or fname.endswith(".dtsi"):
            #bb.note("Adding to SRC_URI at parse time: %s" % fname)
            d.appendVar("SRC_URI", " file://%s" % fname)
}

do_patch:append() {

    DTS_SRC_DIR="${WORKDIR}/sources"
    DTS_DST_DIR="${S}/arch/arm64/boot/dts/intel"
    MAKEFILE="${DTS_DST_DIR}/Makefile"

    enable="${FPGA_CORE_PGM_ENABLE}"

    #
    # If FPGA_CORE_PGM_ENABLE = 1 → must install CUSTOM_LINUX_DTS_FILE
    #
    if [ "${enable}" = "1" ]; then
        if [ -f "${DTS_SRC_DIR}/${CUSTOM_LINUX_DTS_FILE}" ]; then
            install -m 0644 "${DTS_SRC_DIR}/${CUSTOM_LINUX_DTS_FILE}" "${DTS_DST_DIR}"
        elif [ -f "${DTS_DST_DIR}/${CUSTOM_LINUX_DTS_FILE}" ]; then
            bbnote "Using in-kernel DTS ${DTS_DST_DIR}/${CUSTOM_LINUX_DTS_FILE}"
        else
            bbfatal "CUSTOM_LINUX_DTS_FILE ${CUSTOM_LINUX_DTS_FILE} not found in ${DTS_SRC_DIR} or ${DTS_DST_DIR}"
        fi
    fi

    #
    # Copy all DTSI files into kernel source
    #
    find "${DTS_SRC_DIR}" -type f -name "*.dtsi" | while read DTSI; do
        BASENAME=$(basename "${DTSI}")
        install -m 0644 "${DTSI}" "${DTS_DST_DIR}/${BASENAME}"
    done

    #
    # Add DTB entry to kernel Makefile only when custom DTS is enabled
    #
    if [ "${enable}" = "1" ] && [ -n "${FPGA_LINUX_DTB_FILE}" ]; then
        if ! grep -Fq "${FPGA_LINUX_DTB_FILE}" "${MAKEFILE}"; then
            echo "dtb-\$(CONFIG_ARCH_INTEL_SOCFPGA) += ${FPGA_LINUX_DTB_FILE}" >> "${MAKEFILE}"
        fi
    fi
}


addtask do_patch after do_unpack before do_configure

# PCIe Root Port support carried over from GSRD 1.0 meta-altera-pcie-rp
SRC_URI:append = " \
	file://nvme.scc \
	file://fit_agilex7_kernel_pcie_rp.its \
	file://fit_agilex7_kernel_no_rbf_pcie_rp.its \
	file://0001-Reserve-RAM-area-required-by-pcie-rootport-on-FPGA.patch \
	file://0002-DTS-Add-node-to-support-pcie-legacy-interrupts.patch \
	file://0003-PCI-altera-Do-not-dispose-parent-IRQ-mapping.patch \
	file://0004-PCI-altera-Fix-resource-leaks-on-probe-failure.patch \
	file://0005-Add-PCIe-RP-driver-support-for-Legacy-INTx-interrupts.patch \
	file://0006-PCI-Configure-Root-Port-MPS-during-host-probing.patch \
	file://0007-PCI-altera-Limit-MRRS-to-512-bytes-on-MCDMA-Root-Por.patch \
	"

do_deploy:prepend() {
	# meta-altera-bsp builds kernel.itb from ${UNPACKDIR}/fit_${MACHINE_STRIP}_kernel*.its;
	# replace those with the PCIe Root Port versions that add board-2 / board-4.
	cp -f "${UNPACKDIR}/fit_${MACHINE_STRIP}_kernel_pcie_rp.its" "${UNPACKDIR}/fit_${MACHINE_STRIP}_kernel.its"
	cp -f "${UNPACKDIR}/fit_${MACHINE_STRIP}_kernel_no_rbf_pcie_rp.its" "${UNPACKDIR}/fit_${MACHINE_STRIP}_kernel_no_rbf.its"
}
