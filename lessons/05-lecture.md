--- 
layout: default 
title: Clase 5
--- 


# repaso de la clase anterior


## lectura/escritura

"read\_csv()" lee un archivo delimitado por comas.

    read_csv(readr_example("mtcars.csv"))
    read_csv(readr_example("mtcars.csv.zip"))
    read_csv(readr_example("mtcars.csv.bz2"))
    read_csv("https://github.com/tidyverse/readr/raw/master/inst/extdata/mtcars.csv")

Se pueden controlar cosas como col\_types, col\_names, delim, skip, n\_max, y otros. 

Existe una "write\_csv" equivalente.


## *Piping*  con  *Magrittr* y operador %>%

    x %>% f en vez de f(x) # el valor de x se direcciona a f()

    x %>% f(., arg2, arg3) # por default pasa al 1er argumento
    x %>% f(arg2, arg3)    # por lo tanto, puede obviarse el punto
    x %>% f(arg1, ., arg3) # puede usarse el punto para direccionar a otro lado
    
    mean_by_state %>% # mi data.frame
    mutate(frac = mean/overall_mean) %>% # creo la columna frac
    filter(frac >= 1) %>% # filtro la columna frac
    arrange(desc(frac)) # ordeno de mayor a menor


## combinando data.frames (sin llaves)

<img src="./figs/binds.png">


## combinando data.frames (con llaves)

<img style="WIDTH:500px; HEIGHT:420px; border:0" src="./figs/joins.png">

<img style="position:absolute; TOP:100px; LEFT:750px; WIDTH:400px; HEIGHT:150px; border:0" src="./figs/sets.png">

-   miren con cuidado el cheat-sheet de dplyr


# repaso práctica 4

<ol class="smallfont">
  <li>Entrar en Buenos Aires Data (ver link en la web del curso)</li>
  <li>Ir a datos de Contaminación sonora </li>
  <li>Bajar csv's de Torres y Mediciones 2011, 2012 y 2013 </li>
  <li>Cargar todo en R </li>
  <li>Hacer un gran data.frame con TMI y las tres mediciones</li>
  <li>Cuales son los 5 barrios en donde hay más (menos) promedio energético hora?</li>
  <li>Cómo se comparan los valores extremos con la media de todos los barrios?</li>
</ol>


## hacer gran-dataframe-gran

    library(readr)
    tmi <- read_csv("~/Downloads/torres-de-monitoreo-inteligente.csv")
    ## Parsed with column specification:
    ## cols(
    ##   TMI = col_integer(),
    ##   BARRIO = col_character(),
    ##   DIRECCION = col_character()
    ## )
    ## > tmi
    ## # A tibble: 16 × 3
    ##      TMI            BARRIO                 DIRECCION
    ##    <int>             <chr>                     <chr>
    ## 1   1282         Mataderos        Av. Eva Perón 5251
    ## 2   1283           Liniers   Lisandro de la Torre 39
    ## 3   1284   Vélez Sarsfield          Av. Segurola 726
    m2011 <- read_csv2("~/Downloads/mediciones-2011.csv")
    m2012 <- read_csv2("~/Downloads/mediciones-2012.csv")
    m2013 <- read_csv2("~/Downloads/mediciones-2013.csv")
    
    # construyo data.frame
    ruido_bsas <- bind_rows(m2011, m2012, m2013)
    ruido_bsas <- left_join(ruido_bsas, tmi)


## Ruidosos? Tranquilos?

    # 5 barrios más (menos) ruidosos
    ruido_barrios <- ruido_bsas %>% 
    group_by(BARRIO) %>% 
    summarise(ruido_avg = mean(PROMEDIO_ENERGETICO_HORA, na.rm = TRUE)) %>% 
    arrange(desc(ruido_avg)) 
    # pregunta: de dónde viene el NA? (Assumptions...)
    
    ruido_barrios %>% head(n=5) # o tail(n=5) para ver los menos ruidosos


## Extremos vs. media?

    # como se comparan los valores extremos y la media
    ruido_barrios %>% summary # o más elegante: ruido_barrios %>% select(ruido_avg) %>% summary
    
    ## también funciona esto:
    ## ruido_barrios %>% summarise(mean(ruido_avg))
    ## ruido_barrios %>% summarise(max(ruido_avg))
    ## ruido_barrios %>% summarise(min(ruido_avg))
    
    59.79/70.49
    # [1] 0.8482054
    74.94/70.49
    # [1] 1.06313


# RStudio


## cómo grabo lo que hago?


## proyectos


## atajos de teclado


# Funciones

<div class="NOTES">
Una función tiene como propósito encapsular y automatizar tareas que se repetirón, posiblemente 
sobre objetos distintos cada vez. Por ejemplo, la función \`read\_csv\` o \`plot\` contiene código que no
querríamos escribir cada vez que queremos cargar datos de un archivo csv o hacer un gráfico. A su
vez, con ellas podemos cargar datos de cualquier archivo csv o hacer cualquier gráfico.

Más información en <http://r4ds.had.co.nz/functions.html>.

</div>


## anatomía de f()

    alta_funcion <- function(arg1, arg2, ...){
      alto código
      código y más código
      alto_resultado <- manso código
    
      return(alto_resultado)
    }


## ejemplo


## paso a paso

-   Note the overall process: I only made the function after I’d figured out how to make it work with
    a simple input. It’s easier to start with working code and turn it into a function; it’s harder to
    create a function and then try to make it work.


# Práctica 5

<ol class="smallfont">
  <li></li>
</ol>

