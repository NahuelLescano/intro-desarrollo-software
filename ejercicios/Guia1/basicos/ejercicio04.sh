#!/bin/bash

# Crear un script de bash que le solicite al usuario el ingreso de su nombre ey su apellido (por separado) y que luego imprima por pantalla su nombre completo

echo "Cual es tu nombre?"
read nombre

echo "Y su apelldo?"
read apellido

echo "Su nombre completo es: ${nombre} ${apellido}"
