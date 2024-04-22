# Quién es Quién en los Precios
## Objetivo
Utilizar tecnologías de gran escala vista en clase para analizar el dataset de Quién es Quién en los precios. 

## Herramientas necesarias
SQL
Pyspark

## Datos
Quién es Quién en los precios. Registro histórico diario de más de 2,000 productos, a partir de 2015, en diversos establecimientos de la República Mexicana. Los dataset que vas a analizar van del 2018-2024.

Para algunas partes de este proyecto se utiliza solamente el conjunto de datos de:
- frutas y legumbres procesadas

Los datos completos están disponibles en: https://datos.profeco.gob.mx/datos_abiertos/qqp.php

## Parte 1
1. Limpieza de datos
Antes de cargar al cluster, limpien los datos, toma una muestra y examina que puede salir mal, en principio el archivo tienes comas en las direcciones por lo que cuando lo quieras cargar como CSV vas a tener problemas. Hay que resolver eso. Tienes también caracteres especiales que puedes eliminar para obtener mejores resultados.

Tips para limpieza
Con iconv quitar todos los acentos que puedan venir ocupando: iconv -f utf8 -t ascii//TRANSLIT archivo_limpio.csv

Pueden usar los comandos de bash o la librería de AWS o Python para los siguientes pasos:

convertir a minúsculas
cambiar las comas de separación de variables por algún caracter tipo |. Ojo con las comas que separan las direcciones, esas NO. HINT: Esta es la parte dificil, de alguna manera tienen que escapar esos caracteres. Esto de escapar caracteres en bash se hace con gsub y escapar caracteres con \.
Sacar tu mejor juego para limpiar este dataset.

2. Cluster en AWS con Hadoop y Pyspark
- cluster_156057

3. ETL con el Cluster
Deberán subir a S3 el archivo o archivos de la tabla que descarguen a S3.
Carga el CSV en Spark
Guarda el CSV como parquet en S3, particionalo por catalogo. (Utiliza todos los trucos que consideres).
Carga el parquet en Spark

4. Preguntas a responder
Utilizando PySpark, se realiza el siguiente análisis (por año) y sobre todos los catálogos:
- ¿Cuántos catálogos diferentes tenemos?
- ¿Cuáles son los 20 catálogos con más observaciones?
- Tenemos datos de todos los estados del país? De no ser así, ¿cuáles faltan?
- ¿Cuántas observaciones tenemos por estado?
- De cada estado obtener: el número de catalogos diferentes por año, ¿ha aumentado el número de catálogos con el tiempo?

5. Utilizando Spark se contestan las siguientes preguntas sobre el catálogo de frutas y legumbres procesadas:
- ¿Cuańtas marcas diferentes tiene tu categoría?
- ¿Cuál es la marca con mayor precio? ¿En qué estado?
- ¿Cuál es la marca con menor precio en CDMX? (en aquel entonces Distrito Federal)
- ¿Cuál es la marca con mayores observaciones?
- ¿Cuáles son el top 5 de marcas con mayor precio en cada estado? ¿Son diferentes?
- ¿Cuáles son el top 5 de marcas con menor precio en CDMX? (en aquel entonces Distrito Federal)
- ¿Cuáles son el top 5 de marcas con mayores observaciones? ¿Se parecen a las de nivel por estado?
- ¿Ha dejado de existir alguna marca durante los años que tienes? ¿Cuál? ¿Cuándo desapareció?
- Gráfica de serie de tiempo por estado para la marca con mayor precio -en todos los años-, donde el eje equis es el año y el eje ye es el precio máximo.


## Parte 2
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
