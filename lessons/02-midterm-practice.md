--- 
layout: default 
title: Práctica para segundo parcial
--- 


# Práctica para segundo parcial

Les he preparado varios puntos para que practiquen los distintos temas que hemos visto. Esta práctica **no** significa que el parcial será necesariamente  muy similar a lo presentado aquí. *Iré agregando ejercicios durante los próximos días.*


## Flujo de programas


### Operadores lógicos

1.  Qué pasa si tengo `x <- c(10, NA, NA, 10)` y ejecuto `x==NA`? Cómo tengo que hacer para tener un
    vector de lógicos que identifiquen correctamente los `NA`'s de un vector?
2.  Construir un vector de 10 números aleatórios entre 0 y 100. Construir una expresión lógica que evalue si los elementos del
    vector son mayores que 1 y menores que 10. Usar `&` y usar `&&`. Cuál es la diferencia? Cuál está
    vectorizado? Qué pasa (cuál es la diferencia) si usamos uno u otro dentro de un `if()`?
3.  Armar un vector de 9997 elementos distintos de `NA` y 3 elementos `NA`, pero estos últimos en posiciones del vector al
    azar (Tip: `floor()` + `runif()` + constante multiplicativa adecuada + `as.integer()` para forzar a entero). Construir una expresión lógica para saber en que posiciones están esos tres elememtos, es decir, cuales son los índices de los elementos del vector donde se encuentran los `NA`'s.


### Ejecución condicional

1.  Escribir una función que toma un número como argumento. Si el número es divisible por 3,
    devuelve la cadena (el *string*) "por tres". Si es divisible por cinco, devuelve "por cinco". Si es divisible
    por ambos, devuelve "por tres y por cinco". Si no, devuelve el número. Tip: intenten tener el código
    funcionando antes de meterlo dentro de la función.
2.  La función `library(x)` carga el paquete `x` en la sesión. Si el paquete `x` no está, se puede instalar
    con la función `install.packages()`. La función `installed.packages()` (notar el 'ed' final) devuelve una matriz con los
    paquetes ya instalados. Construir una función (llamada por ejemplo `library2`) para cargar un paquete en la sesión, tal que si el paquete no está,
    se instale y se cargue.


### Loops

1.  Construir con loops una matriz tal que sus elementos sean la suma del número de fila y del número de columna.
2.  Hacer una matriz de `1000 x 1000` de `1`'s y transformar con loops el triángulo inferior en `0`'s.
3.  Un *array* es la estructura de datos que extiende el número de columnas a `d>1` (con los que puedo hacer matrices y, en general, tensores). Un uso posible puede ser el de guardar datos de temperatura de una región parcelada durante un tiempo, por ejemplo una zona dividida en cuadrados de 24 x 24 durante los 12 meses de 6 años (como el caso de `data(nasa)`, subelemento `$temperature`). Construir un array de números artificiales entre -4 y 37 (pueden modificar el truco de la pregunta 2 de ""Operadores Lógicos"") de dimensión `24 x 24 x 12 x 6`.


## Vectorización

1.  Escribir, usando vectorización, una función para calcular el coseno del ángulo que forman dos vectores `x` e `y` cualquiera.
2.  Generar datos artificiales para comparar tiempos de ejecución de `mean()` con `rowMeans()`, `length()` con `ncol()`, y `sum()` con
    `rowSums()`. Tip: usar `system.time()`.


## Estadística y Matemática

1.  Construir un vector que contenga los resultados del proceso de tirar 100 veces un dado (no cargado). Tip: hay varias funciones auxiliares para pasar de un valor *double* a un *integer*: `floor()`, `ceiling()`, `round()` , pueden ver la diferencia entre ellas usando el *help* de cada función.
2.  Construir un conjunto artificial de `N = 43.85` millones de alturas de personas ("población") de
    *mean* = 174.46 cm y *sd* = 7.5. Obtener una "muestra" aleatoria de `M = 1000`. Comparar el
    promedio de la "muestra " *mean\_M* con el promedio de la "población" *mean\_N* (y con el valor teórico
    *mean* determinado por ustedes en un principio). Calcular el error estándar del promedio de la
    muestra (*sem/=/sd\_M//sqrt(M)). Confirmar que /mean\_M* - *sem* < *mean\_N* < *mean\_M* + *sem*.
3.  Usar `integrate()` para dibujar la [función error](https://en.wikipedia.org/wiki/Error_function) entre -3 y 3. Tip: usar `seq(, by=)` y `sapply()`.


## Familia `*apply` y `purrr`

1.  La función `apply`: aplica su función a matrices de dimensión `N x 1` (donde `N` es el número de filas) o a
    vectores de tamaño `N`?
2.  Construir una matriz de 1000 filas por 3 columnas de números aleatorios tomados de una normal con
    media 0 y desviación estándar 1. Cuántos números negativos hay en cada columna?
3.  Construir una matriz como la anterior, pero cuadrada de lado `N = 10^4`. Calcular el tiempo que se
    demora en hacer la suma y promedio de las columnas por un lado, y de las filas por otro (usar
    `system.time()`). Comparar con el tiempo que demora usando `rowSums()` y `colSums()`. Cuál es la tasa (o sea, la razón)
    de los dos tiempos?
4.  Dada la siguiente lista de fórmulas:
    
        formulas <- list(
        	mpg ~ disp,
        	mpg ~ I(1 / disp),
        	mpg ~ disp + wt,
        	mpg ~ I(1 / disp) + wt
        )
    
    Con una línea de código, implementar regresion lineal en `mtcars` con todas las fórmulas a la vez. Hacer lo mismo usando `purrr`.
5.  

