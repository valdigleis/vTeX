#!/bin/bash

FILENAME="book"

# Removendo arquivos intermediários se existirem
echo "Removendo arquivos intermediários (primeira etapa)..."
rm -f "${FILENAME}.aux" \
      "${FILENAME}.bbl" \
      "${FILENAME}.blg" \
      "${FILENAME}.lof" \
      "${FILENAME}.log" \
      "${FILENAME}.out" \
      "${FILENAME}.toc" \
      "${FILENAME}.fdb_latexmk" \
      "${FILENAME}.fls"

# Compilação com lualatex e bibtex
echo "Iniciando a compilação com lualatex e bibtex..."
lualatex "${FILENAME}.tex"
bibtex "${FILENAME}"
lualatex "${FILENAME}.tex"
lualatex "${FILENAME}.tex"

# Limpeza de arquivos intermediários se existirem
echo "Removendo arquivos intermediários (segunda etapa)..."
rm -f "${FILENAME}.aux" \
      "${FILENAME}.bbl" \
      "${FILENAME}.blg" \
      "${FILENAME}.lof" \
      "${FILENAME}.log" \
      "${FILENAME}.out" \
      "${FILENAME}.toc"

# Exibindo mensagem de conclusão
echo "================================================================"
echo "                Sucess... Build Completed!!!"                    
echo "================================================================"