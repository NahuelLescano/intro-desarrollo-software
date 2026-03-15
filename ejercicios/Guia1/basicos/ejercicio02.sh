#!/bin/bash

# Crear un script de bash que reciba dos numeros e imprima por pantalla su suma.

echo "Dame un numero"
read a

echo "Dame un numero"
read b

suma=$(( a + b ))

echo "Resultado: $suma"
