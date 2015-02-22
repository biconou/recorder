#!/bin/sh

echo "Année 2015"
read -p "Date (MMDD) ?" JOUR
read -p "Heure de début (hhmm) ?" HEURE_DEB
read -p "Heure de fin (hhmm) ?" HEURE_FIN


at -t 15${JOUR}${HEURE_DEB} <<EOF
./record.sh
EOF

at -t 15${JOUR}${HEURE_FIN} <<EOF
./stop_record.sh
EOF


