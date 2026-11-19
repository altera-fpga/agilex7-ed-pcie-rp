#===============================================
# Copyright (C) 2025 Altera Corporation.
# SPDX-License-Identifier: MIT
#===============================================
#
# Makefile to run Quartus Prime Pro / QSys Design
#
#===============================================
# USER TOPLEVEL CONFIGURATION 
#===============================================
# None currently. Expected to change when more design variants are added

SHELL := /bin/bash
MAKEFLAGS += --no-print-directory

.SECONDEXPANSION:
.SUFFIXES:
.DELETE_ON_ERROR:


#===============================================
# Tools
#===============================================
MAKE	         := make $(MFLAGS)
CAT              := cat
CD               := cd
CHMOD            := chmod
CP               := cp -rf
DATE             := date
ECHO             := echo
FIND             := find
GREP             := grep
HEAD             := head
MKDIR            := mkdir -p
MV               := mv
RM               := rm -rf
SED              := sed
TAR              := tar
TOUCH            := touch
WHICH            := which
TARGET_DIR       := $(shell pwd)
AWK              := awk
SORT             := sort

#===============================================
# configuration
#===============================================
PROJECT_ROOT                  := $(PWD)
MODULES_FILE                  := build.module
BUILD_DIR                     := build
HELP_TITLE_FILE               := help.title
USER_CONFIG_FILE              := $(BUILD_DIR)/config

#===============================================
# Quartus
#===============================================
QUARTUS          :=  quartus
QUARTUS_STP      :=  quartus_stp
QUARTUS_SH       :=  quartus_sh
QUARTUS_PFG      :=  quartus_pfg
QUARTUS_PGM      :=  quartus_pgm
QSYS_GENERATE    :=  qsys-generate
QSYS_SCRIPT      :=  qsys-script

#User options
TOP         := top
REV         := top

COMPILE_PREFIX  :=
COMPILE_ARG     :=
COMPILE_POSTFIX :=

SYNTH_PREFIX    :=$(COMPILE_PREFIX)
SYNTH_ARG       :=$(COMPILE_ARG)
SYNTH_POSTFIX   :=$(COMPILE_POSTFIX)

FIT_PREFIX      :=
FIT_ARG         :=
FIT_POSTFIX     :=

# Helpful Macros
SPACE := $(empty) $(empty)

ifndef QUARTUS_ROOTDIR
$(error Quartus is not setup. Please ensure Quartus can be run in this shell)
endif


## ----------------------------------------------------------------------
## This Makefile runs the various stages of Quartus. The options supported
## are listed below
## ----------------------------------------------------------------------

help:     ## Shows this help.
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST)
	
#Clean generated files
clean:    ## Cleans generated files.
	cd $(TARGET_DIR) && \
	rm -rf qdb quartus.ini *.qws output_files tmp-clearbox *.csv *.txt DNI support_logic

# Runs full compile
all:      ## Runs a full Quartus compile including Assembler.
	$(MAKE) --no-print-directory runcompile runasm

#Just compiles
compile:  ## Runs the compile stage only. The Assembler is not run.
	$(MAKE) --no-print-directory runcompile
	
#Just synthesizes
synth:    ## Runs Synthesis only
	$(MAKE) --no-print-directory runsynth

#Just assembler
asm:      ## Runs the assembler only. Needs the outputs of previous steps to work.
	$(MAKE) --no-print-directory runasm

# ###############################################################################################################################
# # Detailed functions6
# ###############################################################################################################################
# 
runbuild:
	cd $(TARGET_DIR) && \
	quartus_sh $(TOP) -c $(REV) 

runcompile:
	cd $(TARGET_DIR) && \
	quartus_sh --flow "compile" $(TOP) -c $(REV)
	
runsynth:
	cd $(TARGET_DIR) && \
 	quartus_sh --flow "compile" $(TOP) -c $(REV)  -end "dni_synthesis"

runasm:
	cd $(TARGET_DIR) && \
	quartus_asm --read_settings_files=on --write_settings_files=off $(TOP) -c $(REV)
	
