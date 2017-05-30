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

-   Acordarse que para imprimir en pantalla desde un script, tiene que usar print(). Si quieren
    encadenar texto con variables usar paste(). Por ej. print(paste("dos", "mas", "dos `", 4, sep`" "))


### Workflow científico

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
    dtrain$predLogPINCP <- predict(model,newdata=dtrain)
    
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


# Matemática


## Funciones matemáticas básicas


## Algebra Lineal

-   vector/matrix properties
    -   8.4 Linear Algebra Operations on Vectors and Matrices
    -   appendix E Matrix Algebra in R in "R in Action"
-   diagonalization etc.
-   bigalgebra::bigalgebra-package?


## Otros paquetes de interés

-   Ecuaciones diferenciales
    <https://cran.r-project.org/web/views/DifferentialEquations.html>
    -   libro pdf en #bibliografia
-   Series temporales
    <https://cran.r-project.org/web/views/TimeSeries.html>


# Práctica 11

1.  En los datos de diamantes, hacer una regresión lineal de la variable logaritmo de precio como
    función del logaritmo del carat. Sacar los coeficientes y usarlos para graficar el modelo (como
    una línea) sobre el scatterplot (usar geom\_hex() para este último). Luego graficar los residuos
    en otro gráfico.

