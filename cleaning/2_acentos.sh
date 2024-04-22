#!/bin/bash

# Definir la ruta de los archivos raw y la carpeta de salida processed
RAW_PATH="../data/raw"
PROCESSED_PATH="../data/processed"

# Crear la carpeta processed si no existe
mkdir -p "$PROCESSED_PATH"

# Bucle para procesar archivos en cada subdirectorio dentro de raw
for year_folder in "$RAW_PATH"/*; do
  if [ -d "$year_folder" ]; then  # Asegúrate de que es un directorio
    for csv_file in "$year_folder"/*.csv; do
      # Verificar que el archivo existe para evitar errores con directorios vacíos
      if [ -f "$csv_file" ]; then
        # Definir el nombre de archivo de salida en la carpeta processed
        output_file="$PROCESSED_PATH/$(basename "$csv_file")"
        # Aplicar iconv para quitar acentos y transliterar a ASCII
        iconv -f utf8 -t ascii//TRANSLIT "$csv_file" > "$output_file"
      fi
    done
  fi
done

# Vuelve al directorio original
cd -

