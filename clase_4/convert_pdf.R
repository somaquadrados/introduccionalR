#' ---
#' title: convert rmarkdown into pdf
#' author: Marlia Melo Favalesso
#' date: 2021-03-24
#' ---

# packages
library(pagedown)
library(xaringan)
library(tidyverse)

# convert to pdf
setwd("F:/eli/Curso de capacitacion R_INMeT/Clase_3/Clase.3")
purrr::map(dir(pattern = ".Rmd$"), pagedown::chrome_print)

# pagedown::chrome_print("clase_1.html")
# system("`npm bin`/decktape remark file.html file.pdf")
# remotes::install_github('rstudio/pagedown')

# ---------------------------------end---------------------------------------- #


