--- 
layout: default 
title: Clase 7
--- 


# Brenda habla de stats


# Repaso de la clase anterior


## 'Types': tipos de datos

-   'logical':    TRUE o FALSE
-   'integer':    naturales: &#x2026;, -1, 0, 1, &#x2026;
-   'double':    irracionales: 3.1415926
-   'character':    alfanuméricos: "pi"
-   'complex':    1+i10
-   'raw':     48 65 6c 6c 6f


## Objetos R: vectores

Existen dos clases de vectores:

1.  <span class="underline">Vectores 'atómicos'</span> (*atomic vectors*), todos los elementos del mismo tipo
    -   puede haber de los 6 tipos: 'logical', 'integer', 'double', 'character', 'complex' y 'raw'
    -   Integer y double son tratados como 'numeric'
    -   No hay escalares en R, si no vectores de longitud 1

2.  <span class="underline">Listas</span>
    -   Pueden a su vez contener listas (vectores recursivos)
    -   data.frames son caso especial cuando los vectores que la componen son de igual longitud

La principal diferencia entre los vectores atómicos y las listas es que los primeros son homogeneos,
o sea todos sus elementos son del mismo tipo, mientras que en las listas no es necesario. 


## Propiedades de los vectores

Las propiedades más importantes de los vectores son:

1.  que *tipo* de vector es -typeof()-
2.  que *longitud* tiene -length()-
3.  cuales *atributos* tiene asociados.

Los atributos son metadata arbitraria que se puede asociar a cualquier objeto R. Se determinan y
consultan con *attr()* para alguno en particular y con *attributes()* se consultan todos los que el
objeto tenga. Los tres atributos más importantes se obtienen con *names()*, *class()* y *dim()*. 


## Listas

Sus elementos pueden tener cualquier tipo, longitud (dimensión!) o atributos, incluyendo otras
listas o funciones ¯\\\_(ツ)\_/¯

    x <- list(1, 2, 1:100)
    x
    ## [[1]]
    ## [1] 1
    
    ## [[2]]
    ## [1] 2
    
    ## [[3]]
    ##  [1]   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18
    ##  [19]  19  20  21  22  23  24  25  26  27  28  29  30  31  32  33  34  35  36
    ##  [37]  37  38  39  40  41  42  43  44  45  46  47  48  49  50  51  52  53  54
    ##  [55]  55  56  57  58  59  60  61  62  63  64  65  66  67  68  69  70  71  72
    ##  [73]  73  74  75  76  77  78  79  80  81  82  83  84  85  86  87  88  89  90
    ##  [91]  91  92  93  94  95  96  97  98  99 100
    
    str(nasa)
    ## List of 2
    ##  $ mets:List of 7
    ##   ..$ cloudhigh  : num [1:24, 1:24, 1:12, 1:6] 26 20 16 13 7.5 8 14.5 19.5 22.5 21 ...
    ##   ..$ cloudlow   : num [1:24, 1:24, 1:12, 1:6] 7.5 11.5 16.5 20.5 26 30 29.5 26.5 27.5 26 ...
    ##   ..$ cloudmid   : num [1:24, 1:24, 1:12, 1:6] 34.5 32.5 26 14.5 10.5 9.5 11 17.5 18.5 16.5 ...
    ##   ..$ ozone      : num [1:24, 1:24, 1:12, 1:6] 304 304 298 276 274 264 258 252 250 250 ...
    ##   ..$ pressure   : num [1:24, 1:24, 1:12, 1:6] 835 940 960 990 1000 1000 1000 1000 1000 1000 ...
    ##   ..$ surftemp   : num [1:24, 1:24, 1:12, 1:6] 273 280 285 289 292 ...
    ##   ..$ temperature: num [1:24, 1:24, 1:12, 1:6] 272 282 285 291 293 ...
    ##  $ dims:List of 4
    ##   ..$ lat  : num [1:24] 36.2 33.7 31.2 28.7 26.2 ...
    ##   ..$ long : num [1:24] -114 -111 -109 -106 -104 ...
    ##   ..$ month: int [1:12] 1 2 3 4 5 6 7 8 9 10 ...
    ##   ..$ year : int [1:6] 1995 1996 1997 1998 1999 2000
    ##  - attr(*, "class")= chr "tbl_cube"


# Vectores "aumentados"

-   <span class="underline">Data frames</span> (y tibbles) sobre 'lists'
-   <span class="underline">Factores</span>, construidos sobre vectores 'integer'
-   <span class="underline">Dates</span> y <span class="underline">date-times</span>, sobre vectores 'numeric'


## Data frames

Un data frame es una lista de vectores de igual longitud. Su estructura es 2d, con lo cual tiene
cosas en común con listas y con matrices. Se le pueden aplicar names(), colnames() y rownames(). La
longitud del data frame (length()) es la longitud de la lista, por lo tanto igual a ncol().

    df <- data.frame(x = 1:3, y = c("a", "b", "c"))
    str(df)


## Factores

Los factores son vectores no-atómicos 'aumentados' usados para representar variables
categóricas. Estos datos pueden tomar sus valores de un conjunto fijo de elementos. Internamente son
representados por enteros, y tienen un atributo 'levels'.

    x <- factor(c("ab", "cd", "ab"), levels = c("ab", "cd", "ef"))
    typeof(x)
    #> [1] "integer"
    attributes(x)
    #> $levels
    #> [1] "ab" "cd" "ef"
    #> 
    #> $class
    #> [1] "factor"


## Dates y date-times

Lo dejamos para que algún voluntario lo cuente!


# *Subsetting*

'[' es el operador para hacer *subsetting*, se usa poniendo algo el tipo x[a]. Hay distintas
maneras de usarlo.


## Usando vectores de enteros positivos o negativos

Un vector numerico con enteros, todos positivos, todos negativos, o cero.

    x <- c("one", "two", "three", "four", "five")
    x[c(3, 2, 5)]
    #> [1] "three" "two"   "five"
    
    x[c(1, 1, 5, 5, 5, 2)]
    #> [1] "one"  "one"  "five" "five" "five" "two"
    
    x[c(-1, -3, -5)]
    #> [1] "two"  "four"
    
    # caso particular, el cero, devuelve un vector vacio
    x[0]
    ## numeric(0)


## Usando vectores de lógicos

*Subsetting* con un vector lógico devuelve los valores de correspondientes a TRUE. Como *filter*, se
usa frecuentemente en conjunto con expresiones lógicas.

    x <- c(10, 3, NA, 5, 8, 1, NA)
    
    # Todos los valores que no son NA de x
    x[!is.na(x)]
    #> [1] 10  3  5  8  1
    
    # Todos los valores pares (o NAs!) de x
    x[x %% 2 == 0]
    #> [1] 10 NA  8 NA


## Usando vectores de caracteres para devolver elementos con los respectivos nombres

Si tenemos un vector con nombres, podemos hacer algo del tipo:

    x <- c(abc = 1, def = 2, xyz = 5)
    x[c("xyz", "def")]
    #> xyz def 
    #>   5   2
    
    mtcars[, c("mpg", "disp")] 
    ##                      mpg  disp
    ## Mazda RX4           21.0 160.0
    ## Mazda RX4 Wag       21.0 160.0
    ## Datsun 710          22.8 108.0
    ## ...


## No usando nada

La manera más simples de hacer *subsetting* es no usando nada, x[], que devuelve el objeto
original. Si es 2d, podemos dejar nada en una de las dimensiones, por ej. x[1, ] para obtener la
primera fila (con todas sus columnas), o x[, -1] que selecciona todas las filas columnas menos la
primera.

Para el caso de data frames y matrices, al hacer subsetting es posible usar drop = FALSE para
preservar las dimensiones del objeto original. 


## Otros operadores de subsetting: '[[' y '$'

Para listas, necesitamos [[ para acceder al contenido de los elementos de la lista, porque aplicando
[ a una lista siempre devuelve otra lista (más exactamente, una sub-lista). En cambio, [[ saca un
nivel de la jerarquía de la lista y dependiendo de su estructura, puede devolver cualquier elemento
de las lista.

El operador $ es una abreviación para obtener elementos nombrados de una lista. Se usa parecido a [[
solo que no hace falta usar comillas.

Como los data frames son listas de columnas de igual longitud, podemos acceder a sus columnas usando
mtcars[[1] ], mtcars[["cy"] ] o mtcars$cy. Estos dos últimos son equivalentes.

<div class="NOTES">
Más sobre subsetting en los siguientes links:
<http://adv-r.had.co.nz/Subsetting.html>
<http://r4ds.had.co.nz/vectors.html#vector-subsetting>

</div>


## diferencia entre [ y [[ para listas

<img style="WIDTH:500px; HEIGHT:420px; border:0" src="./figs/lists-subsetting.png">


# Práctica 7

1.  Cuál es el resultado de hacer subsetting en un vector usando: i) enteros positivos ii) enteros
    negativos iii) vectores lógicos y iv) vectores de caracteres?

2.  Cuál es la diferencia entre [, [[, y $ cuando aplicados a una lista?

3.  Cuando hay que usar drop = FALSE?

4.  Si x es una matriz, qué hace x[] <- 0? Cuál es la diferencia de hacer x <- 0?


## Práctica 7 bis

Cargar ggplot2, y sobre el data frame 'diamonds' seleccionar diamantes que:

1.  tienen x e y iguales
2.  tienen depth entre 55 y 70
3.  tienen carat menor que la media de carat
4.  cuestan más que $10000 por carat. De que calidad son? Pista: usar table()

