#!/bin/bash

# Nome do arquivo LaTeX (sem a extensão .tex)
FILENAME="example"

echo "==================================================="
echo " Compilando projeto...  "
echo "==================================================="

# Comandos para compilar o arquivo LaTeX com pdfLaTeX
pdflatex "$FILENAME.tex"
#bibtex "$FILENAME.aux"
pdflatex "$FILENAME.tex"
pdflatex "$FILENAME.tex"

echo "==================================================="
echo " Apagando arquivos desnecessários...  "
echo "==================================================="

# Limpeza de arquivos intermediários
rm -f "$FILENAME.aux" "$FILENAME.bbl" "$FILENAME.blg" "$FILENAME.lof" "$FILENAME.log" "$FILENAME.out" "$FILENAME.toc" "$FILENAME.nav" "$FILENAME.snm"

echo "==================================================="
echo " Compilação e limpeza concluídas!  "
echo "==================================================="
