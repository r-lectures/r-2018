--- 
layout: default 
title: Clase 8
--- 


# Repaso de la clase anterior


## Vectores "aumentados"

-   <span class="underline">Data frames</span> (y tibbles) sobre 'lists'
-   <span class="underline">Factores</span>, construidos sobre vectores 'integer'
-   <span class="underline">Dates</span> y <span class="underline">date-times</span>, sobre vectores 'numeric'


## *Subsetting*

'[' es el operador para hacer *subsetting*, se usa poniendo algo del tipo x[a]. Hay distintas
maneras de usarlo:

1.  Usando vectores de enteros positivos o negativos
2.  Usando vectores de lógicos
3.  Usando vectores de caracteres para devolver elementos con los respectivos nombres
4.  No usando nada

Otros operadores de subsetting: '[[' y '$'


## Indexado de listas: '[[' vs. '['

<img style="border:0" src="./figs/pepper.png">

crédito - Hadley Wickham: <http://t.co/YQ6axb2w7t>


# R notebooks en RStudio

En RStudio se pueden crear [cuadernos](https://rmarkdown.rstudio.com/r_notebooks.html) o *notebooks*, una mezcla de texto, código y figuras. Pueden
crear uno con la siguiente combinación:

`Menú -> File -> New File -> R Notebook`

Los cuadernos se escriben en [Markdown](http://rmarkdown.rstudio.com), un lenguaje sencillo formateable,
y además se pueden exportar a distintos formatos: html, pdf, latex, word, etc.  Pueden ver este [demo](https://www.rstudio.com/resources/webinars/introducing-notebooks-with-r-markdown/).

El código se pone en los llamados *chunks*. Estos se pueden ejecutar y se puede mostrar el
resultado (todo esto es configurable), por ejemplo figuras. Los cuadernos aceptan *chunks* de otros
lenguajes aparte de R (bash, python, SQL, etc.).


# Control de Flujo


## Operadores lógicos

Son operadores que permiten comparar dos enunciados y evaluan a un resultado lógico

-   `>` , `>=`
-   `<` , `<=`
-   `!=` , `==`

Más los operadores && (AND) y || (OR) para elaborar enunciados más complejos

    10 == 10
    [1] TRUE
    
    x <- 10
    x == 10
    [1] TRUE
    
    y <- NA
    is.na(y)
    [1] TRUE
    
    ## podemos combinar expresiones condicionales con || y && 
    is.na(y) && x==10
    [1] TRUE


## Ejecución condicional

    if (condición) {
      # código que se ejecuta cuando la condición evalua a TRUE
    } else {
      # código que se ejecuta cuando la condición evalua a FALSE
    }

    if (this) {
      # do that
    } else if (that) {
      # do something else
    } else {
      # 
    }


### Ejemplo

    pretty_length <- function(x) {
    l <- length(x)
    if(is.null(x)) 
       print("el vector tiene cero elementos")
       else 
       print(paste("el vector tiene longitud", l, sep = " "))
    }
    
    y <- NULL
    pretty_length(y)
    [1] "el vector tiene cero elementos"
    
    x <- rep("relleno", 5)
    pretty_length(x)
    [1] "el vector tiene longitud 5"


### Funciones lógicas accesorias

-   `any()`         # devuelve `TRUE` si alguno `TRUE`
-   `all()`         # devuelve `FALSE` si alguno `FALSE`
-   `is.na()`, `is.null()` y el resto de la familia `is./algo/()`
-   `%in%`          # está `x` en este vector?\`
-   `which()`       # devuelve posiciones de elementos `TRUE`
-   `identical()`   # por ej., numeric vs. integer
-   muchas otras

    "relleno" %in% x 
    [1] TRUE
    
    which( 5 > c(3, 4, 5, 6))
    [1] 1 2
    
    identical(0L, 0)
    [1] FALSE


## Loops

Loops son bucles y se usan para repetir código.

    for (variable dentro de /secuencia/){
    # - código que se repite tantas veces como el largo de la secuencia
    # - la variable va cambiando en cada pasada
    }


### Ejemplo

    df <- tibble(
      a = rnorm(10),
      b = rnorm(10),
      c = rnorm(10),
      d = rnorm(10)
    )
    
    output <- vector("double", ncol(df))  
    for (i in seq_along(df)) {            # seq_along(df) es parecida a 1:length(df)
      output[[i]] <- median(df[[i]])      
    }
    output
    # [1] -0.2458 -0.2873 -0.0567  0.1443


### Componentes de un for

-   <span class="underline">Output</span>: siempre es buena idea crear el objeto antes de calcularlo
-   <span class="underline">Secuencia</span>: variable sobre la que funciona el bucle

    for (x in xs)
    for(i in seq_along(df))
    for (nm in names(xs))

-   <span class="underline">Cuerpo</span>: código que se ejecuta las veces que la secuencia indique


### Con secuencia condicional

Útil en el caso en donde no hay un número fijo de 'vueltas'.

    while (condición) {
      # cuerpo
    }


# Práctica 8

1.  Cuál es la diferencia entre `if` y `ifelse`? Ver manual, mostrar ejemplos.
2.  Escribir una función que diga "Buenos días", "Buenas tardes" o "Buenas noches" dependiendo de la
    hora del día usando `lubridate::now()` y `lubridate::dhours()`.
3.  Escribir un loop para calcular la media de cada columna en mtcars (puede ser un doble loop).
4.  Qué pasa si usamos (`nm in names(x)`) y `x` no tiene nombres? Qué pasa si solo algunos tienen nombre
    o hay nombres repetidos? Hacer tests.
5.  Crear un vector tal que sus elementos indiquen, para cada columna de un dataframe cualquiera, si
    son una columna de factor o no.

