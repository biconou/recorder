#!/bin/bash


#Playback from AP to Headset
amixer -q -Dhw:0 cset name='HPOUT1 Digital Switch' on
# Set path gain to -6dB for safety. ie mav 0.5Vrms output level.
amixer -q -Dhw:0 cset name='HPOUT1 Digital Volume' 116
# do we want to clear the HPOUT mixers inputs?
amixer -q -Dhw:0 cset name='HPOUT1L Input 1' None
amixer -q -Dhw:0 cset name='HPOUT1R Input 1' None
amixer -q -Dhw:0 cset name='HPOUT1L Input 2' None
amixer -q -Dhw:0 cset name='HPOUT1R Input 2' None
amixer -q -Dhw:0 cset name='HPOUT1L Input 1' AIF1RX1
amixer -q -Dhw:0 cset name='HPOUT1L Input 1 Volume' 32
amixer -q -Dhw:0 cset name='HPOUT1R Input 1' AIF1RX2
amixer -q -Dhw:0 cset name='HPOUT1R Input 1 Volume' 32
amixer -q -Dhw:0 cset name='Headset Mic Switch' on


# The following command can be used to test
# aplay -Dhw:0 -r 44100 -c 2 -f S32_LE <file>



