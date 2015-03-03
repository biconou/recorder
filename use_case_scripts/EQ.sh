#/bin/bash
# Valid values for EQ gain: 0 - 24
# -12dB to +12dB in 1dB steps

if [ "$1" = flat ]
then

# Flat
	amixer -Dhw:0 cset name='EQ1 B1 Volume' 12
	amixer -Dhw:0 cset name='EQ1 B2 Volume' 12
	amixer -Dhw:0 cset name='EQ1 B3 Volume' 12
	amixer -Dhw:0 cset name='EQ1 B4 Volume' 12
	amixer -Dhw:0 cset name='EQ1 B5 Volume' 12

	amixer -Dhw:0 cset name='EQ2 B1 Volume' 12
	amixer -Dhw:0 cset name='EQ2 B2 Volume' 12
	amixer -Dhw:0 cset name='EQ2 B3 Volume' 12
	amixer -Dhw:0 cset name='EQ2 B4 Volume' 12
	amixer -Dhw:0 cset name='EQ2 B5 Volume' 12
else
# Slight bass and treble boost
	amixer -Dhw:0 cset name='EQ1 B1 Volume' 16
	amixer -Dhw:0 cset name='EQ1 B2 Volume' 13
	amixer -Dhw:0 cset name='EQ1 B3 Volume' 12
	amixer -Dhw:0 cset name='EQ1 B4 Volume' 14
	amixer -Dhw:0 cset name='EQ1 B5 Volume' 16

	amixer -Dhw:0 cset name='EQ2 B1 Volume' 16
	amixer -Dhw:0 cset name='EQ2 B2 Volume' 13
	amixer -Dhw:0 cset name='EQ2 B3 Volume' 12
	amixer -Dhw:0 cset name='EQ2 B4 Volume' 14
	amixer -Dhw:0 cset name='EQ2 B5 Volume' 16
fi
