

# Repaso de la clase anterior


## lectura/escritura

"read\_csv()" lee un archivo delimitado por comas.

    read_csv("/mi/path/al/directorio/mtcars.csv")
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

-   recuerden que lo tienen el *cheatsheet* de `dplyr`


# RStudio

-   Working directory / Workspace
    
        getwd() # para saber a qué directorio apunta mi sesión
        setwd("path/to/dir") # para definir a qué directorio quiero apuntar
-   Proyectos: Conjunto de archivos que van juntos: miproyecto.Rproj, .RData, .Rsession, etc.
-   ¿Cómo grabo lo que hago?

<ol class="smallfont">
  <li>Abrir un proyecto nuevo y grabar después</li>
  <li>Grabar en algún directorio y después decirle que haga un proyecto ahí</li>
  <li>Sin proyectos, gestionar todo uno mismo (no muy recomendado)</li>
</ol>

<div class="NOTES">
-   <https://support.rstudio.com/hc/en-us/articles/200526207-Using-Projects>
-   ¡Usen atajos de teclado! Ver *cheatsheet* de `RStudio`.

</div>


# 'Types': tipos de datos

-   'logical':    TRUE o FALSE (o NA)
-   'integer':    enteros: &#x2026;, -1, 0, 1, &#x2026;
-   'double':    irracionales: 3.1415926
-   'character':    alfanuméricos: "pi"
-   'complex':   complejos: 1+i10
-   'raw':       charToRaw("buenas")  62 75 65 6e 61 73


## `Class()`, `mode()` y `typeof()`

Para preguntar qué tipo es.

`mode` y `typeof` devuelven los tipos más básicos.

`class` suele devolver (si existe la clase) la estructura del dato.


## Logical

    v <- TRUE 
    print(class(v))
    #> [1] "logical"
    is.logical(v) 
    #> [1] TRUE
    c(TRUE, TRUE, FALSE, NA)
    #> [1]  TRUE  TRUE FALSE    NA
    20/5 == 4
    #> [1] TRUE
    1:10 %% 3 == 0 #: para generar una secuencia, %% es el operador módulo (hagan ?: y ?%%)
    #>  [1] FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE


## Integer

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


## Double

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

1.  <span class="underline">Listas</span>
    -   Pueden a su vez contener listas (vectores recursivos)
    -   *data.frames* son caso especial cuando los vectores que la componen son de igual longitud

Las propiedades más importantes de los vectores son que <span class="underline">tipo</span> de vector es -*typeof()*-, que
<span class="underline">longitud</span> tiene -*length()*- y cuales <span class="underline">atributos</span> tiene asociados. Los atributos son metadatos
arbitrarios que se pueden asociar a cualquier objeto R. Se determinan y consultan con *attr()* y *attributes()*.

<div class="NOTES">
La principal diferencia entre los vectores atómicos y las listas es que los primeros son homogéneos,
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
atributo permite expandir los vectores atómicos a *arrays* multidimensionales (del estilo de los tensores), cuyo caso
especial 2d son las matrices. *dim()* generaliza también el papel de *length()* al caso de arrays,
mientras que *nrow()* y *ncol()* lo hacen para el caso especial de matrices ().


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


# Práctica 5

Descargar [práctica 5](../assets/R2019-practice-5-1m9vsub858.pdf).

