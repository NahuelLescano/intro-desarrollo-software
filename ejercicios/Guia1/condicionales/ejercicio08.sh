#!/bin/bash

# Crear un script de Bash que reciba un número entero e indique si el número es par o impar.

echo "Ingresa un numero"
read numero

if [ $(( $numero%2 )) -eq 0 ]; then
  echo "Tu numero es par"
else
  echo "Tu numero es impar"
fi
