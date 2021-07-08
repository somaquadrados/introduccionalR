# ------------------------------------------------------------------------ #
# Introducción al análisis de datos biológicos con R - Clase 2
#
# Marília Melo Favalesso
# mariliabioufpr@gmail.com
# github.com/mmfava
#
# 07/07/2021
# ------------------------------------------------------------------------ #
#
# Contenidos:
# • Manejo de objetos en R
# • Tidyverse
# • Importar datos a R
# • Operador pipe (%>%)
# • tidy
# • dplyr
#
# ------------------------------------------------------------------------ #

## ---- •• Manejo de objetos en R •• ---- #

## •• Indexación ••

# • Los objetos son conjuntos indexados - Esto nos permite acceder a cada 
#   valor de manera individual.
# • Comprender la indexación es fundamental para manipular datos en R.
# • Usamos corchetes ([]) para acceder a la posición de los elementos de 
#   un objeto.

## ----

## •• Gestión de datos unidimensionales [L] ••
ve <- c(11, 12, 13, 14, 15, 16)
ve

## • Seleccionar elementos:

# Un elemento a la vez:
ve[1] # seleccionar el primero elemento
ve[2] # seleccionar el segundo elemento
ve[3] # seleccionar el tercero elemento
ve[4] # seleccionar el cuarto elemento
ve[5] # seleccionar el quinto elemento
ve[6] # seleccionar el sexto elemento

# > 1 elemento a la vez
ve[4:6] # selecciona los entre la cuarta y sexta posición
ve[c(2, 4)] # selecciona los elementos en la segunda y cuarta posición

## • Quitar elementos:

# Un elemento a la vez:
ve[-1] # quitar el primero elemento
ve[-2] # quitar el segundo elemento
ve[-3] # quitar el tercero elemento
ve[-4] # quitar el cuarto elemento
ve[-5] # quitar el quinto elemento
ve[-6] # quitar el sexto elemento

# > 1 elemento a la vez
ve[-4:-6] # selecciona los entre la cuarta y sexta posición
ve[-c(2, 4)] # selecciona los elementos en la segunda y cuarta posición

## --

## •• Gestión de datos bidimensionales [L,C] ••
ma <- matrix(data = (c(1:25)), nrow = 5, ncol = 5, byrow = TRUE) # crear una matriz
ma

## • Seleccionar elementos:

# Un elemento a la vez:
ma[1,2] # seleccionar el valor de la primera línea y la segunda columna.
ma[2,2] # seleccionar el valor de la segunda línea y la segunda columna.
ma[2,1] # seleccionar el valor de la segunda línea y la primera columna.

# > 1 elemento a la vez
# Es posible seleccionar más de una fila y columna al mismo tiempo!! 
ma[3:4, c(3, 5)] # seleccione las lineas 3 y 4 y las columnas 3 y 5
ma[c(1,5), 3:5] # seleccione las lineas 1 y 5 y las columnas entre 3 - 5

## • Quitar elementos:

# Un elemento a la vez:
ma[-1,-2] # seleccionar el valor de la primera línea y la segunda columna.
ma[-2,-2] # seleccionar el valor de la segunda línea y la segunda columna.
ma[-2,-1] # seleccionar el valor de la segunda línea y la primera columna.

# > 1 elemento a la vez:
ma[-c(1, 4), -2:-3] # menos las filas 1 y 4 y las columnas 2 y 3
ma[-3, -1:-3] # menos la fila 3 y las columnas entre 1 y 3

## --

## • !! 
##   También podemos usar el nombre de las filas y columnas para manejar
##   los datos: [nombre_linea, nombre_columna].
rownames(ma) = paste("nomlin", 1:5, sep = "_") # nombre en las lineas
colnames(ma) = paste("nomcol", 1:5, sep = "_") # nombre en las columnas
ma # la tabla

# selecciona linea 2 y columna 3:
ma["nomlin_2", "nomcol_3"] 

## --

## •• Gestión de data frame con $ ••

## El operador $ se utiliza para extraer elementos con nombre de un data frame.

# Construyamos un data.frame:

# vectores
grupo <- rep(c("CT", "EXP"), 5)
valor <- sample(1:50, 10)
genero <- sample(c("H", "M"), 10, replace = T)

# data-frame
dt <- data.frame(grupo, valor, genero)
dt # resultado

## • Extraer elementos (se convierte en un vector).
dt$grupo
dt$valor
dt$genero

## • Para cambiar la clase de elementos de una columna:
# antes
class(dt$grupo)

# cambio
dt$grupo <- as.factor(dt$grupo)

# despues
class(dt$grupo)

# antes
class(dt$valor)

# cambio
dt$valor <- as.numeric(dt$valor)

# despues
class(dt$valor)

## • Agregar una nueva columna:
dt$ID <- 1:10
dt

## • Usamos el $ para separar una variable de un data.frame.
## • Esta variable ahora se puede manejar como un objeto unidimensional.

# selecciona el primero elemento
dt$valor[1]

# elimina los valores en las posiciones 3 y 4
dt$genero[-c(3:4)]

## --

## •• Gestión de datos n dimensionales [L,C,D] ••
ar <- array(data = c(1:8), dim = c(2, 2, 2))
ar # array

## • Seleccionar elementos:

# Seleccionar dimensión 1.
ar[,,1] 

# Seleccionar columna 2 y dimensión 1
ar[,2,1] 

# Seleccionar linea2, columna 2 y dimensión 1
ar[2,2,1] 

## • Quitar elementos:

# Quitar dimensión 1.
ar[,,-1] 

# Quitar columna 2 y dimensión 1
ar[,-2,-1] 

# Quitar linea2, columna 2 y dimensión 1
ar[-2,-2,-1] 

## --

## ★ Ejercicios ★

## Trabajará con una tabla de datos que no es suya (son datos secundarios). 
## Esta tabla corresponde a datos de pacientes tratados en un hospital de 
## su ciudad.

# Pacientes	  Barrio	Genéro	Edad	Año	  Médico
# Paciente_1	12	    F	      57	  2020	A
# Paciente_2	28	    M	      60	  2021	B
# Paciente_3	7	      F	      39	  2021	C
# Paciente_4	20	    M	      56  	2020	A
# Paciente_5	19	    F	      67	  2018	B
# Paciente_6	8	      M	      33	  2018	C

# 0 - Cree la tabla como un data.frame en R.

# 1 - Trabajarás con las variables "género", "edad", "barrio" y "médico". 
#     Descarte las otras variables de la tabla.

# 2 - En su estudio, solo trabajará con personas que se identifiquen con 
#     el género femenino. Seleccione solo los datos correspondientes a 
#     estas personas.

# 3 - Agregue una columna que contenga el motivo de la búsqueda de atención 
#     médica: Paciente 1 = "tratamiento hormonal", 
#     Paciente 3 = "Problemas gástricos", Paciente 5 = "Sospecha de dengue".

# 4 - Cambie la clase de variable "edad" para numeric.

## ----

## •• Seleccionar elementos por condición (vector) ••

## • Operadores relacionales con salidas booleanas (VERDADERO o FALSO).
A <- 6
B <- 28

A == B # A es igual a B?
A != B # A es distinto de B?
A < B # A es menor que B?
A <= B # A es menor o igual que B?
A > B # A es mayor que B?
A >= B # A es mayor o igual que B?
A | B # A o B?
A & B # A y B?
A %in% B # A en B?

ve <- c(10, 15, 30, 32, 50, 68, 70)
ve

ve == 30 # ve es igual a 30?
ve != 30 # ve es distinto de 30?
ve < 30 # ve es menor que 30?
ve <= 30 # ve es menor o igual que 30?
ve > 30 # ve es mayor que 30?
ve >= 30 # ve es mayor o iguael que 30?
ve | 30 # ve o 30?
ve & 30 # ve y 30?
ve %in% 30 # ve en 30?

## --

## • Elementos del vector

## ¿Qué pasa si, en lugar de querer saber cuál valor coincide con la condición 
## y cuál no, quisiera seleccionar los valores relacionados con esa condición?

# Antes:
ve < 30

# Después:
ve[ve < 30]

## Por ejemplo:
ve[ve == 30] # ¿Qué elementos tienen el valor igual a 30?
ve[ve < 50] # ¿Qué elementos valen menos de 50?
ve[ve %in% 32] # ¿Está el ve insertado en el conjunto '32'?
ve[ve > 30] # ¿Qué elementos tienen un valor superior a 30?
ve[ve >= 45] # ¿Qué elementos tienen valores mayores o iguales a 45?
ve[ve != 10] # ¿Qué elementos son distintos de 10?

## --

## ★ Ejercicios ★

## Tomó muestras de ratas en tres áreas de Puerto Iguazú. En estos tres anotó 
## la abundancia mensual de ratas durante dos años (24 meses). 

loc1 <- sample(1:100, 24)
loc2 <- sample(1:100, 24)
loc3 <- sample(1:100, 24)

# 1 - En los dos años de recolección, ¿algunos de los sitios presentaron una 
#    abundancia superior a 50 ratas en un solo mes? ¿Y abundancia de menos de 
#    20 ratas en un solo mes?
  
# 3 - ¿Alguna de las ubicaciones tiene los valores [10, 20, 22]?
  
# 4 - Seleccione solo las abundancias que sean mayores que 0 y cree un nuevo 
#     vector para cada local.

## --

## •• Seleccionar elementos por condición (matrix/data.frame) ••
ma <- matrix(c(1:12), nrow = 3)
ma

ma == c(5, 6) # ¿Qué elementos tienen los valores 5 o 6?

ma < 8 # ¿Qué elementos tienen el valor inferior a 8?

## • ¿Qué pasa si, en lugar de querer saber cuál valor coincide con la 
##   condición y cuál no, quisiera seleccionar los valores relacionados con 
##   esa condición?

ma[ma == 8] # ¿Qué elementos tienen los valores = 5 o 6?
ma[ma < 8] # ¿Qué elementos tienen el valor inferior a 8?

## !!
## • En un data.frame, podemos separar la columna que nos interesa con el 
##   operador $ y luego aplicar la selección por condición.

# Nombra las columnas y transforma la matriz en data.frame
colnames(ma) = c("A", "B", "C", "D")
mb <- data.frame(ma)
mb

mb$A == 1 # Para la columna "A"

mb$B > 5 # Para la columna "B"

## --

## ★ Ejercicios ★

## Tiene una tabla con valores de temperatura, lluvia y abundancia de flebótomos
## que muestreó en los ultimos 5 meses:

# temperatura	lluvia	abundancia
# 21	        93	    79
# 17	        67	    18
# 28	        75	    62
# 25	        41	    4
# 18	        82	    89

# 1 - En alguno de los meses, ¿la temperatura bajó de los 20°C?

# 2 - En alguno de los meses, ¿tomó muestras de más de 20 flebótomos?
  
# 3 - Seleccione valores de precipitación superiores a 50.

# 4 - ¿Hay un mes con abundancia de flebótomos igual a 10, 20 o 31?
  
# 5 - En toda la tabla, ¿hay algún valor cero?

## ----

## •• Seleccionar elementos por condición (character) ••

# Todo lo que hemos hecho hasta ahora se puede hacer con characters.

l <- c("A", "B", "C", "d")

l < "C"

l == "B"

l[l > "B"]

l[l != "D"]

l[l != "d"]

# ------------------------------------------------------------------------ #

## ---- •• Tidyverse •• ---- #

## --
## ★ Ejercicios ★
##
## Instale y cargue el paquete Tidyverse en su computadora.
## --

# ------------------------------------------------------------------------ #

## ---- •• Importar datos a R •• ---- #

## Para su alivio, no es necesario producir su tabla en R (como lo hemos hecho
## hasta ahora). Es posible construir la tabla en Excel y luego importar los 
## datos (de HD a nuestra memoria RAM).

## La función de importación dependerá del formato en el que se guardó nuestra 
## tabla (.txt, .csv, .xls, .xlsx).

## ----

## •• Working directory ••

## • Recuerde que el directorio de trabajo es una 📁 donde R lee y guarda 
##   archivos.

## • Deberá decirle a R dónde están los archivos en los que va a trabajar.

# • Aquí incluirá la dirección donde están sus archivos en su computadora.
setwd("C:/Users/mmfav/introduccionalR/clase_2/data")

# • Deje todos los archivos guardados en esta misma carpeta, esto facilitará su 
#   trabajo.

# • Tenga en cuenta que la dirección aquí se indica con barras invertidas (/), a 
#   diferencia de lo que usan algunos sistemas operativos (\). Por ejemplo
#      - windows -> C:\Users\mmfav\introduccionalR\clase_2\data
#      - en R ->  C:/Users/mmfav/introduccionalR/clase_2/data

## ----

## •• readr ••

# El 📦 readr se usa para importar archivos de texto, como .txt o .csv a R.

# reader transforma archivos de texto en tibbles.

# -- 

## •• readr: .csv ••

# • Como ejemplo, usaremos la base de datos que proporcionamos en el repositorio
#   (datos.csv).

# • La función para leer los datos es: read_csv2(file = "archivo.csv"):
datos_csv <- read_csv2(file = "datos.csv")
datos_csv

# -- 

## •• readr: .txt ••

# • Como ejemplo, usaremos la base de datos que proporcionamos en el repositorio 
#  (datos.txt).

# • La función para leer los datos es: 
#   read_delim(file = "archivo.txt", delim = "\t").
datos_txt <- read_delim(file = "datos.txt", delim = "\t")
datos_txt

## ----

## •• readr ••

# • ¿Qué pasa si mis datos se guardan como un archivo excel?

# • El 📦 readxl se usa para importar archivos de excel, como .xslx o .xls a R.

# • ¡¡¡¡¡¡No es parte del tidyverse!!!!!!

install.packages("readxl") # instalar

library(readxl) # cargar el paquete

# Para abrir nuestro archivo de repositorio: read_xlsx("archivo.xlsx")
datos_xlsx <- read_xlsx("datos.xlsx")
datos_xlsx

# readxl transforma archivos de excel en tibbles.

## ----

## •• tibble ••

# Un tibble, o tbl_df, es una reinvención moderna del data.frame, manteniendo 
# el tiempo que ha demostrado ser efectivo y descartando lo que no lo es.

# Es un formato requerido para usar funciones tidyverse.

# Las variables pueden ser de tipo numérico (int, dbl), carácter (chr), lógicas 
# (lgl) y factor (fctr)

# • Convertir:

# - data.frame en tibble: as_tibble(data)
mb
as_tibble(mb)

tb
as_tibble(tb)


## --
## ★ Ejercicios ★
##
## 1 - Importe una tabla relacionada con una de sus investigaciónes para el R; 
##     puede tener cualquier format y numero de variables. El formato de salida 
##     debe ser tibbler.
##
## 2 - ¿Cuál es la diferencia entre las tablas datos_csv, datos_txt y 
##     datos_xlsx?
##
## --

# ------------------------------------------------------------------------ #

## ---- •• Operador pipe (%>%) •• ---- #

# • El 📦 magrittr ofrece un perador que hace que su código sea más legible: 
#   el pipe (%>%).

# • La idea del operador pipe (%>%) es bastante simple: use el valor resultante 
#   de la expresión de la izquierda como primer argumento de la función de la 
#   derecha.

# • Por ejemplo:

# - suma el vector y luego obtén la √ (sqrt):
x <- 1:10

sqrt(sum(x)) # Sin el pipe:

x %>% sum() %>% sqrt() # Con el pipe:

# - Construya una matriz, transfórmela en data_frame y luego en tibble.

# sin el pipe
a <- matrix(c(1:12), nrow = 4)
b <- as_data_frame(a)
c <- as_tibble(b)
c

# Con el pipe:
d <- matrix(c(1:12), nrow = 4) %>% 
  as_data_frame() %>% 
  as_tibble()
d


# ------------------------------------------------------------------------ #

## ---- •• tidy •• ---- #

# • El objetivo del 📦 tidyr es ayudarte a crear datos ordenados.

# • Los datos ordenados son datos donde:
# - Cada columna es variable.
# - Cada fila es una observación.
# - Cada celda es un valor único.

# Tidyr data describe una forma estándar de almacenar datos que se utiliza 
# siempre que sea posible en tidyverse.
# Si se asegura de que sus datos estén ordenados, pasará menos tiempo luchando 
# con las herramientas y más tiempo trabajando en su análisis.

## ----

## •• separate() ••

## • Muchas veces, una sola variable de columna capturará múltiples variables, 
##   o incluso partes de una variable que simplemente no le importa.

## • La función separate() separa dos o más variables que están concatenadas 
##   en la misma columna.

## • La sintaxis de la función es:
# datos %>%
#  separate(
#    col = columna_vieja,
#    into = c("nueva_columna_1", "nueva_columna_2"),
#    sep = c("_") # cómo se separan las variables en la columna (ej. ".", "_")
#  )

# Por ejemplo, dividamos la columna "localidad" de la tabla "datos_xlsx" en 
# "ciudad" y "provincia".

# antes
datos_xlsx

# despues
datos_xlsx %>%
  separate(
    col = localidad, # la columna vieja
    into = c("ciudad", "provincia"), # las nuevas columnas
    sep = c(" - ") # modo de separación
  )

## ----

## •• unite() ••

# • La operación unite() es lo opuesto a separate().

# • La función unite() une dos variables que están en columnas diferentes.

# • Toma dos columnas (variables) y las convierte en una. Se usa ampliamente 
#   para ensamblar informes finales o tablas para análisis visual.

# • La sintaxis de la función es:
# datos %>%
#   unite(
#     col = nueva_columna, columnas_para_juntar,
#     sep = c("_") # cómo se separan las variables en la columna (ej. ".", "_")
# )

# Por ejemplo, unamos las columnas "zona" y "año".

# antes
datos_xlsx

# después
datos_xlsx %>%
  unite(
    col = "zona_ano", "zona", "ano",
    sep = "_"
  )

## ----

## •• drop_na() y replace_na() ••

# • Cuando tenemos datos faltantes en nuestra tabla (NA), podemos reemplazar NA 
#   con nuevos valores con la función:

# replace_na(
#   list(columna_X = valor)
# )

# • ...o podemos eliminar las filas con valores faltantes con drop_na().

# drop_na(
#   columna
# )

## • Por ejemplo, podemos reemplazar las filas con el valor faltante en la 
##   columna "var_respuesta" por cero (lineas 1, 6 y 20) o podemos eliminar 
## las líneas que tiene valores NA.

# antes
datos_xlsx

# reemplazar
datos_xlsx %>%
  replace_na(list(var_respuesta = 0))

# eliminar 
datos_xlsx %>%
  drop_na(var_respuesta)

## ----

## •• pivot_longer() y  ••

# • pivot_longer() "alarga" los datos, aumentando el número de filas y 
#   disminuyendo el número de columnas.

# pivot_longer(
#   cols = Columnas_para_pivotar,
#   names_to = "nombre_nova_columna",
#   values_to = "nombre_col_values"
# )

## • Por ejemplo, pasemos los años de la tabla "datos_csv" de las columnas a las 
##   filas. Los valores los almacenaremos en una columna llamada 'value'.

# antes:
datos_csv

# después:
datos_csv %>%
  pivot_longer(
    cols = c('2001', '2002', '2003'),
    names_to = "año",
    values_to = "value"
  )


## •• pivot_wider() ••

# • pivot_wider() pasa los datos de columnas para filas, aumentando el número 
#   de columnas.

# pivot_wider(
# names_from = columna_nombres, 
# values_from = columna_valores
# )

## • Por ejemplo, pasemos los elementos de la columna "variable" a las columnas
##   y usemos la columna "valor" para los valores (tabla "data_txt").

# antes:
datos_txt

# después:
datos_txt %>%
  pivot_wider(
    names_from = variable,
    values_from = value
  )

## --
## ★ Ejercicios ★
##
## 1 - Abra la tabla "tidy_ej.xlsx" en R.
##
## 2 - ¿Faltan datos en la tabla tidy_ej? Si es así, reemplace los valores 
##     faltantes con 0. Tip: datos %>% is.na() %>% table()
##
## 3 - Separe la columna "departamento - año" en dos columnas.
## 
## 4 - Mueva las columnas "PNI", "Urban" y "Rural" a una sola columna y agregue
##     los valores a una nueva columna llamada "número de accidentes".
##
## 5 - Guarde todo lo que ha hecho en una nueva table tibble llamada "tidy_ej2".
##
## ----

# ------------------------------------------------------------------------ #

## ---- •• dplyr •• ---- #

# • El 📦 dplyr es lo paquete más útil para realizar la transformación de datos, 
#   combinando simplicidad y eficiencia de una manera elegante.

# • Los scripts R que hacen un uso inteligente de los verbos dplyr y las 
#   facilidades del operador pipe tienden a ser más legibles y organizados sin 
#   perder velocidad de ejecución.

## --

## •• select() ••

# Usamos para seleccionar columnas.

# • Los argumentos son los nombres de las columnas que desea seleccionar.
#   datos %>%
#     select(nombre_col, nombre_col2)

# • Para eliminar columnas de la base, agregue un "menos" (-) antes de la 
#   selección.
#   datos %>%
#     select(-nombre_col, -nombre_col2)

# • También disponemos de otras funciones auxiliares:
#     - starts_with(): para columnas que comienzan con texto estándar
#     - ends_with(): para columnas que terminan con texto estándar
#     - contiene(): para columnas que contienen texto estándar


## • Por ejemplo: 
##   - Seleccionemos las columnas "localidad" y "año" de la tabla "datos_xlsx".

# antes:
datos_xlsx

# después:
datos_xlsx %>%
  select(localidad, ano)

##   - Seleccione todos los datos excepto "ID" y "temperatura".
datos_xlsx %>%
  select(-ID, -temperatura)

## ----

## •• arrange() ••

# • Para ordenar líneas.

# • Los argumentos son las columnas por las que queremos ordenar las filas.
# datos %>% 
#   arrange(columna_x)

# • También podemos ordenar en orden descendente usando la función desc()...
# datos %>% 
#   arrange(desc(columna_x))

# • ¡Y ordena más de una columna al mismo tiempo!
# datos %>% 
#   arrange(columna_y, desc(columna_x))

## • En el siguiente ejemplo, ordenamos las líneas base en orden ascendente 
##   de "response_var".
datos_xlsx %>%
  arrange(var_respuesta, desc(ano))

## ----

## •• filter() ••

# • Para filtrar valores de una columna base, usamos la función filter().
# datos %>% 
#   filter(columna < value)

# • Por ejemplo, podemos seleccionar datos con una "var_respuesta" superior a 50.
# datos_xlsx %>%
#   filter(var_respuesta > 50)

# • También podemos usar el filtro con caracteres.
datos_xlsx %>%
  filter(zona %in% "Urbano")

## ----

## •• mutate() ••

# • Para modificar una columna existente o crear una nueva.

# • Aplicaremos una función.

# • La regla es que el resultado de la operación devuelve un vector con una 
#   longitud igual al número de filas en la base.
#   datos_xlsx %>%
#     mutate(columna = columna+función)

# • También puede crear/modificar tantas columnas como desee dentro de la 
#   misma mutación.
#   datos_xlsx %>%
#     mutate(columna = columna+función, nueva_columna = columna/valor)

## • Por ejemplo, digamos que descubrió un error en su tabla. Agregaste uno 
##   individuo más en la columna "var_respuesta" y ahora necesitas quitar 
##   ese valor.
datos_xlsx %>%
  mutate(var_respuesta = var_respuesta - 1)

## ----

## •• summarize() ••

# • Es la técnica de resumir un conjunto de datos utilizando alguna métrica de 
#   interés.

# • Media, mediana, varianza, frecuencia, proporción, por ejemplo, son tipos 
#   de resumen que aportan información diferente sobre una variable.
#   datos %>%
#     summarize(función(columna))

# No vamos a explorar esta función aquí, ya que tendremos una clase solo sobre 
# estadística descriptiva en R.
datos_xlsx %>%
  summarize(media = mean(temperatura), na.rm = TRUE)

## ----

## •• relocate() ••

# • Para reubicar columnas.

# • De forma predeterminada, coloca una o más columnas al comienzo de la base.

# • Coloque las columnas 5 y 4 al principio de la tabla.
#   datos %>%
#     relocate(columna5, columna4)

# • Podemos usar los argumentos .after = y .before = para realizar cambios 
#   más complejos.

# - Poner la columna 2 después de la columna 4
#   datos %>%
#     relocate(columna2, .after = columna4)

# - Poner la columna 2 antes de la columna 4
#   datos %>%
#     relocate(columna2, .before = columna4)

## ----

## •• rename() ••

# • Cambia los nombres de variables individuales (columnas) usando la sintaxis 
#   nuevo_nombre = viejo_nombre.
#   datos %>%
#     rename(columna_x = columna.x)

# • Por ejemplo, vamos cambiar el nombre de la columna "localidad" por 
#   "municipalidad".
datos_xlsx %>%
  rename(municipalidad = localidad) %>%
  names()

## ----

## •• left_join(), right_join() y full_join() ••

# • Lo usamos para unir dos tablas en una.

# • Une la tabla 'datos' a la tabla 'datos2' por 'columna_x'

# - Mantiene los elementos de la tabla 'datos' y excluye elementos adicionales de 'datos2'.
#   datos %>%
#     left_join(datos2, 
#           by = "columna_x")

# - Mantiene los elementos de la tabla 'datos2' y excluye elementos adicionales de 'datos'.
#   datos %>%
#     right_join(datos2, 
#            by = "columna_x")

# - Mantiene los valores de las dos tablas.
#   datos %>%
#     full_join(datos2, by = "columna_x")

## --
## ★ Ejercicios ★
##
## Trabajemos con la tabla "tidy_ej2".
##
## 1 - Reordene los datos de forma ascendente de acuerdo con la columna "ID".
##
## 2 - Retire la columna "temperatura".
## 
## 4 - Divida el valor de la columna "número de accidentes" por la columna 
##     "población" y multiplique por 100,000; resultando en el número de casos 
##     por cada 100.000 habitantes
##
## 5 - Salvar la tabla como un ".csv".
##
## ----

# ------------------------ •• Fin de clase •• -------------------------------- #

## ---- •• home work! •• ---- #

# Envie para:
# https://forms.gle/ryeDtZNHuzk56LtF8

## •• Parte 1 ••

## 1. Crea un objeto tipo vector con valores aleatorios entre 10 y 50 que 
#     contenga 15 números.

# 1a - Pregunte a R cuáles son los valores entre la posición 2 y 5.

# 1b - Pregunte a R qué vector tiene los valores 2, 15 y 25.

# 1c - Multiplica todos los valores vectoriales por -1. Almacene el resultado 
#      en un nuevo objeto llamado vector_negativo.

# 1d - Utilice la función length() para verificar el tamaño del vector.

# 1e - Utilice la función sum() para sumar los valores vectoriales.

## 2. Registraste el número mensual de casos de dengue en Argentina durante 
##    5 años. Los resultados están en la siguiente matrix:
dengue <- sample(0:500, 5*12) %>%
  matrix(nrow = 12) 

## En las lineas tenemos los meses y columnas los años. 
## Ahora interprete los siguientes resultados.

length(dengue)
dim(dengue)
sum(dengue)
dengue[1,] %>% sum()
dengue[,5] %>% sum()
dengue[2,3]
dengue[,1] > dengue[,2]
dengue[,4] %in% 0

## 3. Transformar el objeto "dengue" en un data.frame.

## 3a. ¿Para qué sirve la función str()?
str(dengue2)

## 3b. ¿Qué devuelve la función head()?
head(dengue2)

## 3c. Agregue una columna con el nombre de los meses del año a la tabla.

## 3d. El valor del mes 1 en el año 1 es ...
dengue2[1, 1]

## ... Pero descubrió que este valor era incorrecto, en realidad es 500!
dengue2[1, 1] = 500
dengue2

## Ahora cambie el valor del mes 12 en el año 5 por 105.

## --

## •• Parte 2 ••

## Abra la base de datos "iris". Para hacer esto, ejecute el siguiente comando:
iris <- iris
iris

## 4. Convierte esta base en un tibble.

## 5. Utilice glimpse() para ver una descripción general rápida de los datos.

## 6. Imprima la columna "Sepal.Length" usando la función select(). Intente 
##    usar la función pull() en lugar de seleccionar para ver cuál es la 
##    diferencia.

## 7. Imprima toda la tabla excepto la columna "Species"  usando la función 
##    select().

## 8. Imprima las columnas Sepal.Length, Sepal.Width, Petal.Length y 
##    Petal.Width. Considere usar el símbolo de dos puntos (:) para simplificar 
##    la selección de columnas consecutivas.

## 9. Crea dos columnas nuevas. El primero con la relación entre la altura y el 
##    ancho del sépalo y el segundo con del pétalo (length/width). 

## 10. Create an object called "iris2" with the species in the columns and the 
##     measurements of "sepal" and "petal" in the rows.

## 11. Crea un objeto llamado "iris2" con la especie en las columnas y las
##     medidas en las filas.

# -------------------------- •• Fin •• ---------------------------------- #

