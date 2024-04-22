#!/bin/bash

# Ruta al directorio donde están los archivos procesados
PROCESSED_PATH="../data/processed"

# Cambiar al directorio de archivos procesados
cd "$PROCESSED_PATH"

# Bucle para procesar cada archivo CSV en el directorio
for file in *.csv; do
  # Comprobar si el archivo existe
  if [ -f "$file" ]; then
    # Convertir el contenido del archivo a minúsculas usando sed
    sed -i 's/.*/\L&/' "$file"
  fi
done

# Volver al directorio original
cd -
