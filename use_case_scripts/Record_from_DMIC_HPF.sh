#!/bin/bash

# Record from onboard DMICs to RPi.
# Route through High Pass Filter to get rid of DC offset.
# 
# IN2 --> LHPF --> AIF1TX

# May want to tune the gain here
# Need at least -6dB
amixer -Dhw:0 cset name='IN2L Digital Volume' 128
amixer -Dhw:0 cset name='IN2R Digital Volume' 128

# DMICs are incorrectly labelled on the board.
# DMICL is actually the right channel and vice versa,
# so we'll swap them here.
# i.e. IN2R --> LHPF1
#      IN2L --> LHPF2
# Route DMICs (IN2) to LHPFs.
amixer -Dhw:0 cset name='LHPF1 Input 1' IN2R
amixer -Dhw:0 cset name='LHPF2 Input 1' IN2L
amixer -Dhw:0 cset name='LHPF1 Mode' High-pass
amixer -Dhw:0 cset name='LHPF2 Mode' High-pass

# Connect outputs of LHPFs to inputs of AIF1 (I2s to RPi)
amixer -Dhw:0 cset name='AIF1TX1 Input 1' LHPF1
amixer -Dhw:0 cset name='AIF1TX1 Input 1 Volume' 32
amixer -Dhw:0 cset name='AIF1TX2 Input 1' LHPF2
amixer -Dhw:0 cset name='AIF1TX2 Input 1 Volume' 32

amixer -Dhw:0 cset name='DMIC Switch' on




