# Agilex™ 7 PCIe Root Port System Example Design (M-Series R-Tile)

The Agilex™ 7 PCIe Root Port System Example Design targets the [Agilex™ 7 FPGA M-Series Development Kit - HBM2e Edition (DK-DEV-AGM039FES)](https://www.altera.com/products/devkit/po-3016/agilex-7-fpga-m-series-development-kit-hbm2e-edition-3x-f-tile-1x-r-tile-es) with a PCIe R-Tile root port, HPS, and Multichannel DMA (MCDMA) bridge.

## Description

The Agilex™ 7 PCIe Root Port System Example Design for the M-Series R-Tile kit demonstrates a PCIe root port with HPS, Multichannel DMA (MCDMA) bridge, and related interconnect. It is intended as a reference for implementing and running a performant root port system on Agilex™ 7.

## Project Details

- **Family**: Agilex 7
- **Quartus Version**: 26.3
- **Patch Number**: Unknown
- **Development Kit**: [Agilex 7 FPGA M-Series Development Kit - HBM2e Edition 3x F-Tile and 1x R-Tile DK-DEV-AGM039FES](https://www.altera.com/products/devkit/po-3016/agilex-7-fpga-m-series-development-kit-hbm2e-edition-3x-f-tile-1x-r-tile-es)
- **Device Part**: AGMF039R47A1E2VR0
- **Category**: HPS, PCIe
- **URL**: https://github.com/altera-fpga/agilex7-ed-pcie-rp
- **Design Package**: dk-dev-agm039fes-oobe-pcie-rp.zip

## Documentations

- **Title**: Design and Build Readme  
  **URL**: [README.md](./README.md)
- **Title**: Hardware Build (syn)  
  **URL**: [syn/README.md](./syn/README.md)
- **Title**: Software / Yocto Build Readme  
  **URL**: [software/yocto_linux/README.md](./software/yocto_linux/README.md)

## Dependency

- Altera Quartus Prime Pro (see Project Details for the supported version)
- Software / Yocto: [software/yocto_linux/README.md](software/yocto_linux/README.md)

## Directory structure

```text
pcie-rp/
+-- Makefile / project_config.mk / swbuild_config.mk
+-- src/                        # HARDWARE - RTL / Qsys / custom IP
+-- syn/                        # HARDWARE - Quartus project + Makefile
|   +-- output_files/
+-- software/
    +-- yocto_linux/            # SOFTWARE - see software/yocto_linux/README.md
```

| Path | Role |
|------|------|
| `src/` | RTL, Qsys, custom IP |
| `syn/` | Quartus project and compile `Makefile` |
| `software/yocto_linux/` | Yocto / KAS BSP |

## Compiling via Makefile (hardware and software)

The top-level Makefile is in the design root (`pcie-rp/`). The Quartus project
(`top.qpf` / `top.qsf`) lives in `syn/`.

Run `make help` from `pcie-rp/` for the full target list.

Public stem: `dk-dev-agm039fes-oobe-baseline-pcie-rp`  
Hardware revision (SOF / RBF basename): `baseline` (`REVISION_NAMES` in `project_config.mk`).

**Full build (hardware and software):**

```bash
make dk-dev-agm039fes-oobe-baseline-pcie-rp-all
```

This runs the hardware build, generates the core RBF from the SOF, then runs the Yocto SD software build.

**Hardware build only:**

```bash
make dk-dev-agm039fes-oobe-baseline-pcie-rp-build
```

This calls `syn/Makefile` (`make -C syn all`) and then copies `syn/output_files/top.sof`
to `output_files/baseline.sof` for the install and software targets.

**Software build only**, after the hardware build generates the required SOF (core RBF is produced automatically):

```bash
make dk-dev-agm039fes-oobe-baseline-pcie-rp-software-yocto_linux_sd-build-sw
```

This runs `quartus_pfg` to create the core RBF (if needed), then
`software/yocto_linux/build.sh <core.rbf> sd`.

**Install SOF / reports / software artifacts** under `install/`:

```bash
make dk-dev-agm039fes-oobe-baseline-pcie-rp-install
```

**Install core RBF only** (SOF + `quartus_pfg` → `install/binaries/`):

```bash
make dk-dev-agm039fes-oobe-baseline-pcie-rp-install-core-rbf
```

Yocto RBF/DTB names and kas details:
[software/yocto_linux/README.md](software/yocto_linux/README.md).

Images are written to `software/yocto_linux/build/tmp/deploy/images/agilex7m/`.

## Building the Hardware only

See [syn/README.md](./syn/README.md).

## Programming files (SOF + FSBL)

`u-boot-spl-dtb.hex` is produced by the Yocto build under the deploy images directory (and may also be present under `syn/` as a checked-in artifact).

After a Yocto build:

```bash
cd syn
quartus_pfg -c -o hps=on \
  -o hps_path=../software/yocto_linux/build/tmp/deploy/images/agilex7m/u-boot-spl-dtb.hex \
  output_files/top.sof \
  output_files/top.rbf
```

Or use the revision-named SOF produced by the top-level Makefile under `output_files/`.

## Software

Yocto / KAS, RBF/DTB names, `build.sh`, binaries:  
**[software/yocto_linux/README.md](software/yocto_linux/README.md)**.
