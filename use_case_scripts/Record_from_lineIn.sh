#!/bin/bash

#Record from onboard Line Input to AP


# +9dB input PGA gain
amixer -Dhw:0 cset name='IN3L Volume' 5
amixer -Dhw:0 cset name='IN3R Volume' 5

# better THD in normal mode vs lower noise floor in high performance
amixer -Dhw:0 cset name='IN3 High Performance Switch' on

amixer -Dhw:0 cset name='IN3L Digital Volume' 112
amixer -Dhw:0 cset name='IN3R Digital Volume' 112

amixer -Dhw:0 cset name='AIF1TX1 Input 1' IN3L
amixer -Dhw:0 cset name='AIF1TX1 Input 1 Volume' 32
amixer -Dhw:0 cset name='AIF1TX2 Input 1' IN3R
amixer -Dhw:0 cset name='AIF1TX2 Input 1 Volume' 32

# The following command should be used to test
# arecord -Dhw:0 -r 44100 -c 2 -f S32_LE <file>



