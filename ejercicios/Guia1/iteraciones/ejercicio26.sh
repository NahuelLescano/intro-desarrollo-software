#!/bin/bash

# Crear un script de Bash que solicite al usuario los siguientes datos: -Nombre -Apellido -Legajo -Materia preferida Luego imprimir en un archivo “datos_alumno.txt” toda la información.

read -p "Dame tu nombre: " nombre
read -p "Dame tu apellido: " apellido
read -p "Ahora dame tu legajo: " legajo
read -p "Por ultimo tu materia preferida: " materia

echo "${nombre} ${apellido} ${legajo} ${materia}" > datos_alumno.txt

echo $(cat datos_alumno.txt)
