#!/bin/bash

function usage() {
    # Indicar las instrucciones del script
    echo "INSTRUCCIONES: ./DELETE_users.sh DELETE_NAME [DELETE_NAME ... ]"
    exit 1
}

# El nombre del script que se ejecuta
echo "${0}"
# Comprobar si eres root
if [ ${UID} -ne 0 ]; then
    usage
fi
# El PATH y el filename del script
# El número de parámetros
NUMERO_PARAMETRES=${#}
echo "NUMERO DE PARAMETROS: ${NUMERO_PARAMETRES}"
# Si el número de parámetros es igual a cero, se debe salir (exit 1),
# indicando que el primer parámetro es obligatorio y que recibirá el nombre DELETE_NAME,
# y que puede recibir parámetros opcionales que también serán nombres de usuarios.
if [[ ${NUMERO_PARAMETRES} -eq 0 ]]; then
    # Error, se necesita al menos un parámetro
    usage
fi
# Añadir todos los parámetros en una variable y mostrarlos por pantalla.
TOTS_ELS_PARAMETRES=${*}
echo "TOTS ELS PARAMETRES: ${TOTS_ELS_PARAMETRES}"
# DESPLAZAR LOS PARÁMETROS A LA IZQUIERDA
while [[ $# -gt 0 ]]; do
    USER_NAME=$1
    # ENTRAREMOS EN ESTE BLOQUE, TANTAS VECES COMO PARÁMETROS PONGAMOS EN EL SCRIPT

    # ELIMINAR EL USUARIO Y SU DIRECTORIO DE INICIO
    userdel -r ${USER_NAME}
    # COMPROBAR SI SE HA ELIMINADO CORRECTAMENTE
    if [[ ${?} -ne 0 ]]; then
        echo "Error al eliminar usuario"
        exit 1
    fi
    # CAMBIAR LA CONTRASEÑA,
    # COMPROBAR SI EL CAMBIO DE CONTRASEÑA HA IDO BIEN
    if [[ ${?} -ne 0 ]]; then
        echo "Error al cambiar la contraseña"
        exit 1
    fi
    # HACER QUE EL USUARIO TENGA QUE CAMBIAR LA CONTRASEÑA EN EL PRIMER LOGIN

    # Desplazar los parámetros hacia la izquierda
    shift
done
