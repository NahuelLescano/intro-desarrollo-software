#!/bin/bash

# Crear un script de Bash que realice las 4 operaciones básicas (suma, resta, multiplicación y división) a dos números enteros ingresados por el usuario. Crear una función para cada una de las operaciones.


echo "Dame un numero"
read num1

echo "Dame otro numero"
read num2

echo "Operaciones disponibles: Sumar, Restar, Multiplicar o Dividir."
echo "Que queres hacer?"
read operacion

case "$operacion" in
  "Sumar")
    echo "Resultado: $(( num1 + num2 ))"
    ;;
  "Restar")
    echo "Resultado: $(( num1 - num2 ))"
    ;;
  "Multiplicar")
    echo "Resultado: $(( num1 * num2 ))"
    ;;
  "Dividir")
    if [ $num2 -eq 0 ]; then
      echo "Che no podes dividir por 0"
      exit 1
    else
      echo "scale=2; $num1 / $num2" | bc
    fi
    ;;
  *)
    echo "Operacion desconocida"
    exit 1
    ;;
esac
