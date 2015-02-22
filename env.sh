#!/bin/sh


NOW=`date "+%Y-%m-%d_%H-%M"`

export BUFFER_DIR=/mnt/recorder_buffer
export OUTPUT_DIR=/mnt/usbdrive/record/${NOW}
export ARCHIVE_DIR="/mnt/NAS/REMI/musique/France Musique/${NOW}"



mkdir ${OUTPUT_DIR}

