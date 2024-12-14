# Yocto Project layer with Intel® Agilex™ 7 PCIe Root Port System Example Design

This directory contains a Yocto Project layer with the [Intel® Agilex™ 7 PCIe Root Port System Example](https://github.com/altera-fpga/agilex7-ed-pcie-rp) for the [Intel® SoCFPGA Golden Software Reference Design (GSRD)](https://github.com/altera-opensource/gsrd-socfpga).

## Supported Targets

The following targets are currently supported:

|    Board                                         |   OPN            |
| ------------------------------------------------ | ---------------- |
| Intel® Agilex™ 7 FPGA M-Series Development Kit   | DK-DEV-AGM039FES |

## Yocto Build Instructions

 1. Clone the repository:

    ```
    git clone https://github.com/altera-fpga/agilex7-ed-pcie-rp
    cd agilex7-ed-pcie-rp/src/sw/
    ```

 2. Source the script to set component versions (Linux, U-Boot, ATF, Machine, Image):

    |    Board                                         |   Command                                  |
    | ------------------------------------------------ | ------------------------------------------ |
    | Intel® Agilex™ 7 FPGA M-Series Development Kit   | `. agilex7_dk_dev_agm039fes-rped-build.sh` |

 3. Setup the build environment:

    ```
    build_setup
    ```

 4. Perform Yocto bitbake to generate binaries:

    ```
    bitbake_image
    ```

 5. Package binaries into build folder:

    ```
    package
    ```
