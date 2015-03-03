#!/bin/bash


#Playback from AP to Speaker

amixer -q -Dhw:0 cset name='Speaker Digital Volume' 128
# reset speaker mixer inputs
amixer -q -Dhw:0 cset name='SPKOUTL Input 1' None
amixer -q -Dhw:0 cset name='SPKOUTR Input 1' None
amixer -q -Dhw:0 cset name='SPKOUTL Input 2' None
amixer -q -Dhw:0 cset name='SPKOUTR Input 2' None
# Route AP to Speaker mixer
amixer -q -Dhw:0 cset name='SPKOUTL Input 1' AIF1RX1
amixer -q -Dhw:0 cset name='SPKOUTL Input 1 Volume' 32
amixer -q -Dhw:0 cset name='SPKOUTR Input 1' AIF1RX2
amixer -q -Dhw:0 cset name='SPKOUTR Input 1 Volume' 32
# Unmute speaker output
amixer -q -Dhw:0 cset name='Speaker Digital Switch' on


# The following command can be used to test
# aplay -Dhw:0 -r 44100 -c 2 -f S32_LE <file>
