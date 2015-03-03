#!/bin/bash

# Record from onboard DMICs to RPi

# May want to tune the gain here
# Need at least -6dB
amixer -Dhw:0 cset name='IN2L Digital Volume' 116
amixer -Dhw:0 cset name='IN2R Digital Volume' 116
amixer -Dhw:0 cset name='AIF1TX1 Input 1' IN2R
amixer -Dhw:0 cset name='AIF1TX1 Input 1 Volume' 32
amixer -Dhw:0 cset name='AIF1TX2 Input 1' IN2L
amixer -Dhw:0 cset name='AIF1TX2 Input 1 Volume' 32
amixer -Dhw:0 cset name='DMIC Switch' on

# Record from Headset to RPi
amixer -Dhw:0 cset name='IN1R Volume' 20
amixer -Dhw:0 cset name='IN1 Digital Switch' on
amixer -Dhw:0 cset name='AIF1TX1 Input 2' IN1R
amixer -Dhw:0 cset name='AIF1TX1 Input 2 Volume' 32
amixer -Dhw:0 cset name='AIF1TX2 Input 2' IN1R
amixer -Dhw:0 cset name='AIF1TX2 Input 2 Volume' 32
amixer -Dhw:0 cset name='Headset Mic Switch' on
# This is set up as a dual mono record.

# Record from onboard Line Input to RPi


# +9dB input PGA gain
amixer -Dhw:0 cset name='IN3L Volume' 8
amixer -Dhw:0 cset name='IN3R Volume' 8

# better THD in normal mode vs lower noise floor in high performance
amixer -Dhw:0 cset name='IN3 High Performance Switch' on

amixer -Dhw:0 cset name='IN3L Digital Volume' 128
amixer -Dhw:0 cset name='IN3R Digital Volume' 128

amixer -Dhw:0 cset name='AIF1TX1 Input 3' IN3L
amixer -Dhw:0 cset name='AIF1TX1 Input 3 Volume' 32
amixer -Dhw:0 cset name='AIF1TX2 Input 3' IN3R
amixer -Dhw:0 cset name='AIF1TX2 Input 3 Volume' 32

# Record from SPDIF in

#SPDIF Record: 
amixer -Dhw:0 cset name='SPDIF in Switch' on
# switch off SPDIF TX in case already active as 
# WM8804 must run at RX rate if enabled

amixer -Dhw:0 cset name='TX Playback Switch' off
amixer -Dhw:0 cset name='RX Playback Switch' on
amixer -Dhw:0 cset name='AIF Playback Switch' on
amixer -Dhw:0 cset name='AIF1TX1 Input 4' AIF2RX1
amixer -Dhw:0 cset name='AIF1TX1 Input 4 Volume' 32
amixer -Dhw:0 cset name='AIF1TX2 Input 4' AIF2RX2
amixer -Dhw:0 cset name='AIF1TX2 Input 4 Volume' 32


