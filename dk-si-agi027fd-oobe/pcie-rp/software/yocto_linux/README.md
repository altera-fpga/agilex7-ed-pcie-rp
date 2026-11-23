# Overview of yocto_linux

Yocto / KAS BSP for the Agilex™ 7 PCIe Root Port System Example Design (I-Series F-Tile) on the
Agilex 7 FPGA I-Series Transceiver-SoC Development Kit (DK-SI-AGI027FD), built with the KAS based GSRD 2.0 flow.

The Yocto Linux framework enables users to customize the Board Support Package (BSP)
to match the specific hardware design and evaluate the system on hardware.

The base layer for yocto_linux is meta-altera-fpga/meta-altera-bsp. Yocto can be configurable/build
using kas menu and bitbake commands.

Hardware compile (`src/` / `syn/`) and programming-file steps:
[../../README.md](../../README.md) and [../../syn/README.md](../../syn/README.md).

Build (SD card):

```bash
./build.sh <path>/baseline.core.rbf sd
```

## Design details

| Item | Value |
|------|-------|
| Family | Agilex 7 |
| Development kit | Agilex 7 FPGA I-Series Transceiver-SoC Development Kit (DK-SI-AGI027FD) |
| Device part | AGIB027R31B1E1VC |
| Quartus Prime Pro | 26.3 |
| PCIe tile | F-Tile, Hard IP mode `Gen4 2x4` (16.0 Gbps lane rate) |
| Subsystem | PCIe root port + HPS + Multichannel DMA (MCDMA) bridge |
| `MACHINE` | `agilex7` (`kas/machine.yml`) |
| Hardware revision | `baseline` (`REVISION_NAMES` in `../../project_config.mk`) |
| Make stem | `dk-si-agi027fd-oobe-baseline-pcie-rp` |
| Deploy directory | `build/tmp/deploy/images/agilex7/` |

## Component versions

Set in `kas/bsp.yml`; all three are fetched from the public `altera-fpga` repositories with
`SRCREV = "${AUTOREV}"`, i.e. the tip of the branch at build time.

| Component | Branch | Recipe version |
|-----------|--------|----------------|
| Linux | `socfpga-6.18.37-lts` | `linux-socfpga-lts` 6.18.37 |
| U-Boot | `socfpga_v2026.07` | `u-boot-socfpga` v2026.07 |
| Arm Trusted Firmware | `socfpga_v2.15.0` | `arm-trusted-firmware` v2.15 (BL31 reports v2.15.1) |

## What this BSP adds on top of the Agilex 7 HPS baseline

- **Linux device tree** - in-kernel `socfpga_agilex7i_socdk_pcie_root_port.dts`
  (`CUSTOM_LINUX_DTS_FILE` in `kas/machine.yml`; `LINUX_DTS_FILE` stays `socfpga_agilex_socdk.dts`)
- **U-Boot** - `UBOOT_DEFCONFIG = socfpga_agilex_defconfig`, `UBOOT_DEVICE_TREE = socfpga_agilex_socdk.dtb`
- **Kernel patches** (`meta-custom/recipes-kernel/linux/linux-socfpga-lts/patches/`):

  | Patch | Purpose |
  |-------|---------|
  | `0001-Reserve-RAM-area-required-by-pcie-rootport-on-FPGA` | Reserved RAM for the root port |
  | `0002-DTS-Add-node-to-support-pcie-legacy-interrupts` | Legacy interrupt DT node |
  | `0003-PCI-altera-Do-not-dispose-parent-IRQ-mapping` | IRQ mapping leak fix |
  | `0004-PCI-altera-Fix-resource-leaks-on-probe-failure` | Probe-failure resource leak fix |
  | `0005-Add-PCIe-RP-driver-support-for-Legacy-INTx-interrupts` | Legacy INTx driver support |
  | `0006-PCI-Configure-Root-Port-MPS-during-host-probing` | Root Port MPS configuration |
  | `0007-PCI-altera-Limit-MRRS-to-512-bytes-on-MCDMA-Root-Por` | Clamp MRRS to 512 bytes (MCDMA bridge limit) |

- **Kernel config**: NVMe (`nvme.scc`)
- **Rootfs packages**: `nvme-cli`, `dtc`, `fio`, `pciutils`

Following is the top level view of the yocto_linux framework.

```
.
├── kas
│   ├── apps
│   │   ├── hello-world.yaml
│   │   └── Kconfig
│   ├── bsp.yml
│   ├── gsrd
│   │   └── Kconfig
│   ├── image
│   │   ├── all-image-targets.yaml
│   │   ├── console-image-minimal.yaml
│   │   ├── core-image-minimal.yaml
│   │   ├── gsrd-console-image.yaml
│   │   └── Kconfig
│   └── machine.yml
├── kas.yml
├── Kconfig
├── meta-custom
│   ├── conf
│   │   ├── layer.conf
│   │   └── machine
│   ├── LICENSE
│   ├── README.md
│   ├── recipes-apps
│   │   └── hello
│   ├── recipes-bsp
│   │   └── u-boot
│   ├── recipes-files
│   │   └── rootfs-files
│   ├── recipes-fpga
│   │   └── fpga-bitstream
│   └── recipes-kernel
│       └── linux
│           ├── device-tree
│           ├── linux-socfpga-lts
│           └── pio-interrupt
├── qspi_boot_src.yml
├── scripts
├── build.sh
├── kas_build.sh
├── clean_build.sh
└── README.md

```

## KAS
- **Kconfig**  
Contains configuration definitions for KAS menu options to configure the Yocto.
- **kas.yml**  
kas.yaml is the configuration file used by KAS and contains the info of repos to be cloned, machine and other Yocto related configurations.

- **kas/image**  
The image directory contains yaml configurations for core-image-minimal, console-image-minimal and gsrd-console-image targets.

    - **core-image-minimal**  
        In the Yocto core-image-minimal is the most basic reference image recipes provided by the Poky
        distribution. It’s essentially a minimal root filesystem which is just enough to boot the system and
        provide a command-line interface.
    - **console-image-minimal**  
        In addition to core-image-base, console-image-minimal enables following packages,
        - Common essentials
        - Network essentials
        - Openssh
        - NFS
        - lighttpd
        - udev
        - systemd
        - mtd-utils

    - **gsrd-console-image**  
        In addition to core-image-base, gsrd-console-image enables following packages,
        - Common essentials
        - dev-tools essentials
        - Network essentials
        - web-server essentials
        - nfs-utils-client
        - Openssh
        - FIO
        - perl
        - NFS
        - lighttpd
        - udev
        - systemd
        - mtd-utils

## meta-custom layer
- **conf**  
Contains layer configuration.
- **recipes-apps**  
Contains custom application recipes such as the hello example.
- **recipes-bsp**  
Contains _u-boot_ recipe for boot loader.
    - _u-boot_ recipe allows integration of custom device tree source to enable the hardware-specific modifications. Also, allows integration of custom U-Boot environment variables.
- **recipes-files**  
Contains recipes for adding custom files to the root filesystem.
- **recipes-fpga**  
Contains the _fpga-bitstream_ recipe to include RBF file.
- **recipes-kernel**  
Contains _linux_ recipe to create Kernel Image with custom configurations.
    - _device-tree_ recipe allows integration of custom Linux device tree source and device tree fragment to enable the hardware-specific modifications.
    - _linux-socfpga-lts_ contains kernel configuration fragments and patches.
    - _pio-interrupt_ contains PIO interrupt driver example.

Refer following links to understand more on BSP customization (Top level ```meta-custom/README.md``` provides introduction to each section).

- U-Boot
	```meta-custom/recipes-bsp/u-boot/README.md```
- Linux Kernel
	```meta-custom/recipes-kernel/linux/README.md```
- Linux Device Tree
	```meta-custom/recipes-kernel/linux/device-tree/README.md```
- FPGA Bitstream
	```meta-custom/recipes-fpga/fpga-bitstream/README.md```

## scripts
Contains helper scripts and configuration files for generating QSPI JIC images from Yocto build outputs.
Refer to ```scripts/README.md``` for detailed instructions on creating bootable images for QSPI flash.

# Yocto Build

## Prepare FPGA Bitstream (RBF)

The Yocto build needs the FPGA core bitstream before it starts. `kas.yml` sets:

```
FPGA_ENABLE_CORE_PGM ?= "1"
FPGA_RBF_FILE        ?= "baseline.core.rbf"
```

With core programming enabled, `fpga-bitstream.bb` fetches
`meta-custom/recipes-fpga/fpga-bitstream/files/${FPGA_RBF_FILE}`. **The bitstream is not
stored in this repository** - `*.rbf` and `*.sof` are listed in `.gitignore` and only a
`.dummy` placeholder is tracked. A fresh clone therefore fails at `do_fetch` until you
supply the file.

**Preferred - top-level Make** builds the hardware, generates the core RBF from the SOF and
copies it into place automatically:

```bash
# from dk-si-agi027fd-oobe/pcie-rp/
make dk-si-agi027fd-oobe-baseline-pcie-rp-all
```

`dk-si-agi027fd-oobe-baseline-pcie-rp-build` on its own also produces
`output_files/baseline.core.rbf`: `project_config.mk` makes the core RBF a prerequisite of the
hardware build target on Agilex 7.

**Manual copy**, if you already have a core RBF:

```bash
# From software/yocto_linux/
cp <path>/baseline.core.rbf meta-custom/recipes-fpga/fpga-bitstream/files/baseline.core.rbf
```

The filename must match `FPGA_RBF_FILE`. If you rename the hardware revision, change both.

Setting `FPGA_ENABLE_CORE_PGM = "0"` builds a `kernel.itb` with **no** bitstream inside and
selects the `fit_agilex7_kernel_no_rbf_pcie_rp.its` FIT, which provides only `board-0` and
`board-2`. Booting `board-4` then fails because that configuration does not exist.

## Build environment

**Prerequisites**
- Ubuntu 22.04 LTS or later is recommended for Yocto builds
- The system shell must use bash instead of dash. On Ubuntu 22.04, run:
  ```bash
  sudo ln -sf /bin/bash /bin/sh
  ```
- Network access to the public `altera-fpga` repositories (`meta-altera-fpga`, `linux-socfpga`,
  `u-boot-socfpga`, `arm-trusted-firmware`). No credentials are required.
  KAS runs git with a temporary `HOME`, so pass your git configuration explicitly:
  ```bash
  export GITCONFIG_FILE=$HOME/.gitconfig
  ```

Install the following host packages and tools required for yocto build.

**Host packages**
```bash
# apt install build-essential chrpath cpio debianutils diffstat file gawk gcc git iputils-ping libacl1 liblz4-tool locales python3 python3-git python3-jinja2 python3-pexpect python3-pip python3-subunit python3-newt socat texinfo unzip wget xz-utils zstd
```
Reference, https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html#build-host-packages

**KAS tool**
```bash
$ python3 -m venv venv --system-site-packages
$ source venv/bin/activate
$ pip install --upgrade pip
$ pip install kas
$ pip install kconfiglib
```
Reference, https://kas.readthedocs.io/en/latest/userguide/getting-started.html#dependencies-installation

## How to build

### Build from the design RBF

From this directory, after the hardware build has written `output_files/baseline.core.rbf`:

```bash
./build.sh ../../output_files/baseline.core.rbf sd
```

`build.sh` copies that file to `meta-custom/recipes-fpga/fpga-bitstream/files/baseline.core.rbf` (the name set by `FPGA_RBF_FILE` in `kas.yml`) and builds `console-image-minimal` and `gsrd-console-image`.

SD card images, `kernel.itb`, and `u-boot-spl-dtb.hex` are written to
`build/tmp/deploy/images/agilex7/`. The FIT configurations inside `kernel.itb` are listed under
[Binaries](#binaries) below.

`build.sh` accepts four boot sources; they differ in the images they build:

| `BOOT_SOURCE` | kas configuration | Targets built |
|---------------|-------------------|---------------|
| `sd`, `emmc` | `kas.yml` | `console-image-minimal` and `gsrd-console-image` |
| `nand` | `kas.yml` | `console-image-minimal` |
| `qspi` | `kas.yml:qspi_boot_src.yml` | `console-image-minimal` |

### Default build

`kas.yml` declares the default targets, so a bare `kas build` produces the same images as
`build.sh`:

```yaml
target:
  - console-image-minimal
  - gsrd-console-image
```

```bash
$ kas build kas.yml
```

- **Using Yocto GUI**
```bash
# Run kas menu command and Build
$ kas menu
```

(or)

- **From command line**
```bash
# Set bitbake build environment
$ kas shell kas.yml

# Build console-image-minimal
$ bitbake -c build console-image-minimal
```

### Custom build
- **Using Yocto GUI**
```bash
# Run kas menu command and do custom configurations using menu & Build
$ kas menu
```

(or)

- **From command line**
```bash
# Generate .config.yaml using KAS GUI
#  Run kas menu, do configurations and Save & Exit
#  This command generates .config.yaml after Save & Exit
$ kas menu

# Set bitbake build environment
$ kas shell .config.yaml

# Build console-image-minimal
$ bitbake -c build console-image-minimal
```
### Binaries
After the build, the generated binaries can be found in ```build/tmp/deploy/images/<machine>/.```

**List of Binaries**
|Binaries								        |Description                                                            |
|-----------------------------------------------|-----------------------------------------------------------------------|
|uboot.env										|U-Boot environment file.                                               |
|boot.scr.uimg  								|Boot script.                                                           |
|u-boot-spl-dtb.bin								|U-Boot FSBL image in binary format.                                    |
|u-boot-spl-dtb.hex								|U-Boot FSBL image in hex format.                                       |
|u-boot.itb										|U-Boot proper + device tree blob.                                      |
|bl31.bin                                       |Arm Trusted Firmware                                                   |
|Image											|Linux Kernel image.                                                    |
|kernel.itb										|Linux kernel Image (Image + DTB + RBF, if RBF programming is enabled). |
|socfpga_agilex_socdk.dtb					|Basic/Minimal device tree blob for Linux Kernel.                 	    |
|socfpga_agilex7i_socdk_pcie_root_port.dtb						|Dev kit specific and full featured Device tree blob for Linux Kernel.  |
|console-image-minimal-agilex7.rootfs.tar.gz	|console-image-minimal rootfs.					                        |
|console-image-minimal-agilex7.rootfs_nor.ubifs        |QSPI boot mode specific console-image-minimal rootfs.                  |
|console-image-minimal-agilex7.rootfs.cpio.gz.u-boot	|console-image-minimal for RAMDISK boot.                                |
|gsrd-console-image-agilex7.rootfs.cpio.gz.u-boot      |gsrd-console-image for RAMDISK boot.                                   |
|console-image-minimal-agilex7.rootfs.wic              |SD/MMC bootable disk image.                                            |
|gsrd-console-image-agilex7.rootfs.wic                 |SD/MMC bootable disk image.                                            |

**`kernel.itb` configurations**

`kernel.itb` is a signed FIT built from
`meta-custom/recipes-kernel/linux/linux-socfpga-lts/fit_agilex7_kernel_pcie_rp.its`.
Boot a specific configuration from U-Boot with `bootm ${loadaddr}#board-2`.

| Configuration | DTB | FPGA core RBF | Use |
|---------------|-----|---------------|-----|
| `board-0` (default) | PCIe Root Port | yes | SD boot default |
| `board-1` | Vanilla board DTB (`LINUX_DTS_FILE`) | no | Boot without the PCIe Root Port |
| `board-2` | PCIe Root Port | no | Core RBF already loaded via JTAG or U-Boot |
| `board-4` | PCIe Root Port | yes | GSRD 1.0 compatible name |

When `FPGA_ENABLE_CORE_PGM = "0"`, `fit_agilex7_kernel_no_rbf_pcie_rp.its` is used instead and
only `board-0` and `board-2` exist.

### Top-level Make targets

The design root (`dk-si-agi027fd-oobe/pcie-rp/`) drives hardware and software together.
Run `make help` there for the full list.

```bash
# Hardware + core RBF + Yocto SD software
make dk-si-agi027fd-oobe-baseline-pcie-rp-all
# Hardware only (also writes output_files/baseline.core.rbf)
make dk-si-agi027fd-oobe-baseline-pcie-rp-build
# Software only (needs the SOF from the hardware build)
make dk-si-agi027fd-oobe-baseline-pcie-rp-software-yocto_linux_sd-build-sw
# Install SOF / reports / software artifacts under install/
make dk-si-agi027fd-oobe-baseline-pcie-rp-install
```

### Programming files with FSBL (quartus_pfg)

`u-boot-spl-dtb.hex` is produced by this Yocto build under
`build/tmp/deploy/images/agilex7/`. After a build:

```bash
# From dk-si-agi027fd-oobe/pcie-rp/syn/
quartus_pfg -c -o hps=on \
  -o hps_path=../software/yocto_linux/build/tmp/deploy/images/agilex7/u-boot-spl-dtb.hex \
  output_files/top.sof \
  output_files/top.rbf
```

Hardware compile details: [../../README.md](../../README.md).

### Steps to create QSPI bootable image (JIC)
Follow steps mentioned in ```scripts/README.md``` file.

### Notes

#### KAS Configuration - Include and Append/Override configurations

KAS supports modularizing build configurations by allowing multiple YAML files to be included and merged.
When multiple files are specified, KAS processes and merges them **in order**, with settings in later files overriding those from earlier ones.
This mechanism enables maintaining a stable base configuration while applying targeted overrides or additions as needed.

**Usage Example**

Before building, verify final configuration after merge:
```bash
kas dump kas.yml:qspi_boot_src.yml
```

To build the project:
```bash
kas build kas.yml:qspi_boot_src.yml
```

* `kas.yml` is the base configuration file; it already includes `kas/machine.yml` and `kas/bsp.yml`.
* `qspi_boot_src.yml` contains override settings for QSPI boot.
* `kas/bsp.yml` contains the BSP pins (ATF/U-Boot/Linux branches and versions).
* `kas/machine.yml` contains machine and device-tree settings (e.g. `MACHINE`, `LINUX_DTS_FILE`, `CUSTOM_LINUX_DTS_FILE`).

This layered approach promotes a clean and maintainable configuration strategy, allowing you to customize specific settings without altering the main configuration directly.

**Example `kas.yml` with Includes**

```yaml
header:
  version: 17
  includes:
    - kas/machine.yml
    - kas/bsp.yml
```

* Here, `kas/machine.yml` and `kas/bsp.yml` are included and merged in that order.
* Later files can override or add settings to earlier ones.

**References**

* [Including In-Tree Configuration Files](https://kas.readthedocs.io/en/latest/userguide/project-configuration.html#including-in-tree-configuration-files)
* [Including Configuration Files from Other Repos](https://kas.readthedocs.io/en/latest/userguide/project-configuration.html#including-configuration-files-from-other-repos)
* [Including Configuration Files via the Command Line](https://kas.readthedocs.io/en/latest/userguide/project-configuration.html#including-configuration-files-via-the-command-line)

#### Bitbake commands for building key targets
- **Core Image**
```bash
$ bitbake -c build core-image-minimal
```
- **GSRD Image**
```bash
$ bitbake -c build gsrd-console-image
```
- **U-Boot**
```bash
$ bitbake -c build u-boot-socfpga (or) bitbake -c build virtual/bootloader
```
- **Linux**
```bash
$ bitbake -c build linux-socfpga-lts  (or) bitbake -c build virtual/kernel
```
- **ATF**
```bash
$ bitbake -c build arm-trusted-firmware
```
- **Device Tree**
```bash
$ bitbake -c build device-tree
```

### Documentation
- [PCIe Root Port User Guide: Agilex 7 I-Series Transceiver-SoC Development Kit](https://altera-fpga.github.io/latest/embedded-designs/agilex-7/i-series/pcie_rp/ug-pcie_rp-agx7i-soc/)
- [KAS] https://kas.readthedocs.io/en/latest/
- [YOCTO] https://docs.yoctoproject.org/

