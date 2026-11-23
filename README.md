# Agilex™ 7 PCIe Root Port System Example Design

## Description

The Agilex™ 7 PCIe Root Port System Example Designs demonstrate a PCIe root port on Altera Agilex™ 7 FPGAs with HPS, Multichannel DMA (MCDMA) bridge, and related interconnect. The repository provides an I-Series F-Tile design and an M-Series R-Tile design.

The System Example Designs (SED) provide the necessary drivers and user applications to support the Linux stack running on the HPS.

The system's primary components include:

- The Hardware Reference Design
- Hard Processor Subsystem (HPS)
- Multichannel DMA (MCDMA) bridge
- PCIe Root Port Hard IP (F-Tile or R-Tile)
- Bridges, interconnects, and adapters for clock crossing, data path, and control path
- Reference HPS software including:
  - Arm Trusted Firmware
  - U-Boot
  - Linux Kernel
  - Linux Drivers
  - User Space Applications

![Agilex™ 7 Root Port block diagram](doc/RP_Block_Diagram.png)

Important features of the design include:

- Linux driver for the PCIe root port IP that runs on the HPS, enumerates the PCIe endpoint(s), and configures the PCIe root port Hard IP through a dedicated reconfiguration interface
- HPS-to-FPGA (H2F) lightweight AXI4 for CSR access to the HIP reconfiguration interface and the MCDMA Configuration Slave (CS) interface
- Bursting AVMM Slave (BAS) path for large memory transactions between the SoC and the PCIe endpoint
- MSI/MSI-X interrupt handling via the Bursting AVMM Master (BAM) interface
- Endpoint-initiated memory requests (DMA bus mastering) targeting system memory via the HPS FPGA-to-HPS (F2H) AXI4 interface

The System Example Design supports the following design configurations on Altera Development Kits.

| SL No | Design configuration                         | Link / tile | Development Kit Supported                                                                                                                                         | Device Family | Device Part        | Documentation                                  |
| ----- | -------------------------------------------- | ----------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------- | ------------------ | ---------------------------------------------- |
| 1.    | PCIe Root Port (I-Series F-Tile)             | F-Tile 2x4  | [DK-SI-AGI027FD](https://www.altera.com/products/devkit/po-3248/agilex-7-fpga-i-series-transceiver-soc-development-kit-4x-f-tile) | Agilex™ 7     | AGIB027R31B1E1VC   | [Build README](./dk-si-agi027fd-oobe/pcie-rp/README.md)  |
| 2.    | PCIe Root Port (M-Series R-Tile, HBM2e kit) | R-Tile 4x4  | [DK-DEV-AGM039FES](https://www.altera.com/products/devkit/po-3016/agilex-7-fpga-m-series-development-kit-hbm2e-edition-3x-f-tile-1x-r-tile-es) | Agilex™ 7     | AGMF039R47A1E2VR0  | [Build README](./dk-dev-agm039fes-oobe/pcie-rp/README.md) |

## Repository Structure

Directory Structure Used in This Example Design:

```bash
agilex7-ed-pcie-rp
|--- doc/
|--- dk-si-agi027fd-oobe/
|   |--- pcie-rp/               # I-Series F-Tile PCIe Root Port
|--- dk-dev-agm039fes-oobe/
|   |--- pcie-rp/               # M-Series R-Tile PCIe Root Port
```

Each design directory contains `src/`, `syn/`, and `software/` (see the design README for details).

## Getting Started

Building the design is easy with the scripts provided in the repo. Clone the repository to get the source files.

```bash
git clone https://github.com/altera-fpga/agilex7-ed-pcie-rp.git
cd agilex7-ed-pcie-rp
git checkout <Release Tag>
```

Follow the links below to compile, build, and test the design solution for the intended configuration.

- [Building PCIe Root Port on DK-SI-AGI027FD (I-Series F-Tile)](./dk-si-agi027fd-oobe/pcie-rp/README.md)
- [Building PCIe Root Port on DK-DEV-AGM039FES (M-Series R-Tile)](./dk-dev-agm039fes-oobe/pcie-rp/README.md)

Run `make help` from a design directory for the full target list for that variant.
