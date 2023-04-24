#!/bin/bash

read -p "introduce X: " X
if [[ ${X} -lt 5 ]]
then
    echo "introdugiste un numero menor a 5"
elif [[ ${X} -gt 5 ]]
then
    echo "el numero es mayor a 5"
else
    echo "el numero es igual a 5"
fi