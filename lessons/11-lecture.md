--- 
layout: default 
title: Clase 11
--- 


# Repaso de la clase anterior


## modo interactivo vs. source() y R CMD BATCH

    ##En un editor de texto creamos el script z.R
    pdf("xh.pdf")  # configuramos un archivo de salido
    hist(rnorm(100))  # generamos 100 números aleatorios de N(0,1) y hacemos un histograma
    dev.off()  # cerramos el archivo de salida
    
    ## En el terminal:
    R CMD BATCH z.R
    
    ## En R:
    source("z.R")

-   Acordarse que para imprimir en pantalla desde un script, tienen que usar print().


## Workflow científico

-   trabajar con scripts permite 'mantener' nuestro proceso científico
    -   el trabajo pasa a ser gradual, mejorando a cada vez
-   modularizar nuestros procesos! Scripts de scripts
    -   nos da flexibilidad y claridad
    -   permite separar 'físicamente' procesos computacionales diferentes
    -   permite reciclar código!

Ejemplo: hago freaking\_good\_data\_analysis.R, que contiene:

    source("0-input-data.R")
    source("1-clean-data.R")
    source("2-parse-data.R")
    source("3-graph-data.R")


## R project y CRAN

[The R Project for Statistical Computing](https://www.r-project.org/)

[The Comprehensive R Archive Network](https://cran.r-project.org/)

-   El proyecto R mantiene el código, [la documentación](https://cran.r-project.org/manuals.html), y la comunidad, entre otras cosas
-   CRAN es una red de servers web y ftp mundial que guarda versiones y documentación actualizadas e
    idénticas de R. De acá se baja R y los [paquetes aceptados oficialmente](https://cran.r-project.org/web/packages/available_packages_by_date.html)
-   CRAN tiene [Task Views](https://cran.r-project.org/web/views/), páginas web que nuclean paquetes por temas


## Estadística descriptiva

Una manera de hacer estadística descriptiva es con sapply:

    sapply(mydata, mean, na.rm=TRUE) 

(podemos usar mean, sd, var, min, max, median, range, y quantile). O summary().

Tenemos también group\_by() + summarise() con las mismas funciones básicas.


## Distribuciones

En general R usa la siguiente convención:

-   dDIST(x, &#x2026;) es la función distribución de probabilidad (PDF). Devuelve la prob. de observar un
    valor x
-   pDIST(x, &#x2026;) es la función cumulativa de probabilidad (CDF). Devuelve la prob. de obervar un
    valor menor a x (mayor si usamos lower.tail=F)
-   rDIST(n, &#x2026;) es un generador de números aleatorios que devuelve n valores sacados de una distr. DIST.
-   qDIST(p, &#x2026;) es la función cuartil que devielve el x que corresponde al percentil p de DIST. Si
    lower.tail=F, devuelve 1 - el percentil p.

<img style="WIDTH:1200px; HEIGHT:200px; border:0" src="./figs/dists.png">

Para ver las distribuciones disponibles, ver el [task view de distribuciones](https://cran.r-project.org/web/views/Distributions.html)


# Modelado estadístico

Modelado se refiere a proponer determinadas relaciones entre variables, típicamente cuál es la
relación entre una variable dependiente o *variable respuesta* y otras variables independientes o
*variables explicativas*. 

En R la función lm() se usa para regresión lineal (*linear models*) y glm() para *generalized linear models*.


### Regresión lineal (lm)

Construimos un "modelo" (una relación) entre variables dependientes e independientes optimizando
parámetros para poder predecir.

1.  Propongo una determinada relación de variables
2.  Calculo coeficientes del modelo
3.  Compruebo que tan bien se ajusta el modelo a nuevas observaciones

    y[i] ~ f(x[i,]) = b[1] x[i,1] + ... b[n] x[i,n]
    ## b[i] son los coeficientes o betas


### Ejemplo con datos de 2011 US Census PUMS

Bajar los datos de [acá](https://github.com/WinVector/zmPDSwR/raw/master/PUMS/psub.RData).

    ## hacemos la regresión:
    load("psub.RData")
    dtrain <- subset(psub, ORIGRANDGROUP >= 500)
    dtest <- subset(psub, ORIGRANDGROUP < 500)
    model <- lm(log(PINCP,base=10) ~ AGEP + SEX + COW + SCHL, data=dtrain) 
    dtest$predLogPINCP <- predict(model,newdata=dtest) 
    
    ## resultados:
    summary(model)
    
    ## graficamos:
    library(ggplot2)
    ggplot(data=dtest,aes(x=predLogPINCP,y=log(PINCP,base=10))) + geom_point(alpha=0.2,color="black") + 
    geom_smooth(aes(x=predLogPINCP, y=log(PINCP,base=10)),color="black") +
    geom_line(aes(x=log(PINCP,base=10), y=log(PINCP,base=10)),color="blue",linetype=2) +
    scale_x_continuous(limits=c(4,5)) +
    scale_y_continuous(limits=c(3.5,5.5))
    
    ## residuos:
    ggplot(data=dtest,aes(x=predLogPINCP, y=predLogPINCP-log(PINCP,base=10))) +
    geom_point(alpha=0.2,color="black") +
    geom_smooth(aes(x=predLogPINCP, y=predLogPINCP-log(PINCP,base=10)), color="black")


### Regresión lineal generalizada (glm)

Los modelos lienales asumen que el valor predicho es continuo y que los errores van a ser
"normales". Los modelos lineales generalizados relajan estas suposiciones. 

    ## expresión general
    glm(formula, family=familytype(link=linkfunction), data=)

Ejemplito: Regresión logística, para variables categóricas.

    # F es un factor binario
    # x1, x2 y x3 son predictores continuos 
    fit <- glm(F~x1+x2+x3,data=mydata,family=binomial())
    summary(fit) # resultados
    exp(coef(fit)) # coeficientes
    predict(fit, type="response") # predicciones
    residuals(fit, type="deviance") # residuos 


# Estadística avanzada - material infinito

-   [Paquete stats](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/00Index.html)
-   [CRAN view de distribuciones](https://cran.r-project.org/web/views/Distributions.html)
-   [Modern Applied Statistics with S. Fourth Edition](https://www.stats.ox.ac.uk/pub/MASS4/) - [(MASS book)](https://cran.r-project.org/web/packages/MASS/index.html)
-   [The elements of statistical learning](http://statweb.stanford.edu/~tibs/ElemStatLearn/) - [(ElemStatLearn book)](https://cran.r-project.org/web/packages/ElemStatLearn/index.html)


# Matemáticas


## Funciones matemáticas básicas

    - exp(): Exponential function, base e
    - log(): Natural logarithm
    - log10(): Logarithm base 10
    - sqrt(): Square root
    - abs(): Absolute value
    - sin(), cos(), and so on: Trig functions
    - min() and max(): Minimum value and maximum value within a vector
    - which.min() and which.max(): Index of the minimal element and maximal element of a vector
    - pmin() and pmax(): Element-wise minima and maxima of several vectors
    - sum() and prod(): Sum and product of the elements of a vector
    - cumsum() and cumprod(): Cumulative sum and product of the elements of a vector
    - round(), floor(), and ceiling(): Round to the closest integer, to the clos- est integer below, and to the closest integer above
    - factorial(): Factorial function

    > x <- c(12,5,13)
    > cumsum(x)
    [1] 12 17 30
    > cumprod(x)
    [1] 12 60 780


## Cálculo

R tiene capacidades simples de hacer cuentas analíticas:

    D(expression(exp(x^2)),"x")  # derivative
    exp(x^2) * (2 * x)
    > integrate(function(x) x^2,0,1)
    0.3333333 with absolute error < 3.7e-15


## Algebra Lineal


### multiplicación de matrices

Directamente con el operador %\*%

    >a
        [,1] [,2]
    [1,]   1    2 
    [2,]   3    4 
    >b
         [,1] [,2]
    [1,]    1   -1
    [2,]    0    1
    > a %*% b
         [,1] [,2]
    [1,]    1    1
    [2,]    3    1


### Sistema de ecuaciones lineales (o invertir una matriz)

    > a <- matrix(c(1,1,-1,1),nrow=2,ncol=2)
    > b <- c(2,4)
    > solve(a,b)
    [1] 3 1
    > solve(a) ## sin el segundo argumento, invierte la matriz
      [,1] [,2]
    [1,]  0.5  0.5
    [2,] -0.5  0.5


### Autovectores y autovalores

    > a
         [,1] [,2]
    [1,]    1   -1
    [2,]    1    1
    > e <- eigen(a)
    $values
    [1] 1+1i 1-1i
    
    $vectors
    		     [,1]                 [,2]
    [1,] 0.7071068+0.0000000i 0.7071068+0.0000000i
    [2,] 0.0000000-0.7071068i 0.0000000+0.7071068i
    > eigenvector1 <- e$vectors[,1]
    > eigenvalue1 <-  e$values[1]
    > a %*% eigenvector1 / eigenvalue1
    		     [,1]
    [1,] 0.7071068+0.0000000i
    [2,] 0.0000000-0.7071068i
    > 


### Otras operaciones posibles son:

    - t(): Matrix transpose
    - qr(): QR decomposition
    - chol(): Cholesky decomposition
    - det(): Determinant
    - eigen(): Eigenvalues/eigenvectors
    - diag(): Extracts the diagonal of a square matrix
    - svd(A): Single value decomposition of A
    - ...


## Otros paquetes de interés

-   [Numerical Mathematics](https://cran.r-project.org/web/views/NumericalMathematics.html)
-   [Ecuaciones diferenciales](https://cran.r-project.org/web/views/DifferentialEquations.html)
    -   tienen también el libro "2012 - Book - Solving Differential Equations in R.pdf" en #bibliografia @slack
-   [Series temporales](https://cran.r-project.org/web/views/TimeSeries.html)
-   [Optimización y programación matemática](https://cran.r-project.org/web/views/Optimization.html)
-   Aritmética de precisión múltiple con [gmp](https://cran.r-project.org/web/packages/gmp/index.html)
-   Paquete [gsl](https://cran.r-project.org/web/packages/gsl/index.html), una interface a la Biblioteca Científica GNU
-   Mil cosas más :D


# Práctica 11

1.  En los datos de diamantes, hacer una regresión lineal de la variable logaritmo del precio como
    función del logaritmo del peso (carat). Sacar los coeficientes y usarlos para graficar el modelo (con
    una línea) sobre el scatterplot (usar geom\_hex() para este último). Luego graficar los residuos
    en otro gráfico.
2.  Si tengo dos vectores a y b del mismo largo, que obtengo al hacer sum(a \* b)? Y sqrt(sum(a \* a))?
3.  En un dia de sol, hay dos mesas en un jardín inglés. En cada mesa hay algunos pájaros,
    tranquis. Uno de la primer mesa les dice a los de la segunda: "si se viene uno de uds. acá,
    entonces vamos a ser la misma cantidad en las dos mesas". "Si", le responden, "pero si se viene
    uno de uds. para acá, vamos a ser el doble acá que la de ustedes". Escriban unas ecuaciones para
    resolver en R y saber cuántos pájaros había en cada mesa. (Tomado de "Linear algebra in R", Søren Højsgaard
    15 de Febrero de 2005.)

