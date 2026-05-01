#!/bin/bash

if [ -z "$1" ]; then
  echo "Uso: $0 ruta/al/archivo.sql"
  exit 1
fi

if [ ! -f "$1" ]; then
  echo "Error: no existe el archivo '$1'"
  exit 1
fi

docker="docker exec -i sql_ejercicios_db psql -U ejercicios -d ejercicios"
echo "Archivo: $1"
echo "Ejecutando: $docker < $1"
echo ""
$docker < "$1"
