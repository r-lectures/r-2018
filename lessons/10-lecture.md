--- 
layout: default 
title: Clase 10
--- 


# Repaso de la clase anterior


## Vectorización

Se trata de operaciones que aplican a un vector, pero elemento por elemento. 

Los pasos se simplifican al no pensar en los elementos del vector, si no en el vector en sí.
Los bucles en una función vectorizada están hechos en C y no en R, y por lo tanto son mucho más rápidos.

    # sin vectorización
    for (i in 1:length(x)) z[i] <- x[i] + y[i]
    
    # con vectorización
    z <- x + y

-   Ref: [Vectorise from Advanced R](http://adv-r.had.co.nz/Profiling.html#vectorise)


## Funcionales - Familia \*apply()

-   **lapply()**: LLama a una función especificada en cada componente de una lista y devuelve otra lista
-   **sapply()**: En <span class="underline">algunos</span> casos, la lista que devuelve lapply() puede ser simplificada a un vector o
    a una matriz.
-   **apply()**: es para matrices. Tienen la particularidad que podemos elegir aplicar una función a filas o a columnas.
-   **tapply()**: para aplicar funciones a vectores con factores

Combinan algo similar a vectorización con funciones. Suelen ser la respuesta a "cómo hago para
procesar (por ejemplo transformar o extraer información de) cada elemento de este objeto?"

Ref: ver también el [paquete plyr](https://www.rdocumentation.org/packages/plyr/versions/1.8.4), [esta web](http://stat545.com/block013_plyr-ddply.html) y [este paper](http://www.jstatsoft.org/v40/i01/)


# Matemática


## Funciones matemáticas básicas

    - exp(): función exponencial, base e
    - log(): logaritmo natural 
    - log10(): logaritmo base 10
    - sqrt(): raiz cuadrada
    - abs(): valor absoluto
    - sin(), cos(), etc.: funciones trigonométricas
    - min(),  max(): valor mínimo y máximo de un vector
    - which.min() and which.max(): índice del valor mínimo y máximo 
    - pmin() and pmax(): mínimos y máximos para varios vectores, por elemento
    - sum() and prod(): suma y producto de elementos de vectores
    - cumsum() and cumprod(): suma acumulada y producto acumulado de elementos de vectores
    - round(), floor(), and ceiling(): redondeo al entero más próximo, al menor o al mayor, respectivamente
    - factorial(): función factorial
    - %%: operador módulo y %/%: operador división por enteros

    x <- c(12,5,13)
    cumsum(x)
    # [1] 12 17 30
    cumprod(x)
    # [1] 12 60 780


## Cálculo

R tiene capacidades tanto para hacer cálculos numéricos como analíticos:

    D(expression(exp(x^2)),"x")  # derivada analítica
    exp(x^2) * (2 * x)
    integrate(function(x) x^2,0,1) # integral numérica
    0.3333333 with absolute error < 3.7e-15

Existen paquetes para ecuaciones diferenciales (`odesolve`), y para
extender la capacidad simbólica usando el sistema Yacas
(`ryacas`). Ver CRAN.


## Álgebra Lineal


### Multiplicación de matrices

Directamente con el operador %\*%

    a
        [,1] [,2]
    [1,]   1    2 
    [2,]   3    4 
    b
         [,1] [,2]
    [1,]    1   -1
    [2,]    0    1
    a %*% b
         [,1] [,2]
    [1,]    1    1
    [2,]    3    1


### Sistema de ecuaciones lineales (o invertir una matriz) con `solve()`

    a <- matrix(c(1,1,-1,1), nrow=2, ncol=2)
    b <- c(2,4)
    solve(a,b) ## resuelve el sistema de ecuaciones
    [1] 3 1
    solve(a) ## sin el segundo argumento, invierte la matriz
      [,1] [,2]
    [1,]  0.5  0.5
    [2,] -0.5  0.5


### Autovectores y autovalores

    a
         [,1] [,2]
    [1,]    1   -1
    [2,]    1    1
    
    e <- eigen(a)
    $values
    [1] 1+1i 1-1i
    
    $vectors
    		     [,1]                 [,2]
    [1,] 0.7071068+0.0000000i 0.7071068+0.0000000i
    [2,] 0.0000000-0.7071068i 0.0000000+0.7071068i
    
    eigenvector1 <- e$vectors[,1]
    eigenvalue1 <-  e$values[1]
    
    a %*% eigenvector1 / eigenvalue1
    		     [,1]
    [1,] 0.7071068+0.0000000i
    [2,] 0.0000000-0.7071068i


### Otras operaciones posibles son:

    - t(): transpuesta de una matriz
    - qr(): descomposición QR
    - chol(): descompocisión Cholesky
    - det(): Determinante
    - eigen(): Autovalores/autovectores
    - diag(): extrae la diagonal de una matriz cuadrada
    - svd(A): descomposición en valores singulares
    - ...


## Otros paquetes de interés

-   [Numerical Mathematics](https://cran.r-project.org/web/views/NumericalMathematics.html)
-   [Ecuaciones diferenciales](https://cran.r-project.org/web/views/DifferentialEquations.html)
    -   tienen también el libro "2012 - Book - Solving Differential Equations in R.pdf" en #bibliografia @slack
-   [Series temporales](https://cran.r-project.org/web/views/TimeSeries.html)
-   [Optimización y programación matemática](https://cran.r-project.org/web/views/Optimization.html)
-   Aritmética de precisión múltiple con [gmp](https://cran.r-project.org/web/packages/gmp/index.html)
-   Paquete [gsl](https://cran.r-project.org/web/packages/gsl/index.html), una interface a la Biblioteca Científica GNU
-   Mil cosas más :)


# Práctica 10

1.  Integrar numéricamente la función `dlnorm(5, 1)` entre `0` y `xf`, con `xf=10^i` e `i=1,2,3` y `4`. Comparar con la
    función acumulada correspondientemente evaluada en el límite adecuado. Usar `...` para pasar parámetros.
2.  Cuántos segundos demora R en encontrar los autovalores y autovectores de una matriz aleatoria de `NxN`, donde `N=10^i`, con `i = 1:4`? Hacer una figura con `ggplot2` y hacer una regresión (con `geom_smooth`). Confirmar, para el caso `i = 1`, la identidad `A x = lambda x`, para el caso del autovalor principal.
3.  Resolver el siguiente SEL y comprobar que `A x = B`.
    
        3x1 + 4x2 + 5x3 = 0,
        
        6x1 + 2x2 + 7x3 = 5,
        
        7x1 +  x2       = 6
4.  Calcular *analíticamente* la 3era derivada de `log(x) * sin(x)`.


## Práctica 10 bis

1.  Si tengo dos vectores `a` y `b` del mismo largo, que obtengo al hacer `sum(a * b)`? Y `sqrt(sum(a * a)`)?
2.  En un dia de sol, hay dos mesas en un jardín inglés. En cada mesa hay algunos pájaros,
    tranquis. Uno de la primer mesa les dice a los de la segunda: "si se viene uno de uds. acá,
    entonces vamos a ser la misma cantidad en las dos mesas". "Si", le responden, "pero si se viene
    uno de uds. para acá, vamos a ser el doble acá que en la de ustedes". Escriban unas ecuaciones para
    resolver cuántos pájaros había en cada mesa. (*Tomado de "Linear algebra in R", Søren Højsgaard
    15 de Febrero de 2005.*)

