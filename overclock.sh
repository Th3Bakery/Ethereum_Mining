#!/bin/bash

# Purpose: overclock NVIDIA GPU Cards
# To use this script, open terminal and execute: cd && ./overclock.sh

# Script needs to run as sudo for nvidia-smi settings to take effect
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

# Setting a terminal variable called memoryOffset

# Since all my cards are the same, I'm happy with using the same 
#   Memory Transfer Rate Offset

# Set Memory Offset for 1080TI (in card slot 0)
memoryOffset="650"

# Enable nvidia-smi settings so they are persistent the whole time
#   the system is on.

nvidia-smi -pm 1

# Set the power limit for each card (note this value is in watts, not
#   percent!

# Tested 1080 TI
# mem 550, pl 206, 34.05 MH/s
# mem 650, pl 213, 34.45 MH/s
# mem 700, pl 213, 33.12 MH/s
# mem 580, pl 213, 34.44 MH/s

# Tested 1060 (6gb)
# mem 800, pl, 150, 18.56 MH/s

# Set Power Limit for Card 0: the 1080 TI
nvidia-smi -i 0 -pl 213
# Set Power Limit for card 1: the 1060
nvidia-smi -i 1 -pl 150

# Apply overclocking settings to each GPU
nvidia-settings -a [gpu:0]/GpuPowerMizerMode=1
nvidia-settings -a [gpu:0]/GPUMemoryTransferRateOffset[2]=$memoryOffset

# Set Memory Offset for 1060 (6gb)
memoryOffset="800"

nvidia-settings -a [gpu:1]/GpuPowerMizerMode=1
nvidia-settings -a [gpu:1]/GPUMemoryTransferRateOffset[2]=$memoryOffset

