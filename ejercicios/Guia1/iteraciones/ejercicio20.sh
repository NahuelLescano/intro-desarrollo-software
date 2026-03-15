#!/bin/bash

# Crear un script de Bash que imprima el nombre del directorio actual en un archivo llamado “actual.txt”.

pwd > actual.txt

echo "Directorio actual: $(cat actual.txt)"
