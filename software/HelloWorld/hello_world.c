/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */
#include "alt_types.h"
#include "altera_avalon_pio_regs.h"
#include "system.h"
#include <stdio.h>
void sdram_test(alt_u8 *base, int len);
int main()
{
  alt_u8 i;
  printf("Hello World!\r\n");
  while(1)
  {
    for(i=0;i<7;i++)
    {
      IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, 1<<i);
      usleep(20000);
    }
    for(i=0;i<7;i++)
    {
      IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, 0x80>>i);
      usleep(20000);
    }
  }
  return 114514;
}

