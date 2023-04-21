#!/bin/bash

read -p "introdueix el nombre X: " X
read -p "introdueix el nombre Y: " Y
echo "has introduit els nombres ${X} i ${Y}"
SUMA=$((X+Y))
echo "${X}+${Y}=${SUMA}"