#!/bin/bash

# Crear un script de Bash que reciba como parámetro los nombres de dos archivos y una sus contenidos en uno nuevo llamado “concatenados.txt”.

if ! [[ -f $1 || -f $2 ]]; then
  echo "No existen los archivos"
  exit 1
fi

contenido="$(cat $1) $(cat $2)"
echo $contenido

echo $contenido > concatenado.txt

echo "Contenido: $(cat concatenado.txt)"
