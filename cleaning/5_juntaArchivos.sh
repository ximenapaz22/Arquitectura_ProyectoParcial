#!/bin/bash

# Define los directorios
input_dir="../data/clean"
output_dir="../data/final"

# Crear el directorio de salida si no existe
mkdir -p "$output_dir"

# Archivo final combinado
final_file="$output_dir/combined.csv"

csv_files=($input_dir/*.csv)

if [ ${#csv_files[@]} -eq 0 ]; then
    echo "No se encontraron archivos CSV en $input_dir."
    exit 1
fi

# Concatenar todos los archivos en uno solo
for file in "${csv_files[@]}"; do
    cat "$file" >> "$final_file"
done

echo "Todos los archivos han sido combinados y guardados en $final_file."
