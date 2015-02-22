#!/bin/sh


PID=`ps -ef | grep arecord | grep -v grep | awk '{print $2}'`
echo ${PID}
kill -9 ${PID}

#PID=`ps -ef | grep record.sh | grep -v grep | awk '{print $2}'`
#echo ${PID}
#kill -9 ${PID}

