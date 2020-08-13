#!/bin/sh
#
# This file was automatically generated.
#
# It can be overwritten by nios2-flash-programmer-generate or nios2-flash-programmer-gui.
#

#
# Converting SOF File: F:\test\MAX10M08-nios2\output_files\main.sof to: "..\flash/main_onchip_flash_0_data.flash"
#
sof2flash --input="F:/test/MAX10M08-nios2/output_files/main.sof" --output="../flash/main_onchip_flash_0_data.flash" --offset=0x0 --verbose 

#
# Programming File: "..\flash/main_onchip_flash_0_data.flash" To Device: onchip_flash_0_data
#
nios2-flash-programmer "../flash/main_onchip_flash_0_data.flash" --base=0x20000 --accept-bad-sysid --device=1 --instance=0 '--cable=Arrow-USB-Blaster on localhost [USB0]' --program --verbose 

#
# Converting ELF File: F:\test\MAX10M08-nios2\software\HelloWorld\HelloWorld.elf to: "..\flash/HelloWorld_onchip_flash_0_data.flash"
#
elf2flash --input="F:/test/MAX10M08-nios2/software/HelloWorld/HelloWorld.elf" --output="../flash/HelloWorld_onchip_flash_0_data.flash" --boot="$SOPC_KIT_NIOS2/components/altera_nios2/boot_loader_cfi.srec" --base=0x20000 --end=0x3c800 --reset=0x20000 --verbose 

#
# Programming File: "..\flash/HelloWorld_onchip_flash_0_data.flash" To Device: onchip_flash_0_data
#
nios2-flash-programmer "../flash/HelloWorld_onchip_flash_0_data.flash" --base=0x20000 --accept-bad-sysid --device=1 --instance=0 '--cable=Arrow-USB-Blaster on localhost [USB0]' --program --verbose 

