SUMMARY = "U-boot boot environment for Altera SoCFPGA devices"
DESCRIPTION = "Sets the boot source for Second stage boot loader"
LICENSE = "MIT"

do_configure() {
    if [ -n "${SSBL_BOOT_SRC}" ]; then
        sed -i -e "s/boot_targets=.*/boot_targets=${SSBL_BOOT_SRC}/" ${UNPACKDIR}/u-boot-env.txt
    else
        bbwarn "SSBL_BOOT_SRC is empty!, configure the boot source.."
    fi

    if [ -n "${KERNEL_BOOTARGS}" ]; then
        sed -i -e "s|^custom_bootargs=.*|custom_bootargs=${KERNEL_BOOTARGS}|" ${UNPACKDIR}/u-boot-env.txt
    fi

    # Override Address for Agilex7
    sed -i -e "s/spi@108d2000/spi@ff8d2000/" ${UNPACKDIR}/u-boot-env.txt
    sed -i -e "s/0x86000000/0x6000000/" ${UNPACKDIR}/u-boot-env.txt
    sed -i -e "s/0x82000000/0x2000000/" ${UNPACKDIR}/u-boot-env.txt
    sed -i -e "s/10b80000/ffb90000/" ${UNPACKDIR}/u-boot-env.txt
    sed -i -e "s/0x81000000/0x05FF0000/" ${UNPACKDIR}/u-boot-env.txt
}
