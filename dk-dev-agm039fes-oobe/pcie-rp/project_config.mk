# Define the Quartus project name (matches syn/top.qpf)
PROJECT_NAME := top

# Logical revision / artifact name used under output_files/ and install/
REVISION_NAMES := \
	baseline \

# Define the base revision
BASE_REVISION := $(firstword $(REVISION_NAMES))

MAKE_STEM := dk-dev-agm039fes-oobe-baseline-pcie-rp

# Enable functional simulation
SIM_ENABLED := 0

# Disable strict validation of README.md (DK-DEV-AGM039FES not yet in Quartus kit list)
NO_ENFORCE_README_VALIDATION := 1

###############################################################################
# Core RBF after SOF (rule body lives in swbuild_config.mk).
define enable_core_rbf_for_revision
$(strip $(1))-build: output_files/$(strip $(1)).core.rbf
endef
$(foreach revision,$(REVISION_NAMES),$(eval $(call enable_core_rbf_for_revision,$(revision))))

###############################################################################
# SW build-sw / install-sw FPGA deps.
define create_sw_build_install_targets
.PHONY: software-$(1)-build-sw
software-$(1)-build-sw: $(if $(filter $(1),ryo_linux_sd baremetal_qspi),,output_files/$(strip $(2)).sof output_files/$(strip $(2)).core.rbf)
	$$(MAKE) --no-print-directory -f software/$(1).mk \
		REVISION=$(strip $(2)) \
		INSTALL_ROOT_BINARIES=$$(INSTALL_ROOT_BINARIES) \
		INSTALL_ROOT_ARTIFACTS=$$(INSTALL_ROOT_ARTIFACTS) \
		RESTORE_INSTALL=$$(RESTORE_INSTALL) \
		build-sw

.PHONY: software-$(1)-install-sw
software-$(1)-install-sw: $(if $(filter $(1),ryo_linux_sd baremetal_qspi),,output_files/$(strip $(2)).sof output_files/$(strip $(2)).core.rbf) | $$(INSTALL_ROOT_BINARIES) $$(INSTALL_ROOT_ARTIFACTS)
	$$(MAKE) --no-print-directory -f software/$(1).mk \
		REVISION=$(strip $(2)) \
		INSTALL_ROOT_BINARIES=$$(INSTALL_ROOT_BINARIES) \
		INSTALL_ROOT_ARTIFACTS=$$(INSTALL_ROOT_ARTIFACTS) \
		RESTORE_INSTALL=$$(RESTORE_INSTALL) \
		install-sw
endef
