#!/bin/bash

CARD="hw:0"

# Route SPDIF input to LineOut jack.
# Optionally route sound through equalizers.
# WM8804 SPDIF chip is connected to AIF2 on WM5102.

# Open SPDIF in
amixer -q -D${CARD} cset name='SPDIF in Switch' on

# Switch off SPDIF TX in case already active as WM8804 must run at RX rate if enabled
amixer -q -D${CARD} cset name='TX Playback Switch' off
amixer -q -D${CARD} cset name='RX Playback Switch' on
amixer -q -D${CARD} cset name='AIF Playback Switch' on

# Set volume on HPOUT2 (LineOut) to a sane level first, to avoid loud bursts.
amixer -q -D${CARD} cset name='HPOUT2 Digital Volume' 128
amixer -q -D${CARD} cset name='HPOUT2L Input 1 Volume' 20
amixer -q -D${CARD} cset name='HPOUT2R Input 1 Volume' 20
if [ "$1" = eq ]
then
	# Route sound through equalizers
	# Route SPDIF input AIF2RX{1,2} through equalizsers EQ{1,2} to LineOut jack HPOUT2{L,R}
	# AIF2RX --> EQ --> HPOUT2
	amixer -q -D${CARD} cset name='EQ1 Input 1' AIF2RX1
	amixer -q -D${CARD} cset name='EQ2 Input 1' AIF2RX2
	amixer -q -D${CARD} cset name='HPOUT2L Input 1' EQ1 
	amixer -q -D${CARD} cset name='HPOUT2R Input 1' EQ2

	# Adjust equalizers.
	# My cheap PC speakers need some bass and a slight treble boost.
	# Valid values: 0 - 24 (-12dB to +12dB in 1dB steps)
	# Left channel
	amixer -q -D${CARD} cset name='EQ1 B1 Volume' 16	# +4dB
	amixer -q -D${CARD} cset name='EQ1 B2 Volume' 13	# +1dB
	amixer -q -D${CARD} cset name='EQ1 B3 Volume' 12
	amixer -q -D${CARD} cset name='EQ1 B4 Volume' 12
	amixer -q -D${CARD} cset name='EQ1 B5 Volume' 14	# +2dB
	# Right channel
	amixer -q -D${CARD} cset name='EQ2 B1 Volume' 16
	amixer -q -D${CARD} cset name='EQ2 B2 Volume' 13
	amixer -q -D${CARD} cset name='EQ2 B3 Volume' 12
	amixer -q -D${CARD} cset name='EQ2 B4 Volume' 12
	amixer -q -D${CARD} cset name='EQ2 B5 Volume' 14

	# If we want to be able to record the unequalized sound, send output from AIF2RX (SPDIFin) to AIF1TX (I2S to RPi)
	# AIF2 --> AIF1
	amixer -q -D${CARD} cset name='AIF1TX1 Input 1' AIF2RX1
	amixer -q -D${CARD} cset name='AIF1TX2 Input 1' AIF2RX2
	# ...or if we want to record the equalized sound, send output from equalizers to AIF1TX (I2S to RPi)...
	# EQ --> AIF1 
	# amixer -q -D${CARD} cset name='AIF1TX1 Input 1' EQ1
	# amixer -q -D${CARD} cset name='AIF1TX2 Input 1' EQ2
else
	#  No EQ, send sound straight from SPDIFin to LineOut
	#  Route SPDIF input (AudioInterFace2) to LineOut jack (HeadPhone2)
	amixer -q -D${CARD} cset name='HPOUT2L Input 1' AIF2RX1
	amixer -q -D${CARD} cset name='HPOUT2R Input 1' AIF2RX2

	# If we want to be able to record what we listen to, send output from AIF2RX (SPDIFin) to AIF1TX (I2S to RPi)
	# AIF2 --> AIF1
	amixer -q -D${CARD} cset name='AIF1TX1 Input 1' AIF2RX1
	amixer -q -D${CARD} cset name='AIF1TX2 Input 1' AIF2RX2

fi

