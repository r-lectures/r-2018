--- 
layout: default 
title: Clase 4
--- 


# repaso de la clase anterior


## principales funciones dplyr

-   `select()`: seleccionar columnas
-   `arrange()`:reordenar filas
-   `filter()`: filtrar observaciones por sus valores
-   `mutate()`: crear variables a partir de otras
-   `summarise()`: reducir varios valores a uno solo
    (muchas veces agrupamos primero con `group_by`)


## repaso práctica 3

<div class="NOTES">
Veamos ahora un repaso de la práctica 3, en donde vimos las principales funciones de dplyr.

</div>


### Cuál es el estado que más nacimientos tiene en total? El que menos?

    library(mosaicData)
    library(dplyr)
    b <- Birthdays
    
    # agrupo por estado
    by_state <- group_by(b, state)
    # calculo total de nacimientos por estado usando sum()
    births_by_state <- summarise(by_state, tot_births = sum(births))
    
    # el que más: el que queda e 1er lugar, CA (California)
    arrange(births_by_state, desc(tot_births))
    
    # el que menos: el que queda en 1er lugar sin desc(): VT (Vermont)
    arrange(births_by_state, tot_births)


### Esto es así año a año? Graficar. Cuál está en 1er lugar durante más tiempo?

    # agrupo por año y por estado
    by_state_year <- group_by(b, state, year)
    
    # calculo el total de nacimientos
    births_by_state_and_year <- summarise(by_state_year, tot_births= sum(births))
    
    # grafico
    p <- ggplot(data = births_by_state_and_year)
    p <- p + aes(year, tot_births, colour = state, shape = state)
    p <- p + geom_line() + geom_point()
    p <- p + xlab("year") + ylab("total births")
    p <- p + scale_y_log10() # para poder ver mejor todos los estados
    p

<div class="NOTES">
ggplot2 no pone más de 6 tipos de formas para los puntos. Para más que eso se debe hacer
manualmente, por ejemplo ver esta pregunta en StackOverflow: <http://stackoverflow.com/questions/26223857/more-than-six-shapes-in-ggplot> 

</div>


### Cuántos estados están por arriba de la media de nacimientos? Cuáles son?

    mean_by_state <- summarise(by_state, mean = mean(births))
    overall_mean <- mean( mean_by_state$mean ) 
    arrange(filter(mutate(mean_by_state, frac = mean/overall_mean), frac >= 1), desc(frac))
    # A tibble: 18 × 3
    #    state      mean     frac
    #    chr        dbl      dbl
    # 1     CA 1067.9570 5.653908
    # 2     TX  718.0727 3.801574
    # 3     NY  702.7545 3.720477
    # 4     ...


### En promedio, qué més del año tiene más nacimientos?

    births_by_month <- arrange(summarise(group_by(b, month), monthly = sum(births)), desc(monthly))
    
    # normalizando con el promedio, para ver cuanta variación hay en realidad
    mean_by_month <- mean(births_by_month$monthly)
    mutate(births_by_month, monthly/mean_by_month)


### Hay algún día del mes o de la semana que esté muy por encima de la media?

    # dia del mes
    births_by_day <- arrange(summarise(group_by(b, day), daily = sum(births)), desc(daily))
    mean_by_day <- mean(births_by_day$daily)
    mutate(births_by_day, daily/mean_by_day)
    
    # dia de la semana
    births_by_wday <- arrange(summarise(group_by(b, wday), wdaily = sum(births)), desc(wdaily))
    mean_by_wday <- mean(births_by_wday$wdaily)
    mutate(births_by_wday, wdaily/mean_by_wday)


### Hay algún día (de cualquier año) sin nacimientos?

    # hay alguna observación 0 o NA?
    filter( b, births == 0 )
    filter( b, births == NA )
    
    # agrupo por día
    by_day <- group_by(b, date)
    births_by_day2 <- summarise(by_day, daily = sum(births)) # 7305 observaciones
    filter( births_by_day2, daily == 0 )
    
    unique(b$year) # 20 años
    [1] 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983
    [16] 1984 1985 1986 1987 1988
    
    20*365 
    [1] 7300 # faltan 5 dias de 5 años bisiestos que hay en 20 años, 1 cada 4
    
    bCA <- filter(b, state == "CA") 
    summarise(group_by(bCA, year), n = n()) 
    # A tibble: 20 × 2
    #    year     n
    #   <int> <int>
    # 1   1969   370
    # 2   1970   370
    # ...
    
    print( filter(bCA, year == 1969 ) , n = 100 ) 
    # ...
    # 59     CA  1969     2    28 1969-02-28   Fri    944
    # 60     CA  1969     2    29 1969-03-01   Sat      2
    # 61     CA  1969     2    31 1969-03-03   Mon      2
    #...


### Y considerando los estados individualmente?

    by_state_day <- group_by(b, state, date)
    births_by_state_day <- summarise(by_state_day, bsd = sum(births))
    min( births_by_state_day$bsd )
    # [1] 2


### Explorar lag() y ver en que año hubo la mayor diferencia de nacimientos. Graficar.

    ?lag
    ?dplyr::lag # mejor aún
    
    by_year <- group_by(b, year)
    births_by_year <- summarise(by_year, tot_births = sum(births))
    # creo la diferencia entre años con lag()
    births_by_year <- mutate(births_by_year, birth_diff = tot_births - lag(tot_births))
    # grafico
    ggplot(births_by_year, aes(year, birth_diff)) + geom_col() + xlab("año") + ylab("Diferencia de nacimientos")
    # mayor diferencia en '72, mayor aumento en '79


# lectura/escritura

"read\_csv()" lee un archivo delimitado por comas.

    read_csv(readr_example("mtcars.csv"))
    read_csv(readr_example("mtcars.csv.zip"))
    read_csv(readr_example("mtcars.csv.bz2"))
    read_csv("https://github.com/tidyverse/readr/raw/master/inst/extdata/mtcars.csv")

Se pueden controlar cosas como col\_types, col\_names, delim, skip, n\_max, y otros. 

Existe una "write\_csv" equivalente.


# %>%


## *Piping*  con  *Magrittr*

    x %>% f en vez de f(x) # el valor de x se direcciona a f()

    x %>% f(., arg2, arg3) # por default pasa al 1er argumento
    x %>% f(arg2, arg3)    # por lo tanto, puede obviarse el punto
    x %>% f(arg1, ., arg3) # puede usarse el punto para direccionar a otro lado


## Ejemplos

    arrange(filter(mutate(mean_by_state, frac = mean/overall_mean), frac >= 1), desc(frac))
    
    
    mean_by_state %>% # mi data.frame
    mutate(frac = mean/overall_mean) %>% # creo la columna frac
    filter(frac >= 1) %>% # filtro la columna frac
    arrange(desc(frac)) # ordeno de mayor a menor


# más dplyr


## combinando data.frames (sin llaves)

<img src="./figs/binds.png">


## combinando data.frames (con llaves)

<img style="WIDTH:500px; HEIGHT:420px; border:0" src="./figs/joins.png">

<img style="position:absolute; TOP:100px; LEFT:750px; WIDTH:400px; HEIGHT:150px; border:0" src="./figs/sets.png">

-   miren con cuidado el cheat-sheet de dplyr


# práctica 4

<ol class="smallfont">
  <li>Entrar en Buenos Aires Data (ver link en la web del curso)</li>
  <li>Ira a datos de Contaminación sonora </li>
  <li>Bajar los csv's de Torres y Mediciones 2011, 2012 y 2013 </li>
  <li>Cargar todo en R </li>
  <li>Hacer un único data.frame con las tres mediciones</li>
  <li>Cuales son los 5 barrios en donde hay más (y menos) promedio energético hora?</li>
  <li>Cómo se comparan los valores extremos de cada barrio con la media de todos los barrios?</li>
</ol>

