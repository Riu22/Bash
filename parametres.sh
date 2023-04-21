#!/bin/bash
#veremos lo que hacen los parametros en el lenguaje bash
parametros=${0}
# ${0} nos indica el nombre del ejecutable
echo "el parametro es ${0}"
# el parametro ${1} es el primer parametro posicional
echo "el parametro 1 es ${1}"
#el parametro ${2}es el segundo parametro posicional a la hora de ejecurarlo
echo "el parametro 2 es ${2}"

parametro_sostenido=${#}
echo "el parametro sostenido ${parametro_sostenido} indica el numero de parametros que hay"
