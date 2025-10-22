# Intel® Agilex™ 7 PCIe Root Port System Example Design Build Scripts

This directory contains the Quartus Project for the Intel® Agilex™ 7 PCIe Root Port System Example Design.

# Dependency

- Intel® Quartus Prime (See Release Notes for the supported version)
- Supported Board:
  - (https://www.intel.com/content/www/us/en/products/details/fpga/development-kits/agilex/si-agi027.html)

# Build Steps

 1. Compile design and generate configuration file:

    ```
    cd syn/
	make all
    ```

# Programming Files Generation Steps

 1. Download [`u-boot-spl-dtb.hex`](https://releases.rocketboards.org/2025.08/gsrd/agilex7_dk_si_agi027fc_gsrd/u-boot-spl-dtb.hex) from the GSRD 2025.01.01 release.

 2. Generate `top.{core,hps}.rbf` including U-Boot SPL:

    ```
    cd syn/
    quartus_pfg -c -o hps=on -o hps_path=u-boot-spl-dtb.hex output_files/top.sof output_files/top.rbf

    ```
