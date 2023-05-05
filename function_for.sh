#!/bin/bash

function usage(){
    echo "USAGE:you have to enter almost 2 parameters"
    echo "function_for.sh x1 x2 [x3...xn]"
    exit 1
}

num_param=${#}
echo "numero de parametres: ${num_param}"
if [[ ${num_param} -lt 2 ]]
then

    usage
fi 

SUMA=0
producte=1
for I in ${@}
do
    SUMA=$((SUMA+I))
    producte=$((producte*I))
done
echo "LA SUMA VAL ${SUMA}"
echo "el producte val ${producte}"

