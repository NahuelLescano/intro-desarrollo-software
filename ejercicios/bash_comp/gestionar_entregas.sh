#!/bin/bash

help() {
	echo "Uso: $0 [ACCION] <directorio>"
	echo "Gestiona las entregas de los estudiantes en el directorio especificado."
	echo "Opciones:"
	echo "  -a, --ayuda                 Muestra esta ayuda y sale."
	echo "  -i, --inicializar-entregas  Recibe como parametro 'entregas' y lo inicializa con sus subcarpetas 'originales', 'procesadas' y 'burlas'."
	echo "  -p, --procesar-entregas     Procesa las entregas, renombrando los archivos según el formato requerido."
	echo "  -b, --burlarme-entregas     Renombra los archivos de las entregas para burlarse de los estudiantes."
}

ACCION=$1
DIRECTORIO=$2

check_param_exist() {
	if [[ -z "$DIRECTORIO" ]]; then
		echo "Error: No se especificó el directorio de entregas."
		help
		exit 1
	fi
}

init_delivery() {
  check_param_exist

  if [[ ! -d "$DIRECTORIO" ]]; then
    mkdir -p "$DIRECTORIO/originales"
    mkdir -p "$DIRECTORIO/procesadas"
    mkdir -p "$DIRECTORIO/burlas"
    echo "Estructura de carpetas creada en '$DIRECTORIO'."
  else
    echo "Error: El directorio '$DIRECTORIO' ya existe."
    help
    exit 1
  fi
}

process_deliveries() {
  check_param_exist

  if [[ ! -d "$DIRECTORIO" ]]; then
    echo "Error: El directorio '$DIRECTORIO' no existe."
    help
    exit 1
  fi

	for archivo in "$DIRECTORIO/originales"/*; do
		if [[ -f "$archivo" ]]; then
			local encabezado=$(head -n 1 "$archivo")
			local regex="Alumno: [a-zA-Z]+, [a-zA-Z]+ - Padrón: [0-9]{6}$"
			if [[ $encabezado =~ $regex ]]; then
				local padron=$(echo "$encabezado" | grep -o 'Padrón: [0-9]\{6\}' | awk '{print $2}')
				tail -n +2 "$archivo" >"$DIRECTORIO/procesadas/$padron.txt"
        echo "Archivo '$archivo' procesado y guardado como '$DIRECTORIO/procesadas/$padron.txt'."
			else
				echo "El archivo '$archivo' no contiene la informacion del alumno. Se omitirá."
			fi
		fi
	done
}

mock_deliveries() {
  check_param_exist
  if [[ ! -d "$DIRECTORIO" ]]; then
    echo "Error: El directorio '$DIRECTORIO' no existe."
    help
    exit 1
  fi

  for archivo in "$DIRECTORIO/procesadas"/*.txt; do
    if [[ -f "$archivo" ]]; then
      local nombre_archivo=$(basename "$archivo")
      local contenido=$(cat "$archivo")
      local contenido_burlon=$(echo "$contenido" | sed -Ee 's/[aeou]/i/g' -Ee 's/[AEIOU]/I/g')
      echo "$contenido_burlon" >"$DIRECTORIO/burlas/$nombre_archivo"
      echo "Archivo '$archivo' burlado y guardado como '$DIRECTORIO/burlas/$nombre_archivo'."
    fi
  done
}

case $ACCION in
-a | --ayuda)
	help
	;;
-i | --inicializar-entregas)
	init_delivery $DIRECTORIO
	;;
-p | --procesar-entregas)
	process_deliveries
	;;
-b | --burlarme-entregas)
	mock_deliveries
	;;
*)
	help
	exit 1
	;;
esac
