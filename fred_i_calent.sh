#!/bin/bash

#Genera un nombre aleatori entre 1 i 10:
adivina=$(( ( RANDOM % 10 )  + 1 ))

# Escriu el teu codi aqui
read -p " introduce un numero: " X
if [[ X -lt adivina ]]
then echo "fred"
    elif [[ X -gt adivina ]]
    then echo "calent"
        elif [[ X -eq adivina ]]
        then echo "Eureka"
        
    
fi




# Fi del teu codi

echo "El nombre que havies d'adivinar era: ${adivina}"