#!/bin/sh

. ./env.sh

rm ${BUFFER_DIR}/* 

./Record_from_lineIn.sh

CMUS_PID=`cat /biconou/cmus.pid`
kill -9 ${CMUS_PID}

mkfifo pipe_to_aplay

aplay <pipe_to_aplay &


arecord -Dhw:0 -r 44100 -c 2 -f S16_LE 2>${OUTPUT_DIR}/arecord.err \
  | tee pipe_to_aplay \
  | split --suffix-length=4 -b 2M - ${BUFFER_DIR}/OUTPUT > ${OUTPUT_DIR}/split.out 2>&1 &


while true; do
  filename=`ls ${BUFFER_DIR}/OUTPUT* | head -n 1`
  filesize=`ls -l ${filename} |  cut -f5 -d' '`
  if [ "${filesize}" = "2097152" ]; then
    cat ${filename} >> ${OUTPUT_DIR}/OUT.WAV 
    rm  ${filename}
  else
    arecord_pid=`ps -ef | grep arecord | grep -v grep | awk '{print $2}'`
    if [ "${arecord_pid}" = "" ]
    then
      mdbefore=`md5sum ${OUTPUT_DIR}/OUT.WAV | cut -f1 -d' '`
      mkdir "${ARCHIVE_DIR}"
      cp ${OUTPUT_DIR}/* "${ARCHIVE_DIR}"
      mdafter=`md5sum "${ARCHIVE_DIR}"/OUT.WAV | cut -f1 -d' '` 
      if [ "${mdbefore}" = "${mdafter}" ]
      then
        rm -rf ${OUTPUT_DIR}
      fi
      exit 0
    fi
  fi
  now=`date | cut -f4 -d' '`
  tailleWAV=`ls -l record.sh | cut -f5 -d' '`
  echo "${now} ${tailleWAV}" >> ${OUTPUT_DIR}/RECORD_DIR.stat
  df -k /mnt/recorder_buffer >>  ${OUTPUT_DIR}/RECORD_DIR.stat
done
