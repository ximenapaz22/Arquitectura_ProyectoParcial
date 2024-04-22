#!/bin/bash

# Directorios de entrada y salida
input_dir="../data/processed"
output_dir="../data/clean"

# Crear el directorio de salida si no existe
mkdir -p "$output_dir"

# Procesar cada archivo CSV
for file in "$input_dir"/*.csv; do
    # Definir el nombre del archivo de salida
    filename=$(basename "$file")
    output_file="$output_dir/$filename"

    # Verificar que el archivo no esté vacío
    if [ ! -s "$file" ]; then
        echo "Archivo vacío o inexistente: $file. Se omite."
        continue
    fi

    # Cambiar delimitador y eliminar comas no deseadas
    awk -F',' 'BEGIN {OFS = "|"} {
        for (i = 1; i <= NF; i++) {
            # Eliminar comas en todas las columnas excepto la 11
            if (i != 11) gsub(/,/, "", $i);
        }
        # Construir la línea de salida
        line = $1;
        for (i = 2; i <= NF; i++) {
            if (i == 11) line = line OFS "\"" $i "\"";  # Mantener comillas para preservar comas dentro de la columna 11
            else line = line OFS $i;
        }
        print line;
    }' "$file" > "$output_file"
done

echo "Todos los archivos han sido convertidos y guardados en $output_dir."
