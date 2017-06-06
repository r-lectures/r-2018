--- 
layout: default 
title: Clase 12
--- 


# Repaso de la clase anterior

*Modelado* se refiere a proponer determinadas relaciones entre variables, típicamente cuál es la
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


### Multiplicación de matrices

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


# Práctica 12

1.  Integrar numéricamente la función dlnorm(5, 1) entre 0 y xf, con xf=10^i e i=1:4. Comparar con la
    función acumulada correspondiente evaluada en el límite adecuado.
2.  Cuántos segundos demora R en encontrar los autovalores y autovectores de una matriz aleatoria de
    NxN, donde N=10^i, con i = 1:4? Hacer una figura con ggplot2 y hacer una regresión (con lm o
    loess, lo que sea más adecuado). Confirmar, para el caso i = 1, la identidad A x = lamba x, para el
    caso del autovalor principal.
3.  Resolver el siguiente SEL y comprobar que A x = B.
    
    3x1 + 4x2 + 5x3 = 0,
    
    6x1 + 2x2 + 7x3 = 5,
    
    7x1 +  x2       = 6
4.  Calcular analíticamente la 3era derivada de log(x) \* sin(x) respecto de x.

