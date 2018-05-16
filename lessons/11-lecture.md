--- 
layout: default 
title: Clase 11
--- 


# Repaso de la clase anterior


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


## Cálculo

1.  R tiene capacidades tanto para hacer cálculos numéricos como analíticos:
2.  Existen paquetes para ecuaciones diferenciales (`odesolve`), y para

extender la capacidad simbólica usando el sistema Yacas
(`ryacas`). Ver CRAN.


## Álgebra Lineal

1.  Multiplicación de matrices - operador %\*%
2.  Sistema de ecuaciones lineales (o invertir una matriz) con `solve()`
3.  Autovectores y autovalores - `eigen()`
4.  Otras operaciones posibles `t()`, `svd()`, etc.


## Otros paquetes de interés

-   [Numerical Mathematics](https://cran.r-project.org/web/views/NumericalMathematics.html)
-   [Ecuaciones diferenciales](https://cran.r-project.org/web/views/DifferentialEquations.html)
    -   tienen también el libro "2012 - Book - Solving Differential Equations in R.pdf" en #bibliografia @slack
-   [Series temporales](https://cran.r-project.org/web/views/TimeSeries.html)
-   [Optimización y programación matemática](https://cran.r-project.org/web/views/Optimization.html)
-   Aritmética de precisión múltiple con [gmp](https://cran.r-project.org/web/packages/gmp/index.html)
-   Paquete [gsl](https://cran.r-project.org/web/packages/gsl/index.html), una interface a la Biblioteca Científica GNU
-   Mil cosas más :)


# Estadística


## Estadística descriptiva

Una manera de hacer estadística descriptiva es con `sapply`:

    sapply(mydata, mean, na.rm=TRUE) 

(podemos usar `mean`, `sd`, `var`, `min`, `max`, `median`, `range`, y `quantile`). O `summary()`.

Tenemos también `group_by() + summarise()` con las mismas funciones básicas.


## Distribuciones

En general R usa la siguiente convención:

-   `dDIST(x, ...)` es la función distribución de probabilidad (PDF). Devuelve la prob. de observar un
    valor x
-   `pDIST(x, ...)` es la función cumulativa de probabilidad (CDF). Devuelve la prob. de obervar un
    valor menor a x (mayor si usamos lower.tail=F)
-   `rDIST(n, ...)` es un generador de números aleatorios que devuelve n valores sacados de una distr. DIST.
-   `qDIST(p, ...)` es la función cuartil que devielve el x que corresponde al percentil p de DIST. Si
    lower.tail=F, devuelve 1 - el percentil p.

<img style="WIDTH:1200px; HEIGHT:200px; border:0" src="./figs/dists.png">

Para ver las distribuciones disponibles, ver el [task view de distribuciones](https://cran.r-project.org/web/views/Distributions.html)


### Distribución Normal

Construyo una figura de la función normal usando un vector entre -5 y 5 con 100 puntos.

    library(ggplot2)
    set.seed(8888) ## elijo la semilla para poder "controlar" la aleatoridad
    x <- seq(from=-5, to=5, length.out=100) # el intervalo [-5 5]
    f <- dnorm(x) # normal con media 0 y sd 1 
    ggplot(data.frame(col1=x, col2=f), aes(x=col1, y=col2)) + geom_line()


### Otras distribuciones

Construyo un vector de 10^5 puntos que contenga valores estocásticos extraidos de una dist. Binomial
de `n=5` (número de intentos) y `p=0.5` (probabilidad de éxito).

    x <- rbinom(100000,5,0.5)
    mean(x)
    # [1] 2.5004
    
    mean(x >= 4)
    # [1] 0.18829


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
    dtest  <- subset(psub, ORIGRANDGROUP < 500)
    model  <- lm(log(PINCP,base=10) ~ AGEP + SEX + COW + SCHL, data=dtrain) 
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

Los modelos lineales asumen que el valor predicho es continuo y que los errores van a ser
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


# Práctica 11 bis

1.  Generar un conjunto de 10^3 números aleatorios sacados de una distribución lognormal con promedio
    5 y variación estándar 1. Hacer su histograma con ggplot2 y compararlo con la lognormal con
    parámetros (5,1) en la misma figura. Generar otras 10^6 números y agregar su histograma a la
    figura (o sea, que queden dos histogramas y una curva). Usar el argumento *alpha* para poder
    distinguir los histogramas.


## Práctica 11 bis

1.  i)  Bajarse el Quijote de ["Project Gutenberg"](http://www.gutenberg.org) en formato texto.
    
    ii) Meter el libro en un vector de tipo "character", una palabra en cada elemento del
    vector. Tip: `stringr::str_split()`. Cuántas palabras hay en total? Cuántas únicas?
    
    iii) Cuántas veces aparece cada palabra? Tip: `dplyr` + nombrar las columnas + `n()` o
    `tally()`. Cuál es la 1era palabra del ranking? Cuanto aparece "Quijote" y en que ranking?
    
    iv) Hacer un plot del ranking vs. su frecuencia. Qué llama la atención? Tip: ambos ejes logarítmicos.
    
    v) CERRQué función de distribución describiría bien lo que encontramos? Puede ser una normal? Probar
    distintas distribuciones (con `dDIST()`) para aproximar los datos. Tip: poner "quijote
    distribution" en Google Scholar. Qué parámetro que controla la distribución es importante y
    cuando vale (intentar calcularlo con R)?


## Práctica 11 tris

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

