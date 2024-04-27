# Quién es Quién en los Precios
## Integrantes
- Erwin Minor - 214601
- Ximena Paz - 214570
- Mariano Villafuerte - 156057

## Objetivo
Utilizar tecnologías de gran escala para analizar el dataset de Quién es Quién en los precios. 

## Herramientas usadas
- SQL
- Pyspark
- bash
- AWS: Athena, S3

## Datos
Quién es Quién en los precios. Registro histórico diario de más de 2,000 productos, a partir de 2015, en diversos establecimientos de la República Mexicana. Los dataset que vas a analizar van del 2018-2024.

Para algunas partes de este proyecto se utiliza solamente el conjunto de datos de:
- frutas y legumbres procesadas

Los datos completos están disponibles en: https://datos.profeco.gob.mx/datos_abiertos/qqp.php

## Parte A
### Limpieza de datos
Se limpian los datos antes de cargarlos a S3. La base de datos es muy grande, por lo que se toma una muestra de los datos para hacer la exploración y se toman las decisiones para limpiar la base de datos. Luego se usa bash para limpiar los datos desde la terminal.

Para la limpieza:
- Con iconv quitar todos los acentos que puedan venir ocupando: iconv -f utf8 -t ascii//TRANSLIT archivo_limpio.csv
- Convertir a minúsculas
- cambiar las comas de separación de variables por algún caracter tipo "|" 

### Cluster en AWS con Hadoop y Pyspark
- cluster_156057

### ETL con el Cluster
Deberán subir a S3 el archivo o archivos de la tabla que descarguen a S3.
Carga el CSV en Spark
Guarda el CSV como parquet en S3, particionalo por catalogo. (Utiliza todos los trucos que consideres).
Carga el parquet en Spark

### Preguntas a responder
Utilizando PySpark, se realiza el siguiente análisis (por año) y sobre todos los catálogos:
- ¿Cuántos catálogos diferentes tenemos?
- ¿Cuáles son los 20 catálogos con más observaciones?
- Tenemos datos de todos los estados del país? De no ser así, ¿cuáles faltan?
- ¿Cuántas observaciones tenemos por estado?
- De cada estado obtener: el número de catalogos diferentes por año, ¿ha aumentado el número de catálogos con el tiempo?

### Utilizando Spark se contestan las siguientes preguntas sobre el catálogo de frutas y legumbres procesadas:
- ¿Cuańtas marcas diferentes tiene tu categoría?
- ¿Cuál es la marca con mayor precio? ¿En qué estado?
- ¿Cuál es la marca con menor precio en CDMX? (en aquel entonces Distrito Federal)
- ¿Cuál es la marca con mayores observaciones?
- ¿Cuáles son el top 5 de marcas con mayor precio en cada estado? ¿Son diferentes?
- ¿Cuáles son el top 5 de marcas con menor precio en CDMX? (en aquel entonces Distrito Federal)
- ¿Cuáles son el top 5 de marcas con mayores observaciones? ¿Se parecen a las de nivel por estado?
- ¿Ha dejado de existir alguna marca durante los años que tienes? ¿Cuál? ¿Cuándo desapareció?
- Gráfica de serie de tiempo por estado para la marca con mayor precio -en todos los años-, donde el eje equis es el año y el eje ye es el precio máximo.


## Parte B
Para esta parte se utiliza Athena. 
- Se crea una base de datos profeco_db en Athena.
- Se crea una tabla externa profeco dentro de la base de datos profeco_db

A partir de aquí se utiliza Athena desde R o Python para contestar preguntas sobre el catálogo de frutas y legumbres procesadas (desde 2018 a 2022):
- ¿De qué año a qué año tienen datos de esa categoría?
- ¿Cuántos registros de fecha hay vacíos?
- ¿Cuántos registros tienes por año?
- ¿Cuál es el precio mínimo, máximo, promedio, desviación estándar, mediana, cuantil 25 y 75% de tu categoría por año?
- ¿Cuáles son el top 5 de marcas con mayor precio en cada estado? ¿Verifica si te dió lo mismo en Spark?
- ¿Cuáles son el top 5 de marcas con menor precio en CDMX? (en aquel entonces Distrito Federal)
- ¿Cuáles son el top 5 de marcas con mayores observaciones? ¿Se parecen a las de nivel por estado?
- Se genera un boxplot por año, para cada una de las top 5 marcas de la categoría.


## Estructura del repositorio
- README.md
- data: carpeta con los datos de frutas y legumbres procesadas
    - raw: contiene los datos originales
    - processed: contiene los datos procesados hasta el paso de cambiar los delimitadores
    - clean: contiene los datos limpios
- cleaning: carpeta con los scripts de limpieza de datos
    - NOTA: se incluyen los scripts con el orden numérico en el nombre para indicar el orden en que se deben ejecutar, sin embargo, notamos que PySpark no leía de manera correcta el archivo limpio, por lo que se hizo una limpieza adicional en R que sí leía el archivo correctamente y se arregló el tema del delimitador. Puede no ser el caso siempre, pero en este caso, se incluye el script de limpieza en R.
- data_wrangling: carpeta con los scripts de Python para contestar las preguntas de interés
