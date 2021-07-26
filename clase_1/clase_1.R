# ------------------------------------------------------------------------ #
# Introducción al análisis de datos biológicos con R - Clase 1
#
# Marília Melo Favalesso
# mariliabioufpr@gmail.com
# github.com/mmfava
#
# 30/06/2021
# ------------------------------------------------------------------------ #
#
# Contenidos:
# • Objetos y atribuciones
# • Clases 
# • Tipos de objetos
# • Estructuras de Control
# • Funciones
#
# ------------------------------------------------------------------------ #

## ---- •• Objetos y atribuciones •• ---- #

## Los objetos son variables capazes de almacenar cualquier valor 
## o estructura de datos.

# Guardamos el valor '6' en 'objeto' con '<-'
objeto <- 6 # asignar "6" a "objeto"
objeto # verificar el valor en "objeto" (mirar console 🡣) 

# El símbolo = se puede utilizar en lugar de <- pero no se recomienda.
objeto2 = 7
objeto2

## Las declaraciónes pueden ser echas una en cada línea...
j <- 14
y <- 24

## ...o las dos al mismo tiempo (separados por ";").
j <- 14; y <- 24

## podemos usar el ";" para asignar y para llamar a nuestro objeto 
## y ver su contenido:
j <- 14; j

## Otros ejemplos de creación de objetos:

# Numeros:
b <- 24
b

c <- 69
c

# Characteres:
d <- "e"
d

e <- "d"
d

## ¡¡Tenga en cuenta que cada objeto solo puede almacenar una estructura 
##   a la vez (un número o una secuencia de valores)!!
a <- 5
a

a <- "bien"
a

a <- 325662566
a

## Reglas para nombrar objetos:

# • Pueden estar formados por letras, números, "_" y "."
# • No se puede empezar con un número y/o un punto
# • No puede contener espacios
# • Evitar el uso de acentos
# • Evitar el uso de nombres de funciones como: 
#     > sum, diff, df, var, pt, data, C, etc
# • La R distingue entre mayúsculas y minúsculas, por lo que:
obj <- 1
Obj <- 2
OBJ <- 3

obj; Obj; OBJ

# Permitido
a <- 5
a1 <- 5
obj <- 10
mi_obj <- 15
mi.obj <-15

# No permitido
1a <- 1
a 1 <- 5
_obj <-15
mi-obj <- 15

## Podemos almacenar el valor de un objeto k dentro de un objeto w:
k <- 10
w <- k
w

## Podemos usar objetos para realizar operaciones matemáticas...
a + y / j

## ... y podemos asignar esta operación matemática a un nuevo objeto.
k <- a + y / j
k

## Gestionar el lugar de trabajo
# Enumere los objetos creados con la función ls():
ls()

# Para eliminar objetos con rm():
rm(a) # uno
ls()

rm(b, c) # >1
ls()

## !! obs: La pestaña "Environmental" de RStudio muestra los objetos creados
##         hasta ahora en la sesión actual (🡥). 

## --

## ★ Ejercicios ★

## Fuiste al campo y recogiste algunos vectores, que se enumeran en la 
## en la secuencia:

# Anopheles_sp =	5
# Lutzomyia_sp	= 35
# Aedes	= 4
# Desconocido = 16

## 1 - Cree objetos para cada especie y almacene el número de 
##     individuos en cada objeto (n en la tabla).

## 2 - Cree objetos para cada especie de mosquito y almacene el número de 
##     individuos en cada objeto (n en la tabla).

## 3 - ¿Qué porcentaje de Lutzomyia sp. se muestreó?
  
## 4 - Si eliminamos los mosquitos desconocidos, ¿cuál es la cantidad total
##     muestreada? ¿Y cuál es el porcentaje de Aedes?

## --

# ------------------------------------------------------------------------ #

## ---- •• Clases •• ----  #

## Los objetos tienen tres características:
a <- 1
# 1. Nombre que le damos al objeto (= a)
# 2. Contenido en sí del objeto (= 1)
# 3. Atributo del objeto: 
#    3.1 Clase: naturaleza del elementos (1 = numerico)
#    3.2 Estructura: Cómo están organizados los elementos (a = vector)

## La clase de un objeto es muy importante en R! Es a partir de él que las 
## funciones y los operadores pueden saber exactamente qué hacer con un objeto.

# Por ejemplo, es posible sumar dos objetos numéricos,...
a <- 1
b <- 2

a + b

# ... pero no podemos sumar dos caracteres:
c <- "c"
d <- "!"

c + d

# > !!R verificó la naturaleza de "c" y "d" y las identificó como no numéricas.

## ----

## •• Objetos atómicos ••

# R tiene 5 clases básicas de objetos, también llamados objetos atómicos:

# 1 - numeric: Números reales, punto flotante (enteros o decimales).
num <- 1.50

# 2 - integer: Números enteros.
num_int <- 1L # siempre ponemos un "L" en la secuencia del numero.

# 3 - logical: booleano (True/False).
logtf <- TRUE

# 4 - character: una cadena de caracteres, comúnmente utilizada para 
#     representar palabras, frases o texto.
ca <- "holla!"

# 5 - complex: Un número con partes reales e imaginarias.
com <- 1.5 + 2i

## ✽ Importante ✽

# • Use la función* class() para verificar si la clase de su 
#   objeto es correcta:
aa <- 1
class(aa)

# * La idea básica de una función es encapsular un código que se pueda 
#   invocar en cualquier momento en R. Su significado y uso son muy 
#   similares al de las funciones matemáticas, es decir, hay un nombre, 
#   una definición y posterior invocación de la función.

# • Las expresiones de tipo 'character' deben aparecer entre comillas 
#   simples o dobles:
bb <- 'Esto es un character!'
bb

cc <- "Lo mismo (:"
cc

## • Los números en R generalmente se tratan como objetos 'numeric' 
##   (números reales de doble precisión). Incluso los integer. Para que 
##   un entero se trate como un objeto entero, debe usar la letra L después1
##   del número:
dd <- 1
class(dd) # no interpretado como integer

ee <- 1L
class(ee) # interpretado como integer

## • Los valores logical (o booleanos) son TRUE (verdaderos) o FALSE (falsos). 
##   También se aceptan T o F.

# * == : operador matemático "exactamente igual a ..."

ff <- T
gg <- TRUE
ff == gg 

hh <- F
ii <- FALSE
hh == ii

## --
## ★ Ejercicios ★

## 1 - Crea un objeto para las clases numeric, integer, character e logical y 
##     comprueba que lo hizo correctamente.

## 2 - Tenga en cuenta los siguientes objetos:
a <- 35 + 18^4 * 2
b <- 2L + 3L + 5L
c <- 2L + 3L + 5
d <- "Me encanta la r" == TRUE
e <- F
f <- "2L + 3L + 5L"

## a) ¿Cuál es la clase de cada objeto?
## b) ¿Qué objetos tienen la misma clase y cuáles no?
## b) ¿Qué objetos tienen el mismo valor y cuáles no?
## --

# ------------------------------------------------------------------------ #

## ---- •• Tipos de objetos •• ---- ## 

# • El tipo del objeto está relacionado con la clase y la estructura/organización.
# • Pueden estar formados por elementos de la misma clase o de clases diferentes.
# • Pueden tener de una hasta n dimensiones.
# • Tenemos cinco estructuras:
#   - Vector
#   - Matrix
#   - Array
#   - List
#   - Data.frame

## ----

## •• Vetores •• 
## (elementos de misma clase)

# • Colección unidimensional de valores.
# • Almacena datos de una misma clase.
# • La forma más sencilla de crear un vector es enumerr los valroes separados 
#   por comas (,) dentro de un 'c()':

area <- c("urb", "rur", "urb", "rur", "urb", "rur")
area

temperatura <- c(20, 23, 18, 20, 14, 17)
temperatura

## --

## Coerción
# • No es posible mezclar datos de dos clases en un vector.
# • Si lo intenta,  exhibirá el comportamiento conocido como coerción.

aa <- c(1, 2, 3, 4, "a")
class(aa)

bb <- c(1L, 2L, 3.50, 4.1)
class(bb)

# orden de dominio: 
# DOMINANTE character > numeric > integer > logical RECESIVO

## --

## Conversión

# • Es posible intentar forzar a un vector a tener una clase específica:
a <- 1
class(a)

a1 <- as.character(a)
class(a1) # como un character

a2 <- as.integer(a)
class(a2) # como un entero

a3 <- as.numeric(a)
class(a3) # como un doble

a4 <- as.logical(a)
class(a4) # como un booleano

## --

## Hay algunas formas prácticas de crear vectores...

# • Secuencia de unidade: x1:xn.
anos <- 2001:2021
anos

# • Secuencia con espaciado diferente: seq().
edad <- seq(from = 0, to = 80, by = 20)
edad

# from: edad inicial
# to: edad final
# by: rango de valores

# • Repetición: rep().
area <- rep(x = c("urb", "rur"), times = 3)
area

mes <- rep(x = c(1, 2), times = 3)
mes

# • Nombres con secuencia numérica: paste().

# - Sin una separación definida
muestras <- paste("muestra", 1:10)
muestras

# - Con una separación definida
muestras <- paste("muestra", 1:10, sep = "_")
muestras

# • Muestreo aleatorio de valores: sample().

# - Sorteo sin reemplazo
sorteo1 <- sample(1:100, 20, replace = F)
sorteo1

# - Sorteo con reemplazo
sorteo2 <- sample(1:100, 20, replace = T)
sorteo2

## --

## Pertenece (%in%)

# Pertenece (%in%) es un operador muy útil cuando necesitamos verificar
# si un cierto valor está dentro de nuestro conjunto de valores (vector):

# ¿recuerdas el objeto "área" que creamos?
area

# ¿Hay 'valores' llamados 'urb' en él?
"urb" %in% area

# ¿Hay 'valores' llamados 'for'?
"for" %in% area

## --

## ★ Ejercicios ★

# 1 - Comenzará un estudio con flebótomos en la ciudad de Puerto Iguazú y 
#     deberá seleccionar al azar 3 de 10 vecindarios para el muestreo. 
#     Haga un sorteo con  y almacena los resultados en un objeto.

# 2 - Crear un nuevo objeto mediante la repetición de los barrios donde 
#     recogerá los flebótomos 4 veces (una por cada estación de barrio). 
#     Por ejemplo, si va a muestrear los vecindarios "1", "3" y "6", el 
#     resultado debería ser (1, 3, 6, 1, 3, 6, 1, 3, 6, 1, 3, 6).

# 3 - ¿El barrio "1" forma parte de su muestra? 
#     ¿Y el barrio "10"? 
#     ¿Y el "7"?

## ----

## •• Factor •• 
## (elementos de misma clase)

# • Colección unidimensional de valores.
# • Almacena datos de la clase character.
# • El factor representa medidas de una variable cualitativa, 
#   que puede ser nominal u ordinal.

temporada <- factor(x = c("verano", "verano", "primavera", "primavera", "primavera", "otono", "invierno",  "invierno"), 
                    levels = c("verano", "primavera", "otono", "invierno"))
temporada

## > Internamente, R almacena los factores como interger
##   Mire en el "environment" como es el objeto "temporada" (🡥).

## --

## Crear un factor:
# • Factor nominal: variables nominales.
genero <- factor(x = c("Lonomia", "Megalopyge", "Automeris", "Hylesia", 
                       "Megalopyge", "Automeris", "Hylesia", "Lonomia", 
                       "Hylesia", "Megalopyge"),
                 levels = c("Lonomia", "Megalopyge", "Hylesia", "Automeris"))
genero # los datos
levels(genero) # los factores en "genero"

# • Factor ordinal: variable ordinal.
#   !! usamos em parametro "ordered = TRUE". 
mes <- factor(x = c("Janeiro", "Janeiro", "Fevereiro", "Fevereiro", "Março", "Março"),
              levels = c("Janeiro", "Fevereiro", "Março"), ordered = TRUE)
mes # los datos
levels(mes) # los meses ordenados

## --

## Convertir a factor
## as.factor().

# Vector de caracteres.
letras <- c("a", "c", "b", "d", "c", "a", "b", "d", "c")
letras

# Convierta el objeto en factor.
letras2 <- as.factor(letras)
letras2

## --

## ★ Ejercicios ★
#
# Muestrará en tres áreas diferentes de Puerto Iguazú (Misiones, Argentina):
#
#   1. El Parque Nacional Iguazú (PNI), 
#   2. un área antropogénica 
#   3. un área rural. 
#
# De esta manera, cree un vector que repita 12 veces el nombre de cada 
# ubicación de recolección (= 1 año de muestreo).

## ----

## •• Matrix •• 
## (elementos de misma clase)
#
# Colección bidimensional de valores:
#   • líneas (por ejemplo, unidades de muestreo)
#   • columnas (variables cuantitativas o cualitativas, por ejemplo: horario, 
#     tubo de ensayo, ubicación)
# Almacena datos de una única clase.

## --

## Puede construir matrices en  de dos formas 
## 1 - Disposición de elementos de un vector: matrix().
ma <- 1:12
ma

# • Por las lineas:
m <- matrix(data = ma, nrow = 4, ncol = 3, byrow = TRUE)
m

# • Por las colunmas: 
m <- matrix(data = ma, nrow = 4, ncol = 3, byrow = FALSE)
m

## 2 - Combinación de dos vectores: rbind() y cbind().
v1 <- c(1, 2, 3)
v2 <- c(4, 5, 6)

# • Combinar vectores por línea - rbind().
vr <- rbind(v1, v2)
vr
# Combinamos los vectores verticalmente, 
# uno debajo del otro

# • Combinar vectores por columna - cbind().
vr <- cbind(v1, v2)
vr
# Combinamos los vectores horizontalmente, 
# uno al lado del otro.

## --

## Cambiar nombre 
# Para cambiar el nombre de las filas y columnas, utilice las funciones 
# rownames() y colnames() respectivamente.

# antes:
ma <- 1:12
m <- matrix(data = ma, nrow = 4, ncol = 3, byrow = TRUE)
m

# después:
colnames(m) <- c("A", "B", "C") # cambia columnas
rownames(m) <- c("LA", "LB", "LC", "LD") # cambia lineas
m

## --

## ★ Ejercicios ★
#
# Está desarrollando un medicamento para la fiebre y desea analizar el 
# efecto a lo largo del tiempo. Tiene 3 pacientes y midió su fiebre después 
# de la medicación en los tiempos: 5 m, 10 m, 15 m, 20 m y 25 m. 
# Los resultados son:
#
# Paciente 1: 38, 37.9, 37.3, 37.2, 36.9
# Paciente 2: 37.9, 37.6, 37.1, 36.8, 36
# Paciente 3: 38.2, 38, 37.8, 37.2, 36.8
# 
# Configure una matriz de datos con pacientes en lineas y tiempos en columnas

## ----

## •• Array •• 
## (elementos de misma clase)

# • Tiene n dimensiones - "varias matrices emparejadas".
# • Tiene filas, columnas y dimensiones (arrays).
# • Almacena datos de una única clase

## --

## Construir un array en R: array().
vc <- 1:8 # datos
ar <- array(data = vc, dim = c(2, 2, 2)) # array
ar

## ---- 

## •• Data frame ••
## (elementos de diferentes clases)

# • Colección bidimensional de valores:
#   - líneas (unidades de muestreo)
#   - columnas (variables cuantitativas o cualitativas, por ejemplo: horario, 
#     tubo de ensayo, ubicación)
# • Almacena datos de ≠ clases.

## --

## Cómo construir un data frame en R: data.frame().

# Vamos a crear 4 vectores
area <- c("urb", "rur", "urb", "rur", "urb", "rur")
mes <- c(1, 1, 2, 2, 3, 3)
presencia <- c(T, T, F, F, T, T)
temperatura <- c(20.1, 21.2, 22.2, 23.8, 22.9, 23)
area; mes; presencia; temperatura

# Unamos los vetores en un dataframe. 
# Observe que cada vector se convierte en una columna.
dtf <- data.frame(area, mes, presencia, temperatura)
dtf

## --

## ★ Ejercicios ★

# Cree un data frame con los datos de su investigación (máximo de 6 filas y 6 columnas). 
# Si no tiene datos, utilice los datos a continuación:

# 
# localidad	tiempo	poblacion	accidentes
# A	        1	      10326	    396
# A	        2	      9658	    400
# B	        1	      6985	    236
# B	        2	      6300	    123
# C	        1	      3265	    238
# C	        2	      4005	    632

## ---- 

## •• List ••
## (elementos de diferentes clases)

# • Colección unidimensional de objetos.
# • Almacena datos de ≠ tipos (vectors, arrays, data frame, lists).
# • Es un vector especial que acepta objetos como elementos.

#   > Muchas funciones que usamos para analizar datos en R tienen listas como salida

## --

## crea una lista en r: list().
lis <- list(rbind(c(3,6), c(4,5)), 
            sample(1:100, 5), 
            factor(2, 6, 9))
lis

# ------------------------------------------------------------------------ #

## ---- •• Estructuras de Control •• ---- #

# • ¿Por qué programar? 
#   - Evite la repetición innecesaria de análisis o cálculos que se repiten con frecuencia.
#   - Documente los pasos que tomó para llegar a un resultado.
#   - Fácil recuperación y modificación del programa.

# • ¿Cómo programar? 
#   - ¡Creando programas! (guiones/scripts, rutinas, algoritmos).
#   - Crear una secuencia lógica de comandos que se deben ejecutar en orden.
#   - Utilizar las herramientas básicas de programación:
#       ° Estructuras de repetición (for())
#       ° Estructuras de selección (if())
#       ° Estructura de repetición (while())

## ----

## •• Estructura de repetición: for() ••

# • Sirve para repetir uno o más comandos varias veces.
# • En otras palabras, estamos diciendo que para cada elemento i contenido en el 
#   conjunto de valores ejecutaremos los comandos que están dentro de las llaves (code).
# • El índice no tiene que ser i, en realidad puede ser cualquier letra o palabra.

# for(w in conjunto_de_valores){code}
#   - for: para...
#   - (w in conjunto_de_valores): ...cada 'w' en 'conjunto de valores'...
#   - {code}: ... ejecutar el código.

## Para facilitar la comprensión, veamos dos ejemplos muy simples.

# 1. Imprimamos los números del 1 al 6 en la pantalla.
objeto1 <- 1:6 # Creamos un vector con valores entre 1 y 6
for(v in objeto1){ # Para cada valor v en 'objeto1' (= i)
  print(v) # imprime el valor v
}

# También podemos pedirle a R que imprima 
# valores entre 1 y 6 directamente:
for(p in 1:6){ # Para cada valor p entre 1 y 6 (= i)
  print(p) # imprime el valor p
}

# 2. Pedimos a la R que sume +1 a cada valor entre 1 y 6 y luego imprima.
for(m in 1:6){ # Para cada valor m entre 1 y 6 (= i)
  a <- m + 1 # agregue el valor en m con 1 y guárdelo en "a"
  print(a) # imprime el objeto a
}

## --

# Muestreó especies en tres ubicaciones diferentes: loc1, loc2 y loc3. Al final
# del muestreo, desea calcular el total de especies muestreadas. Haga esto 
# usando el comando "for()".

loc1 <- c(1, 8, 5)
loc2 <- c(4, 7, 1)
loc3 <- c(9, 4, 3)
mt <- rbind(loc1, loc2, loc3)
colnames(mt) <- c('T1', 'T2', 'T3')
mt

for(loc in 1:3){ # Para cada uno de los 3 loc's...
  s <- sum(mt[loc, 1:3]) # ... sumar las columnas entre 1 y 3
  print(s) # imprimir el resultado
}

## --
## ★ Ejercicios ★
# 1 - Supongamos que ha estado en el campo durante 6 meses, registrando números 
#     de especies por cada mes. Al final del campo, desea calcular la frecuencia 
#     acumulada de especies.

# Número de especies muestreadas cada mes
sps <- c(10, 12, 16, 15, 18, 11)

# Loop
total <- 0
for(n in sps){
  total <- total + n
  print(total)
}
# En una hoja de papel, escriba todos los pasos por los que pasará este loop 
# y el resultado de cada ciclo.

# 2 - Escriba un loop `for` que calcule el cubo de cada número entre 1 y 7 
#     usando la función `print()`.

# 3 - Pesó a diferentes personas con 1.80 m de altura y obtuvo los siguientes 
#     valores: 70, 85, 90, 68. Cree un loop `for` para calcular el IMC de estas
#     personas según la siguiente expresión matemática: 
#     IMC = Peso ÷ (Altura × Altura).
## ----

## •• Estructura de selección: if() ••

# Una estructura de selección - if() - sirve para ejecutar algún comando solo 
# si se satisface alguna condición (en forma de expresión condicional).

#   > En español, piense en el if como la palabra "SI" y el else como "DEMÁS"

# La sintaxis siempre estará en la forma:

# (<condicion 1>){
#   # comandos que satisface la condición
# }else{
#   # comandos que NO satisface la condición'
# }

## --

## Es posible que deseemos clasificar los niveles de vitamina D de los pacientes
## en "ideales (>20)" y "no ideales (<21)".

# 1. niveles de Vitamina D en pacientes:
vitamina_D <- sample(0:60, 5)
vitamina_D

# 2. la clasificación:
for(paciente in vitamina_D){ # para cada uno de los pacientes en "vitamina_D"...
  if(paciente > 21){print("ideales")} # si el paciente tiene un valor> 21, imprima "ideal" 
  else{print("no ideales")} # demás, imprima "no ideales"
}

## --

## •• Else if

# • Podemos usar else_if() para poner otras condiciones.
# • El else if es una condicion intermediaria entre if y else.

# La sintaxis es:
# if(condición){
#  comandos que satisface la condición 1
#  } else if (condición 2){
#    comandos que satisface la condición 2
#    } else {
#      comandos que NO satisface las confidiciónes
#    }

## --

# Se realizaron pruebas de glucosa en cuatro pacientes. A partir de los 
# resultados se desea realizar la siguiente clasificación: 
#   - 70-99 mg/dl = normal; 
#   - 100-125 mg/dl = prediabetes; 
#   - > 126 mg/dl = diabetes.

# 1. niveles de glicose en pacientes:
glicose <- sample(70:130, 4)
glicose

for(paciente in glicose){ # para cada paciente con datos de glucosa...
  if(paciente <= 99){print("normal")} # si el paciente tiene un valor <=99 - diabetes normal
  else if(paciente >= 126){"diabetes"} # si el paciente tiene valores superiores o iguales a 126 - diabetes
  else{print("prediabetes")} # los demás son prediabetes. 
}

## --

## ★ Ejercicios ★

## Tomando como entrada la altura y el sexo (codificados de la siguiente 
## manera: 1 = mujer 2 = hombre) de una persona, calcule e imprima su peso 
## ideal, usando las siguientes fórmulas:

## Fórmulas:
##  - para mujeres: (62.1 * altura) - 44.7
##  - para hombres: (72.7 * altura) - 58

## cod	altura
## 1	  1.65
## 1	  1.72
## 2	  1.78
## 2	  1.81

## ----

## •• Estructura de repetición: while() ••

# • Un ciclo while en la programación  es una función diseñada para ejecutar 
#   algún código hasta que se cumpla una condición.
# • Si bien la condición lógica es VERDADERA, el código no dejará de ejecutarse.

#   > El loop while es muy similar al loop for, pero en el segundo definirás 
#     el número de iteraciones a ejecutar.

# Para un loop while necesitas usar la función con la siguiente sintaxis:

# while(condición lógica){
#  # Code
# }

## Por ejemplo, dado que n = 5, siempre que no sea igual a 0, R no detendrá la 
## ejecución del ciclo.
n = 5

while(n > 0){ # siempre que el valor de n sea mayor que 0 ...
  print("R está trabajando") # imprima "R está trabajando"
  print(n) # imprima el valor de n
  n = n - 1 # restar 1 de n
}

# ------------------------------------------------------------------------ #

## ---- •• Funciones •• ---- #

# • Mientras que los objetos son nombres que contienen valores, las funciones 
#   son nombres que contienen un código R.
# • La idea básica de una función es encapsular un código que se pueda invocar 
#   en cualquier momento en R.

# • Usamos algunas funciones hasta ahora: 
#   c(), rep(), data.frame(), class(), otros.

## --

##  •• Argumentos •• 

# • Las funciones toman argumentos.
# • Los argumentos son los valores u objetos que ponemos entre paréntesis y 
#   que las funciones necesitan un par funcional (calculando un resultado).
# • Por ejemplo, la función class() necesita recibir un objeto para investigar 
#   la clase y devolverlo:
a <- 3
class(a) # En este caso, "a" es el argumento que incluimos en la función class().

# • Para las funciones que toman más de un argumento, tenemos que separar los argumentos con comas.
# • Por ejemplo, cuando usamos la concatenación (c()) para crear un vector:
ve <- c(1, 2, 3, 4)
ve

# • !! Importante: Observe cómo debe ser la entrada de valores para que funcione 
#                  la función.
class(1, 2, 3, 4)
class(ve)

# • Los argumentos de las funciónes también tienen nombre, que pueden o no ser 
#   usando en la función. Por ejemplo a función rep().

rep(x, # x: valores que se repetirán.
    times = 1, # vector de valor entero que da el número de veces que se repite cada elemento.
    length.out = NA, # O comprimento desejado do vetor de saída.
    each = 1) # Cada elemento de x é repetido todas as vezes.

## --

## ★ Ejercicios ★

## ¿Cuál es la diferencia entre las salidas?

## Salida 1:
rep(x = 1:3, 
    times = 3,
    length.out = NA, 
    each = 2)

## Salida 2:
rep(x = 1:3, 
    times = NA,
    length.out = 10, 
    each = 2)

## --

## También podemos usar la función sin incluir los nombres de los argumentos:

# Con nombre:
rep(x = 1:3, 
    times = 2,
    length.out = NA, 
    each = 1)

# Sin los nombres:
rep(1:3, 
    2,
    NA, 
    1)

## ----

## •• Creación ••

# • Las funciónes en R son muy similares al de las funciones matemáticas, es decir, 
#   hay un nombre, una definición y posterior invocación de la función.
# • Siempre que ejecute una función, el código que almacena se ejecutará y se devolverá 
#   el resultado.
# • Además de usar las funciones listas, puede crear su propia función. La sintaxis 
#   es la siguiente

# creando una función llamada 'f':
f <- function(a, b) { 
  j = a + b # code 
  j
}

# invocando la función:
f(a, b)

# > Tenga en cuenta que function es un nombre reservado en R, es decir, 
#   no podrá crear un objeto con ese nombre.

# --

## Creemos una función para calcular el peso ideal de las mujeres en función de la altura:
peso <- function(altura){
  p <- (62.1 * altura) - 44.7
  p
}
# Nuestra función tiene los siguientes argumentos:
# - peso: nombre de la función
# - altura: argumento de la función
# - p <- (62.1 * altura) - 44.7: operación que realizará la función
# - p: valor devuelto por la función
peso(1.70) # resultado para una mujer con 1.70

# Nuestra función también toma un vector como argumentos:
v <- c(1.7, 1.5, 1.65)
peso(v)

# Y también podemos usar con conjuntos de control:
for(i in v){
  print(peso(i))
}

## • !! Observaciones importantes: De forma predeterminada, las funciones 
##      siempre devuelven la última línea de código como resultado de la 
##      función. En nuestro caso, es el valor contenido en 'p'.
peso <- function(altura){
  p <- (62.1 * altura) - 44.7
  p # nuestra función devolverá p
}

## ¿Y qué pasa si eliminamos p de nuestra función?...
peso <- function(altura){
  p <- (62.1 * altura) - 44.7
}
peso(1.65) 
## ... ¡La R no devuelve nada!
# En el caso comentado, la última línea de código es la función matemática que 
# será el 'valor' devuelto.
# En este caso, para ver el resultado de la función debemos hacer:
peso <- function(altura){
  p <- (62.1 * altura) - 44.7
}

p1 <- peso(1.65)
p1

## En nuestro caso, es como si lo estuviéramos haciendo directamente: 
p1 <- (62.1 * 1.65) - 44.7
p1

# ------------------------------------------------------------------------ #

## ---- •• Paquetes •• ---- #

# • Las funciones provienen de dos fuentes:
#   - Paquetes R estándar que se cargan siempre que trabajamos con el lenguaje
#   - Paquetes que instalamos y cargamos por comandos.
# • Básicamente, un paquete es una convención para organizar y estandarizar la 
#   distribución de funciones R.

# La principal motivación de crear un paquete R es de organizar y compartir 
# funciones de nuevos métodos y/o implementaciones creadas y que son útiles 
# para otras personas.
# En general, descargamos paquetes de dos fuentes: CRAN y GitHub.

## ----

## •• Instalación ••

## CRAN:
# • Para instalar paquetes desde CRAN usamos el comando 
#   install.packages("nombre_paquete").
install.packages("ggplot2") # • Para instalar el paquete "ggplot2"
                            # * Tenga en cuenta que el nombre del paquete 
                            #   siempre debe ir entre comillas para la 
                            #   instalación.
# Compruebe si el paquete se ha instalado:
library()
# * abre una nueva pestaña en R escrita "Paquetes R disponibles".

## GitHub:
# • Para instalar paquetes de Github, usamos el paquete devtools: 
#   install_github("direccion/nombre_paquete").
# • Para hacer esto, necesitaremos la dirección y el nombre del paquete 
#   de un repositorio de GitHub (https://github.com/tidyverse/dplyr)

install.packages("devtools") # Instalar el paquete 'devtools'

library(devtools) # Cargar el paquete para su uso

# Incluir la dirección de descarga del paquete do 
# github en install_github("repo/nombre_paquete"):
install_github("tidyverse/dplyr")

## • !! Importante:
## - Solo instalamos los paquetes una vez.
## - Los paquetes se descargan a través de la internet.
## - El nombre del paquete debe estar entre comillas ("paquete_nombre"), 
##   independientemente de si lo vamos a descargar de CRAN o GitHub.
## - Para cargar paquetes en R usamos la función library(paquete_nombre):
library(dplyr) # En este caso no es necesario incluir comillas.
library(ggplot2)
## - Cargamos paquetes para usar sus funciones.

## ----

## •• Actualización ••

# Los paquetes no se actualizan solos.
# Es necesario actualizarlos de vez en cuando.
# ¡Es un proceso que lleva tiempo!
update.packages(ask = FALSE)

## ----

## •• Help! (ayuda) ••

# El "help" de R es muy útil cuando necesitamos ayuda para comprender una función.
help("sum")
# es necesario encerrar el nombre de 
# la función entre comillas.
?sum

## ----

## •• Citación ••
citation() # Como citar la R
citation("ggplot2") # Como citar los paquetes

## --

## ★ Ejercicios ★
#  Trabajarás con índices de disimilitud y para eso usarás el paquete "vegan".
#  Instale el paquete, asegúrese de que esté instalado, cárguelo en R y 
#  obtenga su cita.

## --

# ------------------------ •• Fin de clase •• -------------------------------- #

## ---- •• home work! •• ---- #

# Enviar para: https://forms.gle/324eBcwtQzqaGMid6

# 1 -Durante su doctorado, pasó 2 años en el campo, una vez a la semana. 
#    La duración de cada campo fue de ~ 4 horas. En total, ¿ fuerán cuántos días 
#    de campo? ¿Y cuantas horas? Utilice R para calcular los resultados y 
#    guardarlos en los respectivos objetos: días y horas.

# 2 - cree una función que calcule el total de días de campo (=ejercicio 1) 
#     simplemente dando el número de días: total_dias(x). Utilice la función 
#     para calcular un total de días para 1 y 3 años de campo.

# 3 - Cree un vector con tres especies de animales venenosos o tres vectores de 
#     enfermedades distintos y guárdelos en un objeto. 

# 4 - Cree una matriz de datos con valores enteros aleatorios entre 0 y 100. 
#     La matriz debe contener 3 filas y 3 columnas.

# 5 - Cree un data.frame con los datos del ejercicio 2 y el ejercicio 3. 
#     Las especies animales deben estar en las filas.

# 6 - Cambie el nombre de las columnas a: c("animal/vector", "2018", "2019", 
#     "2020"). 

# 7 - Haga una loop 'for' para imprimir los números almacenados en el 
#     objeto a.
a <- sample(0:200, 30)

# 8 - Haga un loop que imprime los valores del objeto "a" multiplicados por -2.

# 10 - ¿Qué hacen "for", "ifelse" y "while"?

# 11 - Instale el siguiente paquete: <https://github.com/rstudio/rmarkdown>.

# -------------------------- •• Fin •• ---------------------------------- #


















