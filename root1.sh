#!/bin/bash
#vamos a crear un scrip que solo se pueda ejecutar si eres administrador

function Usage(){

    echo "Usage ${0}"
    echo
    echo "tienes que ser administrador"
    echo "el usuario no se puede repetir"
    exit 1
}

if [[ ${UID} -ne 0 ]]
then
    Usage
fi

read -p "introduce el nombre del usuario: " Username 

echo "creant l'usuari ${Username}"