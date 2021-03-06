#!/bin/bash

#Record from onboard DMICs to AP

# May want to tune the gain here
# Need at least -6dB
amixer -Dhw:0 cset name='IN2L Digital Volume' 128
amixer -Dhw:0 cset name='IN2R Digital Volume' 128
# DMICs are incorrectly labelled on the board.
# DMICL is actually the right channel and vice versa
# so we'll have to swap them here.
# i.e. IN2R --> AIFTX1
#      IN2L --> AIFTX2
amixer -Dhw:0 cset name='AIF1TX1 Input 1' IN2R
amixer -Dhw:0 cset name='AIF1TX1 Input 1 Volume' 32
amixer -Dhw:0 cset name='AIF1TX2 Input 1' IN2L
amixer -Dhw:0 cset name='AIF1TX2 Input 1 Volume' 32
amixer -Dhw:0 cset name='DMIC Switch' on

# The following command should be used to test
# arecord -Dhw:0 -r 44100 -c 2 -f S32_LE <file>



