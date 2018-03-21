--- 
layout: default 
title: Clase 2
--- 


# r-lectures.slack.com/

<img style="WIDTH:800px; HEIGHT:550px; border:0" src="./figs/slack.png">


## Slack

-   canales (*channels*) (#general, #random, creen los que hagan falta)
-   hilos (*threads*), en los casos en que quieran comentar sin entorpecer la discusión principal
-   mensajes directos - son privados
-   se puede compartir archivos y código (usar el signo "+" abajo a la izq.)

-   => pregúntenle a slackbot: how do I use Slack?


# Repaso de la clase pasada


## Conceptos principales

-   **Paquetes** contienen **funciones**

    library(ggplot2) # cargo el paquete ggplot2 en mi sesión
    install.packages("ggplot2") # instalo el paquete de internet si no lo tengo

-   **Funciones** actuan sobre **datos y variables**

    str(mis_datos) # str() me dice la estructura de mis_datos
    summary(mis_datos) # summary() me los resume
    head(mis_datos) # head() me muestra algunas primeras líneas
    plot(mis_datos$columna1, mis_datos$columna2) # plot() los grafica


## Hicieron la práctica??

1.  Elegir un conjunto de datos *built-in* con datos continuos y categóricos
2.  Explorar sus principales características (media, máxmimo, mínimo, etc)
3.  Graficar las relaciones más importantes
4.  Encontrar la manera de hacer *scatterplots* e histogramas

1.  Agregar información (título, ejes, descripción de los datos)


## Visualización

`base::plot()`

    
    # Define the cars vector with 5 values
    cars <- c(1, 3, 6, 4, 9)
    
    # Graph the cars vector with all defaults
    plot(cars)
    
    # Graph cars using blue points overlayed by a line 
    plot(cars, type="o", col="blue")
    
    # Create a title with a red, bold/italic font
    title(main="Autos", col.main="red", font.main=4)


## Visualización

`base::plot()`

    # Get a random log-normal distribution (=> ?rlnorm)
    r <- rlnorm(1000)
    
    # Get the distribution without plotting it using tighter breaks => ?seq ?hist
    h <- hist(r, plot=F, breaks=c(seq(0,max(r)+1, .1)))
    
    # Plot the distribution using log scale on both axes, and use
    # blue points
    plot(h$counts, log="xy", pch=20, col="blue",
    	main="Log-normal distribution",
    	xlab="Value", ylab="Frequency")


# `ggplot2`


## 

`ggplot2`

-   *grammar of graphics* [(Wilkinson, 2005)](http://vita.had.co.nz/papers/layered-grammar.pdf)
    
    -   se trata de construir capas de código, cada una agregando un concepto a la figura final
    -   cada capa controla un aspecto independiente de la figura
    -   la figura *es* el código (se puede guardar, extender, reproducir, etc.)
    
        p <- ggplot(mtcars)   # creo un objeto ggplot con los datos mtcars
        p <- p + aes(mpg, wt) # le agrego el mapeo de variables que quiero
        p <- p + geom_point() # le agrego como quiero que represente ese mapeo
        p                     # imprimo la figura


## En general:

    ggplot(data = {DATA}) + 
          {GEOM_FUNCTION}(mapping = aes( {MAPPINGS} ))

Cuidado! `ggplot2` trabaja <span class="underline">solo</span> con `data.frames`, al igual que el resto del tidyverse (dplyr, tidyr, etc.)

Más en ggplot2-cheatsheet-2.1.pdf (ver Slack, en el canal de bibliografía)


## Y qué vendría siendo un data.frame?

-   un data.frame es el objeto más común para analizar datos en R
-   es una lista de vectores de igual dimensión
    
        df <- data.frame() # creo un data.frame llamado df
        is.data.frame(df)  # es un data.frame?
        [1] TRUE
        is.list(df)        # es una lista?
        [1] TRUE
-   tiene entonces propiedades de matrices y de listas
-   busquen un data.frame con data() y prueben las funciones `length()` y `nrow()`


## Aesthetics y Geoms

-   aesthetics, aes(), controla mapeos entre variables y elementos visuales
-   ejempo: variable A <-> coordenada x, o variable C <-> forma del punto

    data(economics)
    ?economics
    str(economics)
    ggplot(economics, aes(x = pce)) + geom_histogram()
    ggplot(economics, aes(x = date, y = unemploy)) + geom_line()
    ggplot(economics, aes(x = date, y = unemploy, colour = pce)) + geom_line() # colour, size, shape, etc.


## *Facets* y *scales*

-   *Facets* se usan para dividir la figura en varias, filtrando con alguna variable categórica
-   *scales* permiten modificar el tipo de ejes de la figura

    ggplot(midwest, aes(x = popwhite, y = percadultpoverty, colour = inmetro)) + 
    geom_line() + 
    facet_wrap(~ state) + 
    scale_x_log10()


## Glosario `ggplot2`

-   **`data`**: el *dataframe* que contiene los datos a graficar
-   **`geoms`**: el tipo de objeto geométrico que representa los datos: puntos, líneas, polígonos, etc.
-   **`aesthetics`**: describe las características visuales que representan los datos,  por ejemplo, posición, tamaño, color, forma, etc
-   **`scale`**: para cada *aesthetic*, describe como se mapea la característica visual a valores
    por ejemplo, escala logarítmica, escala de color, de tamaño, de forma, etc.
-   **`stats`**: describe transformaciones estadísticas que resumen los datos, e.g. una regresión


# Práctica

-   Seleccionen de `data()` un data.frame con alguna variable categórica
-   Qué pasa si hacen solo `ggplot(mi_data)`?
-   Qué pasa si intentan mapear color, tamaño o forma a una variable continua?
-   Para que sirve `jitter`? Para que sirve `stroke`?
-   Podemos usar formas condicionales (>, <, etc) en aes()?
-   Cómo difieren `facet_grid` y `facet_wrap`?
-   Usar `box-plot` y `geom_smooth()`. Cuándo conviene usarlas?

