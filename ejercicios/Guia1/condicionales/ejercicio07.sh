#!/bin/bash

# Crear un script de bash que solicite la edad del usuario y determine si es mauor o menor de edad.

echo "Cual es tu edad?"
read edad

if [ $edad -ge 18 ]; then
  echo "Sos mayor de edad"
else
  echo "Sos menor de edad"
fi
