#!/bin/bash

function usage() {
    # Indicar las instrucciones del script
    echo "INSTRUCCIONES: ./create_users.sh USER_NAME [USER_NAME ... ]"
    exit 1
}

# El nombre del script que se ejecuta
echo "${0}"
# Comprobar si eres root
if [ ${UID} -ne 0 ]; then
    usage
fi
# El PATH y el filename del script
echo "directorio: $(dirname ${0}) fichero: $(basename ${0})"
# El número de parámetros
NUMERO_PARAMETROS=${#}
echo "NUMERO DE PARAMETROS: ${NUMERO_PARAMETROS}"
# Si el número de parámetros es igual a cero, se debe salir (exit 1),
# indicando que el primer parámetro es obligatorio y que recibirá el nombre USER_NAME,
# y que puede recibir parámetros opcionales que también serán nombres de usuarios.
if [[ ${NUMERO_PARAMETROS} -eq 0 ]]; then
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
    PASSWORD=$(date +%s%N | sha256sum | head -c10)
    echo "${USER_NAME}:${PASSWORD}"

    # CREAR EL USUARIO CON EL HOME
    useradd -m ${USER_NAME} &> /dev/null
    # COMPROBAR SI SE HA CREADO BIEN
    if [[ ${?} -ne 0 ]]; then
        echo "Error al crear usuario"
        exit 1
    fi
    # CAMBIAR LA CONTRASEÑA
    echo "${USER_NAME}:${PASSWORD}" | chpasswd
    # COMPROBAR SI EL CAMBIO DE CONTRASEÑA HA IDO BIEN
    if [[ ${?} -ne 0 ]]; then
        echo "Error al cambiar la contraseña"
        exit 1
    fi
    # HACER QUE EL USUARIO TENGA QUE CAMBIAR LA CONTRASEÑA EN EL PRIMER LOGIN

    # Desplazar los parámetros hacia la izquierda
    shift
done
