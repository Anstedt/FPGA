# FPGA
FPGA Development using GOWIEN IDE for nano 9K

# GOWIN
HAS Project Lists C:\Users\hanst\AppData\Roaming\GowinSemi

# Project Button Info
Based on https://www.youtube.com/watch?v=F5hlv3XTcO0 which is based on a different Nano.

Differences:
Based on schematic: Tang_Nano_9K_3672_schematic.pdf
  Buttons are pins 4 and 5
  LEDS are pins 10 through 16, skipping 12

Notice this sets some sort of pull-up even for the button they use, sys_rst_n:

IO_LOC "led[5]" 16;
IO_PORT "led[5]" PULL_MODE=UP DRIVE=8;
IO_LOC "led[4]" 15;
IO_PORT "led[4]" PULL_MODE=UP DRIVE=8;
IO_LOC "led[3]" 14;
IO_PORT "led[3]" PULL_MODE=UP DRIVE=8;
IO_LOC "led[2]" 13;
IO_PORT "led[2]" PULL_MODE=UP DRIVE=8;
IO_LOC "led[1]" 11;
IO_PORT "led[1]" PULL_MODE=UP DRIVE=8;
IO_LOC "led[0]" 10;
IO_PORT "led[0]" PULL_MODE=UP DRIVE=8;
IO_LOC "sys_rst_n" 4;
IO_PORT "sys_rst_n" PULL_MODE=UP;

It works by golly: see FPGA/projects/led_btn/*
Also added second button controlling second LED

Steps:
- GOWIN, board attached via USB cable
  - New Project and name it
  - Select device
    - GWINR, GW1NR-9C, QN88P, C6/I5
  - On left panel click top line and add Verilog file
    - Write code
    - save it
 - Again top left and add Physical constraints file
   - Define hardware based on HW we are using, use schematics
 - Build it
   - Select "Process" tab on bottom
     - Right "Synthesize" on left panel
       - Pick configuration
         - Select GowinSynthesis if not already selected
         - Fill in module name from Verilog file, they must match
         - Select newer Verilog version, not critical
         - Click OK
    - Double click "Place & Route" which runs both synthesis and routing
  - Load to FPGA which should already be connected
    - Double click "Program Device" in left panel
    - Select our FPGA
      - Use sram
      - Click Program button. looks like a disk driver with a pencil over it
      - Programs and runs the new module/application

# led_io_control
  based on https://github.com/sipeed/TangNano-9K-example/tree/main/led

## What I learned
- Usage of sys_clk, notice it is really pin 52
- Handling logic such as ==, ||, && etc.
- big improvement for me is understanding led bus
- Now I use concatenation correctly
- My own simple flags