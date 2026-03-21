#!/bin/bash

# Se tiene el archivo contraseñas.csv, el cual almacena las contraseñas de distintos usuarios en una plataforma. La estructura es nombre_usuario,contraseña. Se pide extraer, del archivo:
# 
#   11. Los nombres de usuario que contienen números.
#   12. Los nombres de usuario con al menos un guión bajo (_).
#   13. Las contraseñas alfanúmericas.
#   14. Los nombres de usuario alfanuméricos.
#   15. Las contraseñas que comienzen y terminen con el mismo caracter.
#   16. Las contraseñas con exactamente 14 caracteres (de cualquier tipo).
#   17. Las contraseñas seguras; son las que contienen al menos:
#         * letra minúscula
#         * letra mayúscula
#         * número
#         * caracter especial (@$!%*?&#)
# 
# Aclaraciones: el caracter , debe ser omitido en las devoluciones de contraseñas o usuarios. Comprobá que el resultado de la expresión contenga a todos los campos esperados (para esto, pueden buscar de antemano cuáles serían los usuarios/contraseñas que cumplen con la condición pedida.)

file="contrasenias.csv"

# grep -E "^[^,]*[0-9][^,]*," $file --color=auto

# grep -E "^[^,]*_[^,]*," $file --color=auto

# grep -E "^[^,]*,([a-zA-Z]+[0-9]+|[0-9]+[a-zA-Z]+)[a-zA-Z0-9]*$" $file --color=auto

# grep -E "([a-zA-Z]+[0-9]+|[0-9]+[a-zA-Z]+)[a-zA-Z0-9]*,[^,]*" $file --color=auto

# grep -E "^[^,]*,.{14}$" $file --color=auto

grep -E "^[^,]*,([a-zA-Z#$%\^&\*]+[0-9]+|[0-9]+[a-zA-Z#$%\^&\*]+)[a-zA-Z0-9#$%\^&\*]*$" $file --color=auto
