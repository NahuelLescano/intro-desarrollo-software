#!/bin/bash

# Crear un script de Bash que reciba un nombre. Si el nombre ingresado es “Manu” imprimir por pantalla “Hola, profe”, de no ser así imprimir por pantalla “Hola, (nombre)”

echo "Ingresa tu nombre"
read nombre

if [ $nombre == "Manu" ]; then
  echo "Hola, profe"
else
  echo "Hola, $nombre"
fi
