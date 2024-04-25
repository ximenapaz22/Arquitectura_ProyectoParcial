# librerias ----
library(tidyverse)

# datos ----
# para cada archivo de la carpeta ../data/processed/
# se lee el archivo, se quitan se quitan las comas de las columnas excepto de la columna 11
# se guarda el archivo en la carpeta ../data/fixed/ sin las comas 
# usando la funcion write delim usando como delim |
# los datos no tienen nombres de columnas
# se guardan los archivos sin colnames, es decir, colnames=FALSE
list.files("../data/processed/") %>% 
  map(~read_delim(paste0("../data/processed/", .x), delim=",", col_names=FALSE) %>%
        write_delim(paste0("../data/fixed/", .x), delim="|", col_names=FALSE))


# una vez hecho eso, leemos uno por uno los archivos de la carpeta ../data/fixed/
# y los vamos pegando en un data frame aquí para hacer un archivo único
# con todos los datos que guardaremos en ..data/fixed_complete/ con el nombre "fixed_fill_data.csv" con 
# la funcion de write delim usando como delim |, definimos el vector:
# c("producto,presentacion,marca,categoria,catalogo,precio,fecharegistro,cadenacomercial,giro,nombrecomercial,direccion,estado,municipio,latitud,longitud")
# como los nombres de las columnas
# y guardamos el archivo con colnames=TRUE
datos <- read_delim("../data/fixed_complete/combined_with_names.csv", delim="|") 
