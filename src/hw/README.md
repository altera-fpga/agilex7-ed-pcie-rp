# Intel® Agilex™ 7 PCIe Root Port System Example Design Build Scripts

This directory contains the Quartus Project for the Intel® Agilex™ 7 PCIe Root Port System Example Design.

# Dependency

- Intel® Quartus Prime (See Release Notes for the supported version)
- Supported Board:
  - [Intel® Agilex™ 7 FPGA M-Series Development Kit - HBM2e Edition (3x F-Tile & 1x R-Tile)](https://www.intel.com/content/www/us/en/products/details/fpga/development-kits/agilex/agm039.html)

# Build Steps

 1. Compile design and generate configuration file:

    ```
    cd ag7m039_devkit/syn/
	make all
    ```

# Programming Files Generation Steps

 1. Download [`u-boot-spl-dtb.hex`](https://releases.rocketboards.org/2024.11/gsrd/agilex7_dk_dev_agm039fes_gsrd/u-boot-spl-dtb.hex) from the GSRD 2024.11 release.

 2. Generate `ghrd_agmf039r47a1e2vr0.{core,hps}.rbf` including U-Boot SPL:

    ```
    cd ag7m039_devkit/syn/
    quartus_pfg -c -o hps=on -o hps_path=u-boot-spl-dtb.hex output_files/ghrd_agmf039r47a1e2vr0.sof output_files/ghrd_agmf039r47a1e2vr0.rbf
    ```
