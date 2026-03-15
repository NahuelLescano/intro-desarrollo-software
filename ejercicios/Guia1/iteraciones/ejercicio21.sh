#!/bin/bash

# Crear un script de Bash que solicite al usuario un número natural n y cree n cantidad de archivos con los nombres archivo1, archivo2, etc. Escribir en todos los archivos el nombre del usuario actual.

read -p "Decime la cantidad de archivos que queres crear: " num

if ! [[ $num =~ ^[0-9]+$ ]]; then
  echo "Error: el numero no es un natural positivo mi rey"
  exit 1
fi

for ((i = 1; i <= num; i++)); do
  filename="archivo$i.txt"
  touch $filename
  echo "${USER} - $(date)" > $filename
  echo "$filename creado"
done

