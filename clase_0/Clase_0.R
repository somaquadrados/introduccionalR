#### PROGRAMACIÓN EN R: INTRODUCCION. CLASE 0####
#Cuando abrimos el programa y antes de correr los script o análisis conviene siempre limpiar nuestro "environment" para evitar sobreescribir objetos#

ls()
rm(list=ls())
ls()
#ejemplo#
a<-14
b<-16

ls()
rm(list=ls())
ls()

#Mi primer código#
print("Hola Mundo")

#Paquetes: cómo instalarlos#
#podemos instalarlos directamente desde la pestaña "Packages" o mediante el siguiente comando

install.packages("vegan")

# El R nos permite hacer diferentes tipos de calculos, como si fuera una calculadora#

2+2
2/2
2*2

# Y tambien nos permite realizar calculos más complejos (veremos en las próximas clases)#

#Podemos importar y exportar archivos muy facilmente#

#Importar archivos#

setwd("F:/eli/Curso de capacitacion R_INMeT")#seteamos nuestro directorio de trabajo, que es dónde estan los archivos que necesitamos y dónde queremos guardar los que generamos con los scripts

library(readr)
planilla<- read_delim("planilla_curso.csv", 
                   ";",escape_double = FALSE, trim_ws = TRUE)

#Exportar archivos# 
exp<- as.list(as.list(seq(1,50, 4)))

write.table(exp, "ejemplo.txt", sep='\t')

#Podemos preguntarle al R cual es el directorio donde estoy trabajando#
getwd()

# Y podemos preguntarlo por los archivos y otros directorios de nuestra carpeta#

# Ver archivos
list.files()

# Ver directorios
list.dirs() 
#***************************************************************************                  Vamos a hacer unos ejercicios                          *
#**************************************************************************


#Recuerden que para ejecutar los comandos se utiliza la combinación de las teclas Ctrl + Enter#
#***************************************************************************                  Seteando el directorio de trabajo                     *
#**************************************************************************

#Use el comando setwd() para elegir su directorio de trabajo. Recuerde colocar en el formualario de google la linea completa del script y si tuvieron inconvenientes para ejecutarlo#


#Los resultados deben ser colocados en el formulario que tendrán disponible#


#                           Suma                                          #
#Resolver las siguientes operaciones de adición#
4+3
25+69
3+99+25
112+245
139+256

#                        Sustracción                                      #
#Resolver las siguientes operaciones de sustracción#
5-2
9-25
185-27
291-199
201-278

#                      Multiplicación                                     #
#Resolver las siguientes operaciones de multiplicación#
2*4
28*9
407*3
76*15
128*112

#                      División                                            #
#Resolver las siguientes operaciones de división# 
8/2
15/3
24/5
269/8
127/7

#                      División para encontrar el cociente               #
#Resolver las siguientes operaciones de división para conocer cual es la parte entera de la division# 

10%/%3 
15%/%3
256%/%42
125%/%25
81%/%9

#                      División para encontrar el residuo                #
#Resolver las siguientes operaciones de división para conocer cual es el resto de la division# 

10%%3 
12%%5
47%%7
89%%8
233%%3

#                             Potencia                                  #
#Resolver las siguientes operaciones de potencia#.
2^3
15^2
27^3
71^2
101^2
#otra forma de programas la potencia es usanto asteriscos 
2**3
15**2
27**3
71**2
101**2

# la potencia puede ser un numero entero o una proporcion#
2^1.5
15^2.8
27^0.25
71^0.9
101^1.1
(15^(1/3))

#                             Raices                                      #
#Resolver las siguientes operaciones#

sqrt(9)
sqrt(25)
sqrt(36)
sqrt(64)
sqrt(81)

((1)^(1/3))
((27)^(1/3))
((64)^(1/3))

#                             Exponencial                                 #
#Resolver las siguientes operaciones#

exp(2)
exp(5)
exp(9)

#                            Logaritimo                                #
#Resolver las siguientes operaciones#

log(3)
log10(25)
log(36,2)
log(250,5)

#                            Valor absoluto                               #
#Resolver las siguientes operaciones#

abs(-5)
abs(-25)
abs(36)
abs(-99)
abs(87)

#                            Cálculos combinados                         #
#Observe las siguientes operaciones y resuelvalas#

###ATENCION: algunas tienen la sintaxis incorrecta, identificar cual es el error y corregirlo###

2+8*9
(2+8)*9
((15+25)/25)
Exp(5)
(15*25/25)
2*(3+5 
   + )
2,8*9
2^(4*2)
584%2
-25/5
-65^(-1/3)
Log(6)

#***************************************************************************                                    AYUDA                               *
#**************************************************************************

help("Math")

help("Arithmetic")

help("Trig")

help("Log")

help("Special")
