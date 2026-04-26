#!/bin/bash

filename=$(basename "$1")

pandoc -s --toc --toc-depth=2 \
  -V papersize=a4 --number-sections --dpi=300 \
  --pdf-engine=xelatex -H header.tex \
  "$filename".md -o ./pdf/"$filename".pdf
