--- 
layout: default 
title: Recuperatorio Parcial 1
--- 


# Recuperatorio 1er parcial


## Instrucciones

-   El recuperatorio dura una hora y media.
-   Tienen todo el material de clase y online disponible para consulta.
-   NO tienen a sus compañeros disponibles.
-   Tienen que resolver los ejercicios escribiendo las respuestas (tanto texto como código) en un
    archivo con extensión .R. <span class="underline">En todos los casos poner el código del cual obtienen las respuestas.</span>
    (evitar usar Word, si esto es un problema, avisenme por favor).
-   **Cada pregunta y subpregunta están numeradas. Importantísimo: enumerar <span class="underline">de la misma manera</span> las respuestas (aún que estén vacías) y que coincidan correctamente.**
-   Algunas preguntas tienen la palabra `PhD` adelante, que significan que son para los que cursan la
    materia como posgrado. Para el resto son opcionales, pero suman puntos.
-   Al final del parcial me mandan por favor el archivo .R por mail o por <span class="underline">canal privado</span> de Slack.
-   Si no saben o no les sale algo, intenten explicar todo lo que sí saben al respecto,
    aunque sea parcial. Si una línea de código les da algún error, expliquen la lógica de lo que
    quisieron hacer, ya que si es correcta, eso suma. Si identifican la causa del error, aunque no lo
    sepan corregir, nuevamente eso suma. En general, mejor poner de más que de menos.
-   No se estresen.


## Problema único:

1.  DATOS 
    1.  Cargar los datos "txhousing" del paquete ggplot2 en la sesión (o verificar si ya se encuentran
        disponibles). Son datos de venta de inmuebles en Tejas, con datos de ciudad, año, mes, número
        de inmuebles vendidos (sales), total vendido en dólares (volume), mediana del valor del
        inmueble, número de inmuebles disponibles (listings) y meses que se demoraría en vender todo
        lo disponible al ritmo de venta actual (inventory). Consejo: miren la ayuda de los datos para
        más información. Preguntar si no entienden alguna cosa en inglés (es gratis ;).
    2.  Renombrar el dataframe a "tx" (o sea, asignar el objeto txhousing al objeto tx).

2.  PRIMER ANÁLISIS
    1.  Qué clase de estructura de datos es tx?
    2.  Cuántos atributos tiene tx y como se llaman?
    3.  Qué dimensiones tiene tx?
    4.  Cómo son los tipos de datos de cada elemento de tx (las columnas)?
    5.  Usando subsetting, guardar en una variable llamada "med\_houston\_10\_2010" la mediana del valor de
        inmuebles vendidos en octubre de 2010 en Houston. La variable debería contener solamente la
        mediana, es decir, que "med\_houston\_10\_2010" sea un vector "numeric" de longitud 1.

3.  PREGUNTAS - responder usando herramientas de dplyr y/o subsetting
    1.  Cuántas ciudades diferentes hay en el dataframe tx?
    2.  Contar cuantas observaciones hay por ciudad (o sea, una columna ciudad y otra número de
        observaciones). Contar cuantas hay por año (idem a lo anterior, año y al lado, número de
        observaciones).
    3.  Construir una funcioncita que pase un valor (no un vector, solo un valor) de dólares a pesos
        (o sea una función tal que usd2ars(10) devuelve 160, por ejemplo). Usarla para agregar una
        columna a tx con el volumen en pesos que se llame "volume\_ars".
    4.  <span class="underline">Análisis de precio</span>: Cuál ciudad tiene los inmuebles más caros (en promedio) y cuál ciudad
        los más baratos? Fijensé que tienen que aproximar ese precio del inmueble dividiendo ventas
        totales por número de inmuebles vendidos. En lo posible manejarse en pesos, pero si no, pueden
        hacerlo en dólares. Tip: no olvidarse de usar na.rm=TRUE si les hiciera falta (lo hemos usado
        en las prácticas).
    5.  <span class="underline">Análisis temporal</span>: construir una dataframe nuevo llamado "tx\_tot\_y" con el volumen de ventas
        totales (en pesos) por año (es decir, incluyendo todos los meses y ciudades, etc.). En cuál
        año se vendió más y en cuál menos? Tip: usar na.rm=TRUE. Pueden explicar la bajada?
    6.  Agregar a ese dataframe una columna con el número de inmuebles vendidos totales (por año).
    7.  `PhD`: En que mes y año se vendieron más inmuebles en la ciudad de "Amarillo"? Tip: pensar el
        problema en (dos) partes, conseguir el valor en cuestión y después ver cuando se produjo.

1.  GRAFICAR (con ggplot2)
    
    Este punto utiliza datos creados en los puntos 3.5 y 3.6. Si esas columnas no salieron por alguna
    razón, pueden crear columnas artificiales usando las herramientas de R para generar números
    aleatorios, como rnorm() o runif(). Si se dan maña para hacer esto, se considerará una parte
    importante del puntaje de las preguntas.
    
    1.  A partir de tx\_tot\_y, graficar (con puntos) las el volumen de ventas (en pesos) totales
        calculadas en el punto 3.5 en función de los años. Agregar otra capa con el número total de
        inmuebles vendidos calculado en el punto 3.6, también con puntos.
    2.  Para los datos de 3.5 (el volumen de ventas total), agregar una capa geom\_smooth() con una
        regresión de tipo "loess". Tip: recordar que la capa lleva su propio aes(), y envolver la
        fecha con la función as.numeric().

