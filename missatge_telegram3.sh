#!/bin/bash

IP=$(curl ifconfig.co)
DATA=$(date)
HOST=$(hostname)
MENSAJE="Se inicio ${HOST} a las ${DATA} con la ip publica ${IP}"
/home/jaumefont/Bash/missatge_telegram2.sh "${MENSAJE}"