#!/bin/bash

#Genera un nombre aleatori entre 1 i 10:
adivina=$(( ( RANDOM % 10 )  + 1 ))

# Escriu el teu codi aqui
vidas=3
read -p " introduce un numero: " X
while [ $vidas -gt 0 ]
do
if [[ $X -eq $adivina ]]
        then echo "Eureka"
        exit 0
fi
    
if [[ $X -lt $adivina ]]
then echo "fred"
    else echo "calent"
fi
vidas=$((vidas - 1))
read -p "introduce otro numero: " X
done




# Fi del teu codi

echo "El nombre que havies d'adivinar era: ${adivina}"