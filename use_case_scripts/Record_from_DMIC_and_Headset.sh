#!/bin/bash

# Record from onboard DMICs (IN2)
# May want to tune the gain here
# Need at least -6dB
amixer -Dhw:0 cset name='IN2L Digital Volume' 116
amixer -Dhw:0 cset name='IN2R Digital Volume' 116
amixer -Dhw:0 cset name='AIF1TX1 Input 1' IN2L	# Connect IN2L (DMIC Left) to Input 1 of AudioInterface1 Transmitter 1 (I2S to RPi)
amixer -Dhw:0 cset name='AIF1TX1 Input 1 Volume' 32
amixer -Dhw:0 cset name='AIF1TX2 Input 1' IN2R	# Connect IN2R (DMIC Right) to Input 1 of AudioInterface1 Transmitter 2 (I2S to RPi)
amixer -Dhw:0 cset name='AIF1TX2 Input 1 Volume' 32
amixer -Dhw:0 cset name='DMIC Switch' on

# Record from Headset (IN1) 
amixer -Dhw:0 cset name='IN1R Volume' 20
amixer -Dhw:0 cset name='IN1 Digital Switch' on

# Route IN1R (Headset mic) to Input 2 of both Left and Right on AIF1, i.e. dual mono.
amixer -Dhw:0 cset name='AIF1TX1 Input 2' IN1R	# Connect IN1R (Headset  Mic) to Input 2 of AudioInterface1 Transmitter 1 (I2S to RPi)
amixer -Dhw:0 cset name='AIF1TX1 Input 2 Volume' 32
amixer -Dhw:0 cset name='AIF1TX2 Input 2' IN1R	# Connect IN1R (Headset  Mic) to Input 2 of AudioInterface1 Transmitter 1 (I2S to RPi)
amixer -Dhw:0 cset name='AIF1TX2 Input 2 Volume' 32
# Switch the Headset mic on
amixer -Dhw:0 cset name='Headset Mic Switch' on


