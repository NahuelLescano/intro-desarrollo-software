#!/bin/bash

# Crear un script de Bash que imprima en un archivo llamado “ordenados.txt” los nombres de todos los archivos del directorio actual ordenados según sus tamaños.

find . -maxdepth 1 -type f -printf "%s %p\n" | sort -n | cut -d' ' -f2- > ordenados.txt
echo $(cat ordenado.txt)
