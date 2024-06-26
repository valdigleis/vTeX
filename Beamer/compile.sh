#!/bin/bash

# Nome do arquivo LaTeX (sem a extensão .tex)
FILENAME="example"

# Comandos para compilar o arquivo LaTeX com pdfLaTeX
lualatex "$FILENAME.tex"
#bibtex "$FILENAME.aux"
lualatex "$FILENAME.tex"
lualatex "$FILENAME.tex"

# Limpeza de arquivos intermediários
rm -f "$FILENAME.aux" "$FILENAME.bbl" "$FILENAME.blg" "$FILENAME.lof" "$FILENAME.log" "$FILENAME.out" "$FILENAME.toc" "$FILENAME.nav" "$FILENAME.snm"

clear

echo "==================================================="
echo " Compilação e limpeza concluídas!  "
echo "==================================================="
