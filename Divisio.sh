#!/bin/bash
echo "introdugiste los numeros ${1} i ${2}"
Suma=$(echo "scale=2; ${1}/${2}" | bc)
echo "${1}/${2}= ${Suma}"

