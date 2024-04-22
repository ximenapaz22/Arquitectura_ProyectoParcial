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

    # Procesar el archivo con awk
    gawk -v OFS='|' 'BEGIN {FPAT = "([^,]*)|(\"[^\"]+\")"} {
        for (i = 1; i <= NF; i++) {
            # No tocar la columna 11
            if (i == 11) continue;
            # Remover caracteres no deseados solo en las columnas permitidas
            if (i != 6 && i != 7 && i != 14 && i != 15) {
                gsub(/[[:cntrl:]]|[#%&()*;<=>?[\\\]^_`{|}~]/, "", $i);
            }
            # Si es una de las columnas que originalmente tenía un número, asegurarse de que no tenga puntos adicionales
            if (i == 1 || i == 2 || i == 3 || i == 4 || i == 5 || i == 8 || i == 9 || i == 10 || i == 12 || i == 13) {
                gsub(/\.{2,}/, ".", $i);
            }
        }
        # Reemplazar el delimitador original por pipe y imprimir la línea
        $1=$1; # Reconstituir $0 con el nuevo delimitador OFS
        print;
    }' "$file" > "$output_file"
done

echo "Todos los archivos han sido convertidos y guardados en $output_dir."
