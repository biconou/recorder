#!/bin/bash

# Record from Headset
# Route input from IN1R (Right channel of IN1 - Headset mic) to Input 1 of both left and right Front channels of AIF1.
# i.e. Dual mono.
amixer -Dhw:0 cset name='IN1R Volume' 20
amixer -Dhw:0 cset name='IN1 Digital Switch' on
amixer -Dhw:0 cset name='AIF1TX1 Input 1' IN1R		# Headset mic to Input 1 of Left Front channel of AIF1
amixer -Dhw:0 cset name='AIF1TX1 Input 1 Volume' 32
amixer -Dhw:0 cset name='AIF1TX2 Input 1' IN1R		# Headset mic to Input 1 of Right Front channel of AIF1
amixer -Dhw:0 cset name='AIF1TX2 Input 1 Volume' 32
amixer -Dhw:0 cset name='Headset Mic Switch' on

# Record from SPDIF in
amixer -Dhw:0 cset name='SPDIF in Switch' on

# switch off SPDIF TX in case already active as 
# WM8804 must run at RX rate if enabled
amixer -Dhw:0 cset name='TX Playback Switch' off
amixer -Dhw:0 cset name='RX Playback Switch' on
amixer -Dhw:0 cset name='AIF Playback Switch' on

# Route signal from AIF2 (SPDIF) to Input 2 of Left and Right channels on AIF1.
amixer -Dhw:0 cset name='AIF1TX1 Input 2' AIF2RX1	# SPDIF Left (AIF2 channel 1) to Input 2 of Left Front channel of AIF1
amixer -Dhw:0 cset name='AIF1TX1 Input 2 Volume' 24
amixer -Dhw:0 cset name='AIF1TX2 Input 2' AIF2RX2	
amixer -Dhw:0 cset name='AIF1TX2 Input 2 Volume' 24	# SPDIF Right (AIF2 channel 2) to Input 2 of Right Front channel of AIF1




