# 1er parcial - recuperatorio


## Instrucciones

## -   Tienen tres horas para completar el parcial.
## -   Tienen todo el material de clase y online disponible para consulta.
## -   `NO` tienen a sus compañeros disponibles.
## -   Tienen que resolver los ejercicios escribiendo las respuestas (tanto texto como código) en un
##     archivo con extensión .R (evitar usar Word, si esto es un problema, avísenme por favor).
## -   Cada pregunta y subpregunta están numeradas. **Importantísimo**: enumerar <span class="underline">de la misma manera</span> las
##     respuestas (aúnque estén vacías) para que coincidan correctamente.
## -   Algunas preguntas tienen la palabra `PhD` adelante, que significan que son para los que cursan la
##     materia como posgrado. Para el resto de la materia son opcionales, pero suman puntos ;)
## -   Al final del parcial me mandan por favor el archivo .R por mail o por <span class="underline">canal privado</span> de Slack.
## -   Si no saben o no les sale algo, intenten explicar todo lo que sí saben al respecto, aunque sea
##     parcial o incompleto, porque puede sumarles puntos. Si una línea de código les da algún error,
##     expliquen la lógica de lo que quisieron hacer, ya que si la lógica es correcta, eso también
##     suma. Si identifican la causa del error, aunque no lo sepan corregir, nuevamente eso suma. En
##     general, mejor poner de más que de menos.
## -   No se estresen.


## Problema

## 1.  `DATOS`
##     1.  Cargar los datos "txhousing" del paquete `ggplot2` en la sesión (o verificar si ya se encuentran
##         disponibles). Son datos de venta de inmuebles en Texas, con datos de ciudad, año, mes, número
##         de inmuebles vendidos (*sales*), total vendido en dólares (*volume*), mediana del valor del
##         inmueble, número de inmuebles disponibles (*listings*) y meses que se demoraría en vender todo
##         lo disponible al ritmo de venta actual (*inventory*). 

##     2.  Renombrar el dataframe a "tx" (o sea, asignar el objeto txhousing al objeto tx).

## 2.  `PRIMER ANÁLISIS`
##     1.  Qué clase de estructura de datos es `tx` (teníamos un comandito para eso)?

##     2.  Qué dimensiones tiene `tx` y con que comando lo veo?

##     3.  Cómo son los tipos de datos de cada elemento de `tx` (las columnas) y con que comando lo veo?

##     4.  `PhD` Usando subsetting o dplyr, guardar en una variable llamada "med_houston_10_2010" la mediana del valor de
##         inmuebles vendidos en octubre de 2010 en Houston. La variable debería contener solamente la
##         mediana, es decir, que "med_houston_10_2010" sea un vector "numeric" de longitud 1 (no un dataframe ni una lista).

## 3.  `PREGUNTAS` - responder usando herramientas de dplyr y/o subsetting.
##     1.  Cuántas ciudades diferentes hay en el dataframe `tx`?

##     2.  Contar cuantas observaciones (filas) hay por ciudad (o sea, una columna ciudad y otra número de
##         observaciones). Contar cuantas hay por año (idem a lo anterior, año y al lado, número de
##         observaciones).

##     3.  En que mes y año se vendieron más inmuebles en la ciudad de "Amarillo"?

##     4.  Análisis de precio: i)  Cuál ciudad tiene los inmuebles más caros (en promedio)?
##         ii) Cuál los más baratos?

##     5.  Análisis temporal: construir una nuevo dataframe, llamado "tx_tot_y", con el volumen de ventas
##         totales por año (es decir, incluyendo todos los meses y ciudades, etc.). En cuál
##         año se vendió más y en cuál menos?

##     6.  `PhD`: Hacer un dataframe a partir de este último con una columna adicional que tenga el número total de inmuebles vendidos (también por año, es decir, tendremos año, total de volumen de ventas, total de casas vendidas).

## 4.  `GRAFICAR` (con `ggplot2`)
    
##     Este punto utiliza datos creados en los puntos 3.4 a 3.6. Si esas columnas no salieron por alguna
##     razón, pueden crear columnas artificiales usando las herramientas de `R` para generar números
##     aleatorios, como `rnorm()` o `runif()`. Si se dan maña para hacer esto, se considerará una parte
##     importante del puntaje de las preguntas.
    
##     1.  Graficar con puntos el volumen de ventas totales dividido el número de inmuebles totales, en función de los años.

##     2.  Definir el tamaño de los puntos como proporcionales al número de inmuebles totales.

##     3.  Ponerle texto explicativo a los ejes x e y, y título al gráfico.

##     4.  `PhD` Agregar una regresión de tipo *loess* con una capa `geom_smooth()`.
