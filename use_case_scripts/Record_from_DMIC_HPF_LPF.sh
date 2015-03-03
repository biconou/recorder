#!/bin/bash
# Record from onboard DMICs to RPi.
# First, route signal from DMICs through High-Pass Filter to get rid of DC offset.
# Then, route output from High-Pass filter through Low-Pass Filter to get rid of high-freq noise and hiss.
# 
# IN2 --> HPF --> LPF --> AIF1TX

# Set default levels. May be overriden by environment variables.
DMIC_OUTPUT_LEVEL=128	# Output level from DMICs. Valid values: 0 - 191
RECORDING_LEVEL=32	# Level of signal sent to the RPi. Valid values: 0 - 48

# Check for environment variables.
[ ! -z "$DL" ] && DMIC_OUTPUT_LEVEL=$DL
[ ! -z "$RL" ] && RECORDING_LEVEL=$RL


# DMIC output level. Valid values 0 - 191
amixer -Dhw:0 cset name='IN2L Digital Volume' ${DMIC_OUTPUT_LEVEL}
amixer -Dhw:0 cset name='IN2R Digital Volume' ${DMIC_OUTPUT_LEVEL}

# DMICs are incorrectly labeled on the board.
# DMICL is actually the right channel and vice versa, so we swap them here.
# i.e. IN2R --> LHPF1
#      IN2L --> LHPF2
# Route DMICs (IN2) to LHPF{1,2} - High-pass filter to get rid of DC offset.
amixer -q -Dhw:0 cset name='LHPF1 Input 1' IN2R
amixer -q -Dhw:0 cset name='LHPF2 Input 1' IN2L
amixer -q -Dhw:0 cset name='LHPF1 Mode' High-pass
amixer -q -Dhw:0 cset name='LHPF2 Mode' High-pass

# Route output of LPHF{1,2} to LHPF{3,4}. Low-pass filter to get rid of hiss.
amixer -q -Dhw:0 cset name='LHPF3 Input 1' LHPF1
amixer -q -Dhw:0 cset name='LHPF4 Input 1' LHPF2
amixer -q -Dhw:0 cset name='LHPF3 Mode' Low-pass
amixer -q -Dhw:0 cset name='LHPF4 Mode' Low-pass

# Connect outputs of LHPFs to inputs of AIF1 (I2s to RPi)
amixer -q -Dhw:0 cset name='AIF1TX1 Input 1' LHPF3
amixer -q -Dhw:0 cset name='AIF1TX2 Input 1' LHPF4

# Recording level. Valid values 0 - 48
amixer -Dhw:0 cset name='AIF1TX1 Input 1 Volume' ${RECORDING_LEVEL}
amixer -Dhw:0 cset name='AIF1TX2 Input 1 Volume' ${RECORDING_LEVEL}

amixer -q -Dhw:0 cset name='DMIC Switch' on




