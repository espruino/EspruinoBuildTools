Downloaded from https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads (originally https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads)

If we download the files direct from developer.arm.com builds often fail purely because the file cannot be downloaded.

**Note:** Some archives have been stripped back from their distributions in order to allow hosting on GitHub (<100MB) to increase the speed and reliability of CI builds:

* `gcc-arm-none-eabi-8-2018-q4-major-linux.tar.bz2` : `doc` folder removed
* `arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-eabi-stripped.tar.xz` : `share/doc`,`share/man` folders removed, symbols stripped from executables with `strip  bin/* arm-none-eabi/bin/* libexec/gcc/arm-none-eabi/13.2.1/{cc*,f*,lto1}`

Toolchains for arm64 (ARMV8+) host (while building Espruino on Android phone)
* `arm-gnu-toolchain-13.2.Rel1-aarch64-arm-none-eabi-stripped.tar.xz` : `share/doc`,`share/man` folders removed, symbols stripped from executables with `strip  bin/* arm-none-eabi/bin/* libexec/gcc/arm-none-eabi/13.2.1/{cc*,f*,lto1}`
The architectures actually used are:

* nRF51 (micro:bit 1) : v6-m/nofp
* nRF52: Cortex M4 v7e-m+fp/softfp
* Original Espruino: Cortex M3 v7-m/nofp

So potentially libraries for others targets could be removed from the compiler in future to reduce the file size further, 
