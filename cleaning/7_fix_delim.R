# librerias ----
library(tidyverse)

# datos ----
# leemos los datos delimitados | y los guardamos en un data.frame
datos <- read.delim("D:/ITAM/MCD/Metodos de Gran Escala/arquitectura_proyectoparcial/data/final/combined_with_names.csv", sep = "|")

write_delim(datos, "D:/ITAM/MCD/Metodos de Gran Escala/arquitectura_proyectoparcial/data/final/combined_with_names_fixed.csv",
            delim="|", col_names = T)
