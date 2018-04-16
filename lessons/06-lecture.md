--- 
layout: default 
title: Clase 6
--- 


# Repaso de la clase anterior


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


# Repaso de la práctica 5

Trabajamos sobre datos de ruido de Buenos Aires Data. 

1.  Escribir una función que devuelva el min, máx y promedio (mean) del ruido dependiendo del barrio

2.  Porqué obtengo un `NA` en los resultados de la práctica anterior?
    1.  Usar lo aprendido sobre joins para no tener este `NA`
3.  Cómo puedo mejorar la columna FECHA de la práctica 3? Consejo: usar el paquete `stringr` más `tidyr::separate`
4.  Cuál es la hora de mayor ruido del día? Cuál es el dia más ruidoso de la semana? Hay algún barrio
    con mucho más ruido durante el fin de semana que el resto?


# 'Types': tipos de datos

-   'logical':    TRUE o FALSE
-   'integer':    naturales: &#x2026;, -1, 0, 1, &#x2026;
-   'double':    irracionales: 3.1415926
-   'character':    alfanuméricos: "pi"
-   'complex':    1+i10
-   'raw':     48 65 6c 6c 6f


## logical

    v <- TRUE 
    print(class(v))
    #> [1] "logical"
    is.logical(v) 
    #> [1] TRUE
    1:10 %% 3 == 0 #: para generar una secuencia, %% es el operador módulo (hagan ?: y ?%%)
    #>  [1] FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE
    c(TRUE, TRUE, FALSE, NA)
    #> [1]  TRUE  TRUE FALSE    NA


## integer

    v <- 2L
    print(class(v))
    is.integer(v)
    is.numeric(v) 
    #> [1] TRUE
    typeof(1)
    #> [1] "double"
    typeof(1L)
    #> [1] "integer"
    1.5L
    #> [1] 1.5

Valor especial: NA


## double

    v <- 23.5
    print(class(v))
    is.double(v)
    is.numeric(v)
    
    x <- sqrt(2) ^ 2
    x
    #> [1] 2
    x - 2
    #> [1] 4.44e-16
    c(-1, 0, 1) / 0
    #> [1] -Inf  NaN  Inf

Los 'double' son siempre aproximaciones!

Valores especiales: NA, NaN, Inf y -Inf

Usar: is.finite(), is.infinite(), is.na(), is.nan()


## character

    v <- "TRUE" # v <- "Maldad pura"
    print(class(v))
    is.character(v)
    
    x <- "Las cadenas de caracteres pueden tener una longitud arbitrariamente larga mal que nos pese"


## complex y raw

Para números complejos, complex

    v <- 2+5i
    print(class(v))
    is.complex()

Para trabajar en bytes, se puede usar raw

    v <- charToRaw("Hello")
    print(class(v))
    is.raw()


# Objetos R: vectores

Existen dos clases de vectores:

1.  <span class="underline">Vectores 'atómicos'</span> (*atomic vectors*), todos los elementos del mismo tipo
    -   puede haber de los 6 tipos: 'logical', 'integer', 'double', 'character', 'complex' y 'raw'
    -   Integer y double son tratados como 'numeric'
    -   No hay escalares en R, si no vectores de longitud 1

2.  <span class="underline">Listas</span>
    -   Pueden a su vez contener listas (vectores recursivos)
    -   data.frames son caso especial cuando los vectores que la componen son de igual longitud

Las propiedades más importantes de los vectores son que *tipo* de vector es -typeof()-, que
*longitud* tiene -length()- y cuales *atributos* tiene asociados. Los atributos son metadata
arbitraria que se puede asociar a cualquier objeto R. Se determinan y consultan con *attr()* para
alguno en particular y con *attributes()* se consultan todos los que el objeto tenga.

<div class="NOTES">
La principal diferencia entre los vectores atómicos y las listas es que los primeros son homogeneos,
o sea todos sus elementos son del mismo tipo, mientras que en las listas no es necesario. 

Hay un objeto relacionado, 'NULL', que es la ausencia de un vector (en cambio, NA es la *ausencia* de un valor de un
vector, además de ser un vector lógico de longitud 1). NULL se puede tratar como un vector de longitud 0. Pueden leer más en los libros (colgados
en slack) o en <https://www.r-bloggers.com/r-na-vs-null/>

Otro punto importante es que la función is.vector() no dice realmente si es un vector o no, si no
que devuelve TRUE si el objeto es un vector sin atributos (aparte de su nombre). Para saber si es un
vector atómico o una lista, usar is.atomic(x) e is.list(x).

</div>


## Vectores R

<img style="WIDTH:700px; HEIGHT:600px; border:0"  src="./figs/data-structures-overview.png">


### Propiedades de vectores

<span class="underline">Tipo</span>, que se determina con *typeof()*

    typeof(letters)
    #> [1] "character"
    typeof(1:10)
    #> [1] "integer"

<span class="underline">Longitud</span>, que se determina con *length()*

    x <- list("a", "b", 1:10)
    length(x)
    #> [1] 3

<span class="underline">Atributos</span>, que se determinan con *attributes()* y *attr()*

    y <- 1:10
    attr(y, "mi_atributo") <- "Esto es un vector"

Los tres atributos más importantes se obtienen con *names()*, *class()* y *dim()*. Este último
atributo permite expandir los vectores atómicos a *arrays* multidimensionales (tensores), cuyo caso
especial 2d son las matrices. *dim()* generaliza también el papel de *length()* al caso de arrays,
mientras que *nrow()* y *ncol()* lo hacen para el caso especial de matrices ()


## Listas

Sus elementos pueden tener cualquier tipo, longitud (dimensión!) o atributos, incluyendo otras
listas o funciones ¯\\\_(ツ)\_/¯

    # una lista simple
    x <- list(1, 2, 3)
    str(x)
    
    # elementos con nombre
    x_named <- list(a = 1, b = 2, c = 3)
    str(x_named)
    
    y <- list("a", 1L, 1.5, TRUE)
    str(y)
    
    # mezcla de tipos en el mismo pbjeto
    y <- list("a", 1L, 1.5, TRUE)
    str(y)
    
    # listas de listas
    z <- list(list(1, 2), list(3, 4))
    str(z)
    
    # ya conociemos las listas 
    is.list(mtcars)
    #> [1] TRUE
    
    unlist(mtcars) # podemos 'aplanar' una lista!


## Próxima: Vectores "aumentados" y *subsetting*

-   <span class="underline">Factores</span>, construidos sobre vectores 'integer'
-   <span class="underline">Data frames</span> (y tibbles) sobre 'lists'
-   <span class="underline">Dates</span> y <span class="underline">date-times</span>, sobre vectores 'numeric'


# Práctica 6

-   Cuáles son las 3 propiedades de un vector, aparte de su contenido?
-   Cuáles son los 4 tipos más comunes de vectores atómicos? Cuál los dos menos comunes?
-   Qué son atributos? Cómo se obtienen y como se asignan?
-   De que manera es una lista diferente de un vector atómico? Porque una matriz es diferente de un data frame?

