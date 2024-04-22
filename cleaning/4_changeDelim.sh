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

    # Cambiar delimitador y eliminar símbolos no deseados
    awk -F',' 'BEGIN {OFS = "|"} {
        # Limpiar caracteres especiales de todas las columnas excepto la 11
        for (i = 1; i <= NF; i++) {
            if (i != 11) {
                # Eliminar caracteres que no sean letras, números, espacios, puntos o guiones
                gsub(/[^a-zA-Z0-9 .-]/, "", $i);
            }
        }

        # Reconstruir la línea con los nuevos delimitadores
        $1=$1;  # Esta operación es un truco en awk para reconstruir $0 con el nuevo OFS
        print $0;
    }' "$file" > "$output_file"
done

echo "Todos los archivos han sido convertidos y guardados en $output_dir."
