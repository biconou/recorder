#!/bin/bash

CARD="hw:0"

# Route playback from RPi to LineOut jack.
# Optionally route sound through equalizers.

# Set volume on HPOUT2 (LineOut) to a sane level, to avoid loud bursts.
amixer -q -D${CARD} cset name='HPOUT2 Digital Switch' on
amixer -q -D${CARD} cset name='HPOUT2 Digital Volume' 128
amixer -q -D${CARD} cset name='HPOUT2L Input 1 Volume' 20
amixer -q -D${CARD} cset name='HPOUT2R Input 1 Volume' 20
if [ "$1" = eq ]
then
	# Route sound through equalizers
	# Route RPi input AIF1RX{1,2} through equalizsers EQ{1,2} to LineOut jack HPOUT2{L,R}
	# AIF1RX --> EQ --> HPOUT2
	amixer -q -D${CARD} cset name='EQ1 Input 1' AIF1RX1
	amixer -q -D${CARD} cset name='EQ2 Input 1' AIF1RX2
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

else
	#  No EQ, send sound straight from RPi to LineOut.
	#  Route RPi input (AudioInterFace1) to LineOut jack (HeadPhone2)
	amixer -q -D${CARD} cset name='HPOUT2L Input 1' AIF1RX1
	amixer -q -D${CARD} cset name='HPOUT2R Input 1' AIF1RX2


fi

