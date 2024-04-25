#!/bin/bash

# Define los directorios
input_dir="../data/final"
output_dir="../data/final"

# Archivo de entrada y salida
input_file="$input_dir/combined.csv"
output_file="$output_dir/combined_with_names.csv"

# Verificar que el archivo de entrada existe
if [ ! -f "$input_file" ]; then
    echo "El archivo de entrada no existe: $input_file"
    exit 1
fi

# Nombres de columnas en minúsculas y sin acentos
header="producto|presentacion|marca|categoria|catalogo|precio|fecharegistro|cadenacomercial|giro|nombrecomercial|direccion|estado|municipio|latitud|longitud"

# Crear un nuevo archivo con los nombres de columnas
echo "$header" > "$output_file"

# Agregar el contenido del archivo combinado al nuevo archivo
cat "$input_file" >> "$output_file"

echo "El archivo ha sido creado con nombres de columnas en: $output_file"
