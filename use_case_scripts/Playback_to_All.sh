#!/bin/bash


#Playback from AP to Headset
amixer -Dhw:0 cset name='HPOUT2 Digital Switch' on
amixer -Dhw:0 cset name='HPOUT2L Input 1' AIF1RX1
amixer -Dhw:0 cset name='HPOUT2L Input 1 Volume' 32
amixer -Dhw:0 cset name='HPOUT2R Input 1' AIF1RX2
amixer -Dhw:0 cset name='HPOUT2R Input 1 Volume' 32


#Playback from AP to LineOut
amixer -Dhw:0 cset name='HPOUT2 Digital Switch' on
amixer -Dhw:0 cset name='HPOUT2L Input 1' AIF1RX1
amixer -Dhw:0 cset name='HPOUT2L Input 1 Volume' 32
amixer -Dhw:0 cset name='HPOUT2R Input 1' AIF1RX2
amixer -Dhw:0 cset name='HPOUT2R Input 1 Volume' 32

#SPDIF Playback: 

amixer -Dhw:0 cset name='SPDIF out Switch' on
amixer -Dhw:0 cset name='TX Playback Switch' on
amixer -Dhw:0 cset name='Input Source' AIF
amixer -Dhw:0 cset name='AIF Playback Switch' on
amixer -Dhw:0 cset name='AIF2TX1 Input 1' AIF1RX1
amixer -Dhw:0 cset name='AIF2TX1 Input 1 Volume' 32
amixer -Dhw:0 cset name='AIF2TX2 Input 1' AIF1RX2
amixer -Dhw:0 cset name='AIF2TX2 Input 1 Volume' 32



