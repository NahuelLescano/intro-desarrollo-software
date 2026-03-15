#!/bin/bash

# Crear un script de Bash que solicite al usuario un número natural n y cree n cantidad de carpetas con los nombres carpeta1, carpeta2, etc.

read -p "Decime la cantidad de carpetas que queres crear: " num

if ! [[ $num =~ ^[0-9]+$ ]]; then
  echo "Error: el numero no es un natural positivo mi rey"
  exit 1
fi

for ((i = 1; i <= num; i++)); do
  dir="dir$i"
  mkdir $dir
  echo "$dir creado"
done
