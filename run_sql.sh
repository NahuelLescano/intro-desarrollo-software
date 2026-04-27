#!/bin/bash

if [ -z "$1" ]; then
  echo "Uso: $0 ruta/al/archivo.sql"
  exit 1
fi

if [ ! -f "$1" ]; then
  echo "Error: no existe el archivo '$1'"
  exit 1
fi

echo "Ejecutando el archivo SQL: $1"
docker exec -i sql_ejercicios_db psql -U ejercicios -d ejercicios < "$1"
