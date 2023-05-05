#!/bin/bash

numero_linea=0
suma=0
for linia in $(cat numeros.txt)
do
    numero_linea=$((numero_linea+1))
    SUMA=$((suma+linia))
done

echo "linia: ${numero_linea}"
echo "la suma val ${SUMA}"
mitjana=$(echo "scale=3: ${SUMA}/${numero_linea}" | bc)
echo "la mitjana es ${mitjana}"