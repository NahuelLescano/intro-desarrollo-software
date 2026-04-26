#!/bin/bash

mkdir -p ../pdf

generated=0

generate_pdf() {
  local file="$1"
  local filename

  filename=$(basename "$file")
  filename=${filename%.*}
  pandoc -s --toc --toc-depth=2 \
    -V papersize=a4 --number-sections --dpi=300 \
    --pdf-engine=xelatex -H header.tex \
    "$file" -o ../pdf/"$filename".pdf

  generated=$((generated + 1))

  echo "PDF generado: ../pdf/$filename.pdf"
}

if [ "$1" = "-a" || "$1" = "--all-pdf" ]; then
  shopt -s nullglob
  for file in *.md; do
    generate_pdf "$file"
  done
  echo "Genere $generated PDFs."
  exit 0
fi

filename=$(basename "$1")
filename=${filename%.*}

if [ ! -f "$filename".md ]; then
  echo "Error: no existe el archivo '$filename.md'"
  exit 1
fi

generate_pdf "$filename".md
