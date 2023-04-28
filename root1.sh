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

read .p "introduce el nombre completo: " comments 
read -p "introduce el nombre del usuario: " Username 
read -p "introduce  el password: " Password

useradd -m -c "${comments}" ${Username} & /dev/null


if [[ ${?} -ne 0 ]]
then
    echo "error al crear el usuario"
exit 1
fi
echo "${Username}:${Password} | chpasswd    

if [[ ${?} -ne 0 ]]
then
    echo "error al cambiar password"
exit 1
fi
passwd -e ${Username}
echo "creando el usuario ${Username}"


exit 0