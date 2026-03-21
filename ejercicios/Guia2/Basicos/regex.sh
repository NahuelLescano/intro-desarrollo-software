#!/bin/bash

# Encontrar la expresión regular de Regex que devuelve:

#  1. Las ocurrencias de la letra s.
#  2. Las ocurrencias de un caracter, seguido de la letra o (ej. to).
#  3. Todos los dígitos en el archivo.
#  4. Las ocurrencias del punto (.).
#  5. Las ocurrencias de la letra c al comienzo de la palabra.
#  6. Las palabras que comienzan con la letra p (no es necesario incluir las mayúsculas).

# ¿Qué devuelven las siguientes expresiones regulares?
 
#  7. ^L
#  8. !$
#  9.  (espacio)
#  10. [A-Z1-3]

file="oraciones.txt"

# grep "s" $file --color=auto

# grep ".o" $file --color=auto

# grep -E "[0-9]" $file --color=auto

# grep "\." $file --color=auto

# grep -i "\bc" $file --color=auto

# grep "\bp" $file --color=auto

# grep "^L" $file --color=auto

# grep "!$" $file --color=auto

# grep "" $file --color=auto

grep "[A-Z1-3]" $file --color=auto
