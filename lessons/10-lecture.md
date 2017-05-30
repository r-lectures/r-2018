--- 
layout: default 
title: Clase 10
--- 


# Repaso de la clase anterior


## Vectorización

Se trata de operaciones que aplican a un vector, pero elemento por elemento. 

1.  Los pasos se simplifican al no pensar en los elementos del vector, si no en el vector en sí.
2.  Los bucles en una función vectorizada están hechos en C y no en R, y por lo tanto son mucho más
    rápidos.

    # sin vectorización
    > for (i in 1:length(x)) z[i] <- x[i] + y[i]
    
    # con vectorización
    > z <- x + y

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


# modo interactivo vs. source() y R CMD BATCH

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


# R project y CRAN

[The R Project for Statistical Computing](https://www.r-project.org/)

[The Comprehensive R Archive Network](https://cran.r-project.org/)

-   El proyecto R mantiene el código, [la documentación](https://cran.r-project.org/manuals.html), y la comunidad, entre otras cosas
-   CRAN es una red de servers web y ftp mundial que guarda versiones y documentación actualizadas e
    idénticas de R. De acá se baja R y los [paquetes aceptados oficialmente](https://cran.r-project.org/web/packages/available_packages_by_date.html)
-   CRAN tiene [Task Views](https://cran.r-project.org/web/views/), páginas web que nuclean paquetes por temas


# Estadística


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


### Distribución Normal

Construyo una figura de la función normal usando un vector entre -5 y 5 con 100 puntos.

    library(ggplot2)
    set.seed(8888) ## elijo la semilla para poder "controlar" la aleatoridad
    x <- seq(from=-5, to=5, length.out=100) # el intervalo [-5 5]
    f <- dnorm(x) # normal con media 0 y sd 1 
    ggplot(data.frame(col1=x, col2=f), aes(x=col1, y=col2)) + geom_line()


### Otras distribuciones

Construyo un vector de 10^5 puntos que contenga valores estocásticos extraidos de una dist. Binomial
de n=5 (número de intentos) y p=0.5 (probabilidad de éxito).

    x <- rbinom(100000,5,0.5)
    mean(x)
    # [1] 2.5004
    
    mean(x >= 4)
    # [1] 0.18829


# Práctica 10

1.  Generar un conjunto de 10^3 números aleatorios sacados de una distribución lognormal con promedio
    5 y variación estándar 3. Hacer su histograma con ggplot2 y compararlo con la lognormal con
    pparámetros (5,3) en la misma figura. Generar otras 10^6 números y agregar su histograma a la
    figura (o sea, que queden dos histogramas y una curva). Usar el argumento *alpha* para poder
    distinguir los histogramas.
2.  i)  Bajarse el Quijote de Project Gutenberg en formato "Plain Text UTF-8" (o sea, formato texto o
    ASCII)
    ii) Meter el libro entero en un vector character, o sea, una palabra por en cada elemento del vector. Tip: stringr::str\_split 
    iii) Usar group\_by y summarise para contar cuantas veces aparece cada palabra. Tip: buenos
    nombres para las columnas + función n(). Cuál es la palabra que más aparece? Cuantas veces
    aparece "quijote" y en que posición (o sea, en que ranking)?
    iv) Hacer un plot del ranking de la palabra (es decir, 1, 2, 3, etc) vs la cantidad de veces que
    aparece. Qué se ve? Tip: ambos ejes logarítmicos
    v) Qué función de distribución describiría bien lo que encontramos? Una normal? Probar distintas
    posibilidades (usando la familia dDIST()) sobre los datos para ver si podemos acercarnos. Tip:
    buscar "quijote distribution" en Google Scholar.

