

# Presentaciones

Profe Luis G. Moyano

lgmoyano@gmail.com

@luisgmoyano

Profe Carolina Gandini


# 

r-lectures.github.io


# Qué es R?

<img style="position:absolute; TOP:-150px; LEFT:-100px; WIDTH:200px; HEIGHT:200px; border:0" src="./figs/r_logo.png">

-   Software estadístico para GNU
-   Manipulación de datos, cálculo y gráficos
-   Implementación de S
-   Abierto, extensible y colaborativo


## Qué vamos a aprender en esta materia

-   R cómo herramienta científica
-   Foco en **datos**
-   Horizontal para todas las carreras
-   Autonomía


## Qué no vamos a aprender en esta materia

-   No vamos a hacer énfasis en la lógica de programación
-   No vamos a ver algoritmos en profundidad
-   No vamos a cubrir R en su totalidad


## R en la programación y el análisis de datos

-   Adoptado ampliamente en estadística, biología y ciencias de la computación
-   R vs. Python y otros
    
    <div class="NOTES">
    Existen infinitas discusiones sobre que lenguaje es mejor que el otro. Ver esta respuesta bastante
    razonable en [Quora sobre R vs. Python](https://www.quora.com/Which-is-better-for-data-analysis-R-or-Python).
    
    </div>
-   *Scripting* vs. *Interactive*
    -   Workflow científico


## Ventajas de R

-   Exploración
    
    <div class="NOTES">
    -   Liviano
    -   Interpretado, no compilado
    
    </div>
-   Flexibilidad
    
    <div class="NOTES">
    -   R puede ser interactivo o puede ser secuencial (via scripts)
    
    </div>
-   Comunidad
    
    <div class="NOTES">
    -   paquetes!
    
    </div>


## Desventajas de R

-   Memoria
    
    <div class="NOTES">
    R carga todo en RAM (pero hay trucos)
    
    </div>
-   Velocidad (pero están [Rcpp](http://www.rcpp.org/) y [Rfortran](http://www.rfortran.org/))
-   Nivel de adopción heterogéneo
    
    <div class="NOTES">
    No todas las áreas científicas tiene el mismo nivel de adopción y por lo tanto hay muchas cosas ya
    disponibles para ciertas áreas y menos para otras. Esto está cambiando a pasos agigantados,
    mientras R se bate a duelo con Python.
    
    </div>


## Prepárense para frustrarse

<img style="position:absolute; TOP:250px; LEFT:600px; WIDTH:360px; HEIGHT:300px; border:0" src="./figs/frustration.png">

-   R es idiosincrático
-   Frustrarse es típico y <span class="underline">temporal</span>
-   Persisitencia!


# Organización de la materia


### Horarios

-   Lunes y Miércoles de 15 a 18
-   ~ 1 hora de teoría
-   resto de práctica/consulta
-   presentaciones de alumnos de "paquetes"


### Guías de ejercicios

-   Parte principal del curso
-   Aproximadamente uno por semana
-   Haremos hincapié en desarrollar "reproducible research"
    -   informe + código + datos


### Parciales

-   Dos parciales, en la 5ta y 10ma semana aprox.
-   Tendrán toda la información disponible durante el parcial
-   Estarán fuertemente basados en las guías prácticas


### Proyecto final

-   Informe escrito y presentación oral
-   Cada uno buscará tema y datos propios, acordando conmigo


### Calendario

-   Parcial 1: ~ 18 de Abril
-   Parcial 2: ~ 23 de Mayo
-   Proyecto final, a partir del ~ 10 de Junio
-   Días sin clases: 2, 11, 30 de Abril; 20 de Junio


### Herramientas

-   Github
    
    <div class="NOTES">
    Vamos a usar Github para intercambiar código
    
    </div>
-   Slack
    
    <div class="NOTES">
    Vamos a usar Slack para intercambiar información
    
    </div>
-   R en una terminal
    
    <div class="NOTES">
    Agregandole cualquier editor de texto, o sea, Emacs ;)
    
    </div>
-   R con RStudio


# R en el terminal

-   Abran un terminal
-   Pongan "R"
-   Voilá

<img src="./figs/rterminal.png">


# R con Rstudio

-   Abran RStudio
-   Voilá

<img src="./figs/rstudio.png">


# Ayuda

1.  El propio R:
    
        > ?plot <- ayuda de la función *plot*
        > ??plot <- "apropos"
2.  *Vignettes* (manuales de paquetes)
3.  Google - StackOverflow - R-bloogers
4.  Slack (local), Stackoverflow (global)
    
    <div class="NOTES">
    Pregunten por Slack a sus compañeros, usen los canales con criterio, usen y abusen de los *threads*
    
    </div>
5.  Profe Luis (último recurso! ;)


# Comandos básicos I

-   Ayuda: `?` y `??`
-   Cargar un paquete: `library(GenomicRanges)`
-   Instalar un paquete: `install.packages("GenomicRanges")`
-   Explorar y cargar datos: `data(), data(CO2)`
-   Qué objetos tenemos? `ls()`
-   Cargar código de disco: `source("./archivito.R")`


# Comandos básicos II

-   Imprimir algunas líneas de un objeto: `head(mpg)`
-   Estructura de un objeto: `str(mpg)`
-   Resumen de un objeto: `summary(mpg)`
-   Gráficar dos variables: `plot(displ, hwy)`


# [The tidyverse](http://tidyverse.org/) (aka [Hadleyverse](https://blog.rstudio.org/2016/09/15/tidyverse-1-0-0/))

*An ecosystem of packages designed with common APIs and a shared philosophy.*

-   Desarrollado por [Hadley Wickham](http://hadley.nz/) 
    
    <div class="NOTES">
    Hadley Wickham es un computer scientist neozelandés, y en los últimos años, se ha convertido en
    una máquina de crear paquetes de R. Trabaja para Rstudio.
    
    </div>
-   Principales paquetes: [dplyr](http://dplyr.tidyverse.org/) y [ggplot2](http://ggplot2.tidyverse.org/)
-   Orden y centralización a través de paquetes coherentes entre sí
-   La gramática como orden conceptual: verbos y sustantivos
    
    <div class="NOTES">
    "The cornerstone of civilization isn’t language, it’s science" (Arrival, 2016) Uno de los
     objetivos de los paquetes desarrollados por Wickam et al. es que sean consistentes entre sí. Una
     de los caminos que han utilizado es asociar lo más consistentemnte posible verbos para funciones
     (filter, sort, arrange, etc.) y sustantivos para datos o variables (por ejemplo flights).
    
    </div>


# Visualización


### Package *base* : función `plot()`

    
    # Define the cars vector with 5 values
    cars <- c(1, 3, 6, 4, 9)
    
    # Graph the cars vector with all defaults
    plot(cars)
    
    # Graph cars using blue points overlayed by a line 
    plot(cars, type="o", col="blue")
    
    # Create a title with a red, bold/italic font
    title(main="Autos", col.main="red", font.main=4)


### Package *base* : función `plot()`

    # Get a random log-normal distribution
    r <- rlnorm(1000)
    
    # Get the distribution without plotting it using tighter breaks
    h <- hist(r, plot=F, breaks=c(seq(0,max(r)+1, .1)))
    
    # Plot the distribution using log scale on both axes, and use
    # blue points
    plot(h$counts, log="xy", pch=20, col="blue",
    	main="Log-normal distribution",
    	xlab="Value", ylab="Frequency")


### package *ggplot2* : función `qplot()`

-   similar a plot()
-   para hacer figuras básicas

    qplot(displ, hwy, data = mpg)
    
    qplot(displ, hwy, colour = class, data = mpg)


## Práctica

1.  Elegir un conjunto de datos *built-in* con datos continuos y categóricos
2.  Explorar sus principales características (media, máximo, mínimo, etc)
3.  Graficar las relaciones más importantes
4.  Encontrar la manera de hacer *scatterplots* e histogramas
5.  Agregar información (título, ejes, descripción de los datos)

