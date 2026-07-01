# Yocto Project layer with Intel® Agilex™ 7 PCIe Root Port System Example Design (Quartus 26.1 release)

This directory contains a Yocto Project layer with the [Intel® Agilex™ 7 PCIe Root Port System Example](https://github.com/altera-fpga/agilex7-ed-pcie-rp) for the [Intel® SoCFPGA Golden Software Reference Design (GSRD)](https://github.com/altera-opensource/gsrd-socfpga).

## Supported Targets

The following targets are currently supported:

|    Board                                         |   OPN            |
| ------------------------------------------------ | ---------------- |
| Intel® Agilex™ 7 FPGA F-Series Development Kit   | DK-DEV-AGF014EB  |
| ------------------------------------------------ | ---------------- |
| Intel® Agilex™ 7 FPGA M-Series Development Kit   | DK-DEV-AGM039FES |


## Yocto Build Instructions

 1. Clone the repository:

    ```
    git clone https://github.com/altera-fpga/agilex7-ed-pcie-rp.git
    cd agilex7-ed-pcie-rp/src/sw/
    ```

 2. Source the script to set component versions (Linux, U-Boot, ATF, Machine, Image):

    |    Board                                         |   Command                                  |
    | ------------------------------------------------ | ------------------------------------------ |
    | Intel® Agilex™ 7 FPGA F-Series Development Kit   | `. agilex7_dk_si_agf014eb-gsrd-build.sh`   |
    | ------------------------------------------------ | ------------------------------------------ |
    | Intel® Agilex™ 7 FPGA M-Series Development Kit   | `. agilex7_dk_dev_agm039fes-rped-build.sh` |

 3. Setup the build environment:

    ```
    build_setup
    ```

 4. OPTIONAL:  CUSTOM GHRD:

              a. Copy the generated custom GHRD RBF files (top.hps.rbf and top.core.rbf) in the below path:
                   $WORKSPACE/src/sw/meta-altera-pcie-rp/recipes-bsp/ghrd/files/

                   ```
                   NOTE: Rename the GHRD top.core.rbf file to match the exact naming convention specified below
                            For Agilex7 DK-DEV-AGF014EB:-
                                          agilex7_dk_si_agf014eb_gsrd_ghrd.core.rbf

                            For Agilex7 DK-DEV-AGM039FES:-
                                          agilex7_dk_dev_agm039fes_rped_ghrd.core.rbf
                   ```

              b. Update sha256sum value of the custom core rbf file:
                    ```
                    Note: calculate the sha256sum of the core rbf using the below commands
                          sha256sum agilex7_dk_si_agf014eb_gsrd_ghrd.core.rbf
                          sha256sum agilex7_dk_dev_agm039fes_rped_ghrd.core.rbf
                    ```

                    Update the sha256sum values of core rbf got from above commands in the below recipe-
                        $WORKSPACE/src/sw/meta-altera-pcie-rp/recipes-bsp/ghrd/hw-ref-design.bbappend
                        ```
                        For Agilex7 DK-DEV-AGF014EB:-
                        SRC_URI[agilex7_dk_si_agf014eb_gsrd_core.sha256sum] = "<put the calculated sha256sum of core rbf file here>"

                        For Agilex7 DK-DEV-AGM039FES:-
                        SRC_URI[agilex7_dk_dev_agm039fes_rped_core.sha256sum] = "<put the calculated sha256sum of core rbf file here>"
                        ```


 5. Perform Yocto bitbake to generate binaries:

    ```
    bitbake_image
    ```

 6. Package binaries into build folder:

    ```
    package
    ```
