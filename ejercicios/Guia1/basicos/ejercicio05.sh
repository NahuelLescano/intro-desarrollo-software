#!/bin/bash

# Crear un script de bash que reciba dos numeros (base y altura) para luego calcular el perimetro de un rectangulo.

echo "Base del rectangulo"
read base

echo "Altura del rectangulo"
read altura

perimetro=$(( 2*(base+altura) ))

echo "El perimetro del rectangulo es: $perimetro"
