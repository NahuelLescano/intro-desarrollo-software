#!/bin/bash

# Crear un script de Bash que solicite al usuario un número natural n e imprima en un archivo llamado “primos.txt” todos los números primos existentes hasta n.

read -p "Decime un numero natural: " num

if ! [[ $num =~ ^[1-9]+$ ]]; then
  echo "Error: el numero no es un natural mi rey"
  exit 1
fi

if ! [[ -f primos.txt ]]; then
  touch primos.txt
fi

for ((i = 1; i <= num; i++)); do
  if [[ $(( $i % 2 )) -ne 0 && $i -ne 1 || $i -eq 2 ]]; then
    echo $i >> primos.txt
  fi
done

if [[ -f primos.txt ]]; then
  echo $(cat primos.txt)
fi

