#!/bin/bash
# Playback from RPi to Speakers.
CARD="hw:0"

# Route sound through equalizers
# AIF1RX --> EQ --> SPKOUT

# Route input AIF1RX{1,2} to equalizers EQ{1,2}
amixer -q -D${CARD} cset name='EQ1 Input 1' AIF1RX1
amixer -q -D${CARD} cset name='EQ2 Input 1' AIF1RX2

# Adjust equalizers.
# My cheap PC speakers need some bass and also a treble boost.
#
# Valid values: 0 - 24 (-12dB to +12dB in 1dB steps)
# Left channel
amixer -q -D${CARD} cset name='EQ1 B1 Volume' 20        # +8dB
amixer -q -D${CARD} cset name='EQ1 B2 Volume' 16        # +4dB
amixer -q -D${CARD} cset name='EQ1 B3 Volume' 12
amixer -q -D${CARD} cset name='EQ1 B4 Volume' 14	# +2dB
amixer -q -D${CARD} cset name='EQ1 B5 Volume' 16        # +4dB
# Right channel
amixer -q -D${CARD} cset name='EQ2 B1 Volume' 20
amixer -q -D${CARD} cset name='EQ2 B2 Volume' 16
amixer -q -D${CARD} cset name='EQ2 B3 Volume' 12
amixer -q -D${CARD} cset name='EQ2 B4 Volume' 14
amixer -q -D${CARD} cset name='EQ2 B5 Volume' 16

amixer -D${CARD} cset name='Speaker Digital Volume' 128
# reset speaker mixer inputs
amixer -q -D${CARD} cset name='SPKOUTL Input 1' None
amixer -q -D${CARD} cset name='SPKOUTR Input 1' None
amixer -q -D${CARD} cset name='SPKOUTL Input 2' None
amixer -q -D${CARD} cset name='SPKOUTR Input 2' None
# Route EQ to Speaker mixer
amixer -q -D${CARD} cset name='SPKOUTL Input 1' EQ1
amixer -q -D${CARD} cset name='SPKOUTL Input 1 Volume' 32
amixer -q -D${CARD} cset name='SPKOUTR Input 1' EQ2
amixer -q -D${CARD} cset name='SPKOUTR Input 1 Volume' 32
# Unmute speaker output
amixer -q -D${CARD} cset name='Speaker Digital Switch' on

