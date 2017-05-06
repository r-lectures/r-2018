--- 
layout: default 
title: Clase 6
--- 


# emma habla de caret


# repaso de la clase anterior


## RStudio

-   Working directory / Workspace
    
        getwd() # para saber donde estoy
        setwd("path/to/dir") # para decirle donde quiero estar
-   Proyectos: Conjunto de archivos que van juntos: miproyecto.Rproj, .RData, .Rsession, etc
-   Cómo grabo lo que hago?

<ol class="smallfont">
  <li>abrir un proyecto nuevo y grabar después</li>
  <li>grabar en algún directorio y después decirle que haga un proyecto ahí</li>
  <li>sin proyectos, gestionar todo uno mismo (no muy recomendado)</li>
</ol>

<div class="NOTES">
-   <https://support.rstudio.com/hc/en-us/articles/200526207-Using-Projects>
-   Usen atajos de teclado! Ver machete de RStudio (cheatsheet) en Slack

</div>


## Funciones

<div class="NOTES">
Una función tiene como propósito encapsular y automatizar tareas que se repetirón, posiblemente 
sobre objetos distintos cada vez. Por ejemplo, la función \`read\_csv\` o \`plot\` contiene código que no
querríamos escribir cada vez que queremos cargar datos de un archivo csv o hacer un gráfico. A su
vez, con ellas podemos cargar datos de cualquier archivo csv o hacer cualquier gráfico.

Más información en <http://r4ds.had.co.nz/functions.html>.

</div>


### anatomía de f()

    # mi función se llama alta_funcion, con dos argumentos
    alta_funcion <- function(arg1 = 10, arg2 = TRUE, ...){
    
      # acá empieza mi código
      library(paquete_externo)
      x <- funcion_externa(arg_ext = arg1) 
      ...
      alto código
      código y más código
      ...
      alto_resultado <- mansa_funcion(arg2) # genero alto_resultado
    
      return(alto_resultado) # devuelvo alto resultado
    }

    # llamo a mi función de distintas maneras
    x_default <- alta_funcion() # uso arg1 = 10 y arg2 = TRUE
    x_100_F   <- alta_funcion(100, FALSE)
    x_200_T   <- alta_funcion(200, TRUE)
    mi_var    <- alta_funcion(arg2 = FALSE, arg_ext = 10.2) # uso arg1 = 10


### ejemplo

    # función que normaliza de dos maneras distintas un vector de valores 
    normaliza_vector <- function(vector = c(10, 9, 8, 7, 6), square_root = FALSE){
    
        if(square_root == TRUE) N <- sum(vector^2)^(1/2)
        else                    N <- sum(vector)/length(vector) # ojo, da error si vector está vacio
    
        if(N != 0) return(vector/N)
        else print("error: Norma igual a cero!")
    }
    
    # distintas maneras de llamar la función
    normaliza_vector() # con los argumentos por default
    # [1] 1.250 1.125 1.000 0.875 0.750
    x <- c(10, 9, 8, 7 , 6) # c() es una función que toma N argumentos y devuelve un vector
    normaliza_vector(x) # haciendo explícito el vector
    # [1] 1.250 1.125 1.000 0.875 0.750
    y <- c(1, 2, 3)
    normaliza_vector(y) # un vector diferente
    # [1] 0.5 1.0 1.5
    normaliza_vector(y, TRUE) # usando la norma euclidiana
    # [1] 0.2672612 0.5345225 0.8017837

<div class="NOTES">
La idea de las funciones es que vamos escribiendo código y que, cuando funciona, lo metemos dentro
de la función. Luego se puede ir extendiendo a medida que se va necesitando (por ejemplo, agregando
argumentos, etc). 

Es más fácil escribir una función a partir de código que ya sabemos que funciona que sentarse a
escribir una función de cero.

</div>


# tipos de datos


# *subsetting*


# repaso de la práctica 5

Trabajamos sobre datos de ruido de Buenos Aires Data. 

1.  Escribir una función que devuelva el min, máx y
    promedio (mean) del ruido dependiendo del barrio
2.  Porqué obtengo un `NA` en los resultados de la práctica anterior?
    1.  Usar lo aprendido sobre joins para no tener este `NA`
3.  Cómo puedo mejorar la columna FECHA de la práctica 3? Consejo: usar el paquete `stringr` más `tidyr::separate`
4.  Cuál es la hora de mayor ruido del día? Cuál es el dia más ruidoso de la semana? Hay algún barrio
    con mucho más ruido durante el fin de semana que el resto?

