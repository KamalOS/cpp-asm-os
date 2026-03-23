# MiniOS

A minimal, custom 32-bit operating system kernel written in C++ and Assembly.

## Prerequisites

- **Tools**: Linux environment (or WSL on Windows), GCC toolchain (`g++`, `as`, `ld`), 32-bit dev libraries (`gcc-multilib`, `g++-multilib`), `grub-mkrescue`, and `xorriso`.
- **Virtualization**: Oracle VirtualBox (installed on Windows at `C:\Program Files\Oracle\VirtualBox\`) with a VM named **`myOS`** configured to boot from an optical drive.

## Usage

Build the bootable ISO (`mykernel.iso`):
```bash
make mykernel.iso
```

Build and automatically boot it in VirtualBox:
```bash
make run
```

Clean the generated files:
```bash
make clean
```
