#!/bin/bash

# Crear un script de Bash que reciba las longitudes de los lados de un triángulo y que luego indique si se trata de un triángulo equilátero, isósceles o escaleno.

echo "Dame los lados de tu triangulo pa"
echo "lado 1:"
read lado1

echo "lado 2:"
read lado2

echo "lado 3:"
read lado3

if [[ $lado1 -eq $lado2 && $lado1 -eq $lado3 && $lado2 -eq $lado3 ]]; then
  echo "El triangulo es equilátero"
elif [[ $lado1 -ne $lado2 && $lado1 -ne $lado3 && $lado2 -ne $lado3 ]]; then
  echo "El triangulo es escaleno"
else
  echo "El triangulo es isósceles"
fi
