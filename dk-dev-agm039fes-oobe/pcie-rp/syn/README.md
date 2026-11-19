# Building the Hardware

# Dependency

- Altera® Quartus® Prime Pro software suite (see [Project Details](../README.md#project-details) for the supported version)

# Build Steps

1. Compile the design and generate the configuration (SOF) file.

   This `syn/` folder contains a Makefile and the Quartus project (`top.qpf` / `top.qsf`). The Makefile supports various compile options such as:

   - `make compile` — runs the compile stage of Quartus
   - `make synth` — runs the synthesis stage of Quartus
   - `make all` — runs a full Quartus compile including the Assembler
   - `make asm` — runs the Assembler
   - `make clean` — cleans build outputs

   Running `make` (or `make help`) prints the options supported.

   Alternatively, if using the GUI is preferred, open `top.qpf` in Quartus and select compile options there.

   ```bash
   cd syn/
   make all
   ```

   Outputs are under `output_files/` (SOF name is `top.sof`).

   The top-level Makefile in `pcie-rp/` copies that SOF to
   `output_files/baseline.sof` and generates the matching
   `.core.rbf` for Yocto.
