#!/bin/bash

CARD="hw:0"
BEQUIET=" -q "
#BEQUIET=""

# Route LineIn input to Speakers.


# Set volume on Speakers to a sane level.
#amixer ${BEQUIET} -D${CARD} cset name='Speaker Digital Volume' 128
amixer ${BEQUIET} -D${CARD} cset name='Speaker Digital Volume' 90
amixer ${BEQUIET} -D${CARD} cset name='SPKOUTL Input 1 Volume' 20
amixer ${BEQUIET} -D${CARD} cset name='SPKOUTR Input 1 Volume' 20
if [ "$1" = eq ]
then
	# Route sound through equalizers
	# Route LineIn input IN3{1,2} through equalizers EQ{1,2} to Speakers
	# IN3 --> EQ --> SPKOUT
	amixer ${BEQUIET} -D${CARD} cset name='EQ1 Input 1' IN3L
	amixer ${BEQUIET} -D${CARD} cset name='EQ2 Input 1' IN3R
	amixer ${BEQUIET} -D${CARD} cset name='SPKOUTL Input 1' EQ1 
	amixer ${BEQUIET} -D${CARD} cset name='SPKOUTR Input 1' EQ2

	# Adjust equalizers.
	# My cheap PC speakers need some bass and a slight treble boost.
	# Valid values: 0 - 24 (-12dB to +12dB in 1dB steps)
	# Left channel
	amixer ${BEQUIET} -D${CARD} cset name='EQ1 B1 Volume' 16	# +4dB
	amixer ${BEQUIET} -D${CARD} cset name='EQ1 B2 Volume' 13	# +1dB
	amixer ${BEQUIET} -D${CARD} cset name='EQ1 B3 Volume' 12
	amixer ${BEQUIET} -D${CARD} cset name='EQ1 B4 Volume' 12
	amixer ${BEQUIET} -D${CARD} cset name='EQ1 B5 Volume' 14	# +2dB
	# Right channel
	amixer ${BEQUIET} -D${CARD} cset name='EQ2 B1 Volume' 16
	amixer ${BEQUIET} -D${CARD} cset name='EQ2 B2 Volume' 13
	amixer ${BEQUIET} -D${CARD} cset name='EQ2 B3 Volume' 12
	amixer ${BEQUIET} -D${CARD} cset name='EQ2 B4 Volume' 12
	amixer ${BEQUIET} -D${CARD} cset name='EQ2 B5 Volume' 14

	# If we want to be able to record the unequalized sound, send output from IN3 (LineIn) to AIF1TX (I2S to RPi)
	# IN3 --> AIF1
	amixer ${BEQUIET} -D${CARD} cset name='AIF1TX1 Input 1' IN3L
	amixer ${BEQUIET} -D${CARD} cset name='AIF1TX2 Input 1' IN3R
	# ...or if we want to record the equalized sound, send output from equalizers to AIF1TX (I2S to RPi)...
	# EQ --> AIF1 
	# amixer ${BEQUIET} -D${CARD} cset name='AIF1TX1 Input 1' EQ1
	# amixer ${BEQUIET} -D${CARD} cset name='AIF1TX2 Input 1' EQ2
else
	#  No EQ, send sound straight from LineIn to Speakers
	amixer ${BEQUIET} -D${CARD} cset name='SPKOUTL Input 1' IN3L
	amixer ${BEQUIET} -D${CARD} cset name='SPKOUTR Input 1' IN3R

	# If we want to be able to record what we listen to, send output from IN3 (LineIn) to AIF1TX (I2S to RPi)
	# IN3 --> AIF1
	amixer ${BEQUIET} -D${CARD} cset name='AIF1TX1 Input 1' IN3L
	amixer ${BEQUIET} -D${CARD} cset name='AIF1TX2 Input 1' IN3R

fi
amixer ${BEQUIET} -D${CARD}  cset name='Speaker Digital Switch' on
