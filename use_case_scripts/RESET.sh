#!/bin/bash -x
CARD="hw:0"

# Set every Input there is to 'none'

OUTPUTS="AIF1TX1 AIF1TX2 AIF2TX1 AIF2TX2 HPOUT1L HPOUT1R HPOUT2L HPOUT2R SPKOUTL SPKOUTR"
for OUTPUT in ${OUTPUTS}
do
	for INPUT in $(seq 1 4)
	do
		amixer -q -D${CARD} cset name=$OUTPUT' Input '${INPUT}, none
	done
done

# Switch everything off
amixer -q -D${CARD} cset name='TX Playback Switch' off
amixer -q -D${CARD} cset name='RX Playback Switch' off
amixer -q -D${CARD} cset name='AIF Playback Switch' off
amixer -q -D${CARD} cset name='SPDIF in Switch' off
amixer -q -D${CARD} cset name='SPDIF out Switch' off
amixer -q -D${CARD} cset name='Headset Mic Switch' off
amixer -q -D${CARD} cset name='DMIC Switch' off
amixer -q -D${CARD} cset name='Speaker Digital Switch' off
