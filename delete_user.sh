#!/bin/bash
function usage(){
    #INDICAM LES INSTRUCCIONS DEL SCRIPT
    echo "INSTRUCCIONS: ./DELETE_users.sh DELETE_NAME [DELETE_NAME ... ]"
    exit 1
}

# El nom del script que s'executa
echo "${0}"
#Comrpobar que eres root
if [ ${UID} -ne 0 ] 
then 
    usage
fi
# El PATH i el filename del script
# El número de paràmetres
NUMERO_PARAMETRES=${#}
echo "NUMERO DE PARAMETRES: ${NUMERO_PARAMETRES}"
# Si el número de paràmetres és igual zero ha de sortir (exit 1),
#indicant que el primer paràmetre és obligatori i que rebrà de nom USER_NAME, 
#i que pot rebre paràmetres opcionals que també seran noms d'usuaris.
if [[ ${NUMERO_PARAMETRES} -eq 0 ]]
then
    #errada, necessitam al manco un paràmetre
    usage
fi
# Afegir tots els paràmetres dins una variable i mostrar-la per pantalla.
TOTS_ELS_PARAMETRES=${*}
echo "TOTS ELS PARÀMETRES: ${TOTS_ELS_PARAMETRES}"
# DESPLAÇAR ELS PARÀMeTRES A L'ESQUERRA
# shift
# #TORNAR A MOSTRAR TOTS ELS PARÀMETRES
# TOTS_ELS_PARAMETRES=${*}
# echo "TOTS ELS PARÀMETRES: ${TOTS_ELS_PARAMETRES}"
# Generau un password per cada un dels usuaris passats com a paràmetres.
# for és un bucle, que s'executa per cada element de ${@}
for USER_NAME in ${@}
do
    #ENTRAREM DINS AQUEST BLOC, TANTES VEGADES COM PARÀMETRES POSEM AL SCRIPT

    #CREAR L'USUARI amb el HOME
    userdel -r ${USER_NAME}
    #COMPROVAM SI S'HA CREAT BÉ
    if [[ ${?} -ne 0 ]]
    then   
        echo "Error al crear usuario"
        exit 1
    fi

done
