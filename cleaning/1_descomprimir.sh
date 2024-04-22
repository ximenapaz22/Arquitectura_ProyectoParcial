#!/bin/bash

# Define la ruta relativa a los archivos .rar
RAR_PATH="../data/raw"

# Cambia al directorio donde están los archivos .rar
cd "$RAR_PATH"

# Bucle para descomprimir todos los archivos .rar
for file in *.rar; do
  unrar x "$file"
done


# Vuelve al directorio original
cd -
