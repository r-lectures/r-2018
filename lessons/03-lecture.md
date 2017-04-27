--- 
layout: default 
title: Clase 2
--- 


# Repaso de la clase pasada


## 

`ggplot2`

    p <- ggplot(mtcars)   # creo un objeto ggplot con los datos mtcars
    p <- p + aes(mpg, wt) # le agrego el mapeo de variables que quiero
    p <- p + geom_point() # le agrego como quiero que represente ese mapeo
    p                     # imprimo la figura

    ggplot(data = mi-data-frame) + 
          geom_point/line/etc(mapping = aes(col1, col2, colour="blue", etc.))

<span class="underline">solo</span> `data.frames`


## 

 <ul class="smallfont">
<li><b>data</b>: el dataframe que contiene los datos a graficar</li>
<li><b>geoms</b>: el tipo de objeto geométrico que representa los datos: puntos, líneas, polígonos, etc.</li>
<li><b>aesthetics</b>: describe las características visuales que representan los datos,  por ejemplo, posición, tamaño, color, forma, etc </li>
<li><b>scale</b>: para cada aesthetic, describe como se mapea la característica visual a valores
 por ejemplo, escala logarítmica, escala de color, de tamaño, de forma, etc.</li>
<li><b>stats</b>: describe transformaciones estadísticas que resumen los datos, e.g. una regresión  </li>
<li><b>facets</b>: permite separar en gráficos distintos de acuerdo a variables categóricas</li>
 </ul>


## Práctica 1

1.  Elegir un conjunto de datos *built-in* con datos continuos y categóricos
2.  Explorar sus principales características (media, máxmimo, mínimo, etc)
3.  Graficar las relaciones más importantes
4.  Encontrar la manera de hacer *scatterplots* e histogramas
5.  Agregar información (título, ejes, descripción de los datos)


## Práctica 2

-   Seleccionen de `data()` un data.frame con alguna variable categórica
-   Qué pasa si hacen solo `ggplot(mi_data)`?
-   Qué pasa si intentan mapear color, tamaño o forma a una variable continua?
-   Para que sirve `jitter`? Para que sirve `stroke`?
-   Podemos usar formas condicionales (>, <, etc) en aes()?
-   Cómo difieren `facet_grid` y `facet_wrap`?
-   Usar `box-plot` y `geom_smooth()`. Cuándo conviene usarlas?


# Manipulación de datos

`library(dplyr)`

(igual que `ggplot2`, `dplyr` solo acepta data.frames)


## principales funciones

-   `select()`: seleccionar columnas
-   `arrange()`:reordenar filas
-   `filter()`: filtrar observaciones por sus valores
-   `mutate()`: crear variables a partir de otras
-   `summarise()`: reducir varios valores a uno solo
    (muchas veces agrupamos primero con `group_by`)


## 

`select()`

Con `select` podemos elegir las columnas

    library(mosaicData) # cargo el paquete que ya viene instalado
    b <- tbl_df(Birthdays) # cambio el nombre del data.frame (por fiaca)
    str(b)  # que pinta tiene el data.frame?
    
    select(b, state, births) # quiero dos columnas
    
    
    select(b, state, births, year) # o tres
    
    
    select(b, -wday, -date) # podemos sacar columnas


## 

`arrange()`

Con `arrange` podemos ordenar según valores de columnas

    b # ordenados por año
    
    arrange(b, state) # ahora ordeno por estados
    
    arrange(b, state, births) # ahora por estados y por nacimientos
    
    arrange(b, state, desc(births)) # idem pero nacimientos de mayor a menor


## 

`filter()`

Con `filter` podemos filtrar observaciones mediante condiciones lógicas
(>, >=, <, <=, !=, ==, más los operadores & y |)

    filter(b, state == "WA") # solo estado de Washington
    
    filter(b, state == "WA"  & year == 1974) # Washington en 1974
    
    filter(b, state == "WA" & year == 1974 & births > 180) # idem 
    				# pero más de 180 nacimientos


## 

`summarise()` y `group_by`

Con `summarise` podemos resumir variables 

    summarise(b, promedio = mean(births) ) # gran-promedio-gran
    
    # pero es mucho mejor si sacamos resúmenes de datos agrupados
    por_mes <- group_by(b, month)
    summarise(por_mes, births_por_mes = mean(births))
    
    por_estado <- group_by(b, state)
    summarise(por_estado, births_por_estado = mean(births))


## 

`mutate()`

Con `mutate` podemos armarnos una nueva columna a partir de otra(s)

    mutate(b, normalized = births/mean(births)) # normalizando
    
    
    # me armo un df agrupado como yo quiero
    por_anyo <- group_by(b, year) 
    # le calculo el promedio a través de los años
    promedio_por_anyo <-  
    		  summarise( por_anyo, promedio = mean(births) )
    # calculo el promedio anual total
    promedio_tot <- mean(promedio_por_anyo$promedio)
    # calculo el promedio _normalizado_ a través de los años
    mutate(promedio_por_anyo, 
           births_normalizado = promedio/promedio_tot)


## práctica 3

<ol class="smallfont">
  <li>Cuál es el estado que más nacimientos tiene en total? El que menos?</li>
  <li>Esto es así año a año? Graficar. Cuál está en 1er lugar durante más tiempo?</li>
  <li>Cuántos estados están por arriba de la media de nacimientos? Cuáles son?</li>
  <li>En promedio, qué més del año tiene más nacimientos?</li>
  <li>Hay algún día del més o de la semana que esté muy por encima de la media?</li>
  <li>Hay algún día (de cualquier año) sin nacimientos?</li>
  <li>Y considerando los estados individualmente?</li>
  <li>Explorar lag() y ver en que año hubo la mayor diferencia de nacimientos. Graficar.</li>
</ol>

