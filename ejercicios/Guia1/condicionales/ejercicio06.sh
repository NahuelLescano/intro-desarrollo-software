#!/bin/bash

# Crear un script de bash que le solicte al usuario el ingreso de un numero e indicar si el numero es mayor, menor o igual a 0. Imprimirlo por pantalla.

echo "Dame un numero cualquiera"
read numero

if [ $numero -gt 0 ]; then
  echo "Tu numero es mayor a 0"
elif [ $numero -lt 0 ]; then
  echo "Tu numero es menor a 0"
else
  echo "Tu numero es 0"
fi
