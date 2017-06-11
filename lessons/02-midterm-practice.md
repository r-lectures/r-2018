--- 
layout: default 
title: Práctica para segundo parcial
--- 


# Práctica para segundo parcial


## Flujo de programas


### Operadores lógicos

1.  Qué pasa si tengo x <- c(10, NA, NA, 10) y ejecuto x==NA? Cómo tengo que hacer para tener un
    vector de lógicos que me identifique correctamente NA's den un vector?
2.  Construir un vector de 10 números. Construir una expresión lógica que evalue si los elementos del
    vector son mayores que 1 y menores que 10. Usar & y usar &&. Cuál es la diferencia? Cuál está
    vectorizado? Qué pasa si usamos uno u otro dentro de un if()?
3.  Armar un vector de 9997 elementos distintos de NA y tres elementos NA, pero en posiciones al
    azar (Tip: floor() + runif() + constante multiplicativa adecuada + as.integer() para forzar a entero). Construir una expresión lógica para saber en que posiciones están esos tres elememtos.


### Ejecución condicional

1.  Escribir una función que toma un número como argumento. Si el número es divisible por 3,
    devuelve la cadena "por tres". Si es divisible por cinco, devuelve "por cinco". Si es divisible
    por ambos, devuelve "por tres y por cinco". Si no, devuelve el número. Intenten tener el código
    funcionando antes de meterlo dentro de la función.
2.  La función library(x) carga el paquete x en la sesión. Si el paquete x no está, se puede instalar
    con la función install.packages(). La función installed.packages() (notar el &#x2026;ed) devuelve una matriz con los
    paquetes instalados. Construir una función para cargar un paquete en la sesión, tal que si el paquete no está,
    se instale y se cargue.


### Loops

1.  Construir una matriz tal que sus elementos sean la suma del número de fila y del número de
    columna.
2.  Hacer una matriz de 1000 x 1000 de 1's. Transformar el triángulo inferior en 0's.
3.  Construir un array de números artificiales entre -4 y 37 (modificar el truco de la pregunta 3 de
    operadores lógicos) de dimensión 24 x 24 x 12 x 6. Este array podría simular datos de temperatura de una región parcelada en 24 x 24 durante los 12 meses de 6 años (como en data(nasa), subelemento $temperature).


## Vectorización

1.  Escribir una función para calcular el coseno del ángulo que forman dos vectores x e y cualquiera.
2.  Generar datos artificiales para comparar tiempos de ejecución de mean() con rowMeans(), length() con ncol(), y sum() con
    rowSums(). Tip: usar system.time()


## Familia \*apply

1.  La función apply: aplica su función a matrices de dimensión n x 1 (donde n es el número de filas) o a
    vectores de tamaño n?
2.  Construir una matriz de 1000 filas por 3 columnas de números aleatorios tomados de una normal con
    media 0 y desviación estándar 1. Cuántos números negativos hay en cada columna?
3.  Construir una matriz como la anterior, pero cuadrada de lado n = 10^4. Calcular el tiempo que se
    demora en hacer la suma y promedio de las columnas por un lado, y de las filas por otro (usar
    system.time()). Comparar con el tiempo que demora usando rowSums() y colSums(). Cuál es la tasa
    de los dos tiempos?
4.  Dada la siguiente lista de fórmulas:
    
    formulas <- list(
    mpg ~ disp,
    mpg ~ I(1 / disp),
    mpg ~ disp + wt,
    mpg ~ I(1 / disp) + wt
    )
    
    Con una línea de código, implementar regresion lineal en mtcars con todas las fórmulas a la vez.


## Estadística

1.  Construir un vector que contenga los resultados del proceso de tirar 100 veces un dado (no
    cargado).
2.  Construir un conjunto artificial de 43.42 millones de alturas de personas ("población") de mu =
    174.46 cm y sigma = 7.5. Obtener una "muestra" aleatoria de N = 1000. Comparar el promedio de la
    "muestra " con el promedio de la "población" (y con el valor teórico mu determinado por ustedes
    en un principio). Calcular el error de los dos promedios: está dentro de lo esperado, que sería
    del orden de mu/N?


## Matemática

1.  Usar integrate() para dibujar la [función error](https://en.wikipedia.org/wiki/Error_function) entre -3 y 3. Tip: usar seq(, by=) y sapply().

