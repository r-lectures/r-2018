--- 
layout: default 
title: Práctica para recuperatorio
--- 


# Práctica para recuperatorio


## nycflights13

1.  Instalar le paquete "nycflights13" y cargarlo en la sesión.
2.  El paquete contiene los datos llamados "flights". Ver el help de flights para ver de que se tratan.
3.  Calcular cuantos vuelos salen de NYC por dia. Hacerlo de dos maneras: una con summarise + n, otra
    con tally. Pensar de antemano las dimensiones del dataframe que van a generar, y chequear las
    dimensiones después de generarlo.
4.  Agregarle a este último dataframe una columna con el día de la semana.
5.  Hacer un boxplot, para cada día de la semana, de los vuelos por dia. Tip: le paso estas dos
    variables al aes() de la capa boxplot. Cuál es el día más distinto?
6.  Qué dia de la semana tiene mayor demora en las salidas de los vuelos?
7.  Para qué destino hay mayor demora en los vuelos de salida?


## Estructuras y subsetting

1.  Dado un vector x arbitrario, qué información me da mean(is.na(x))? Y sum(!is.finite(x))? Hacer
    pruebas si es necesario.
2.  Crear funciones que tomen un vector como input y que retornen:
    1.  El último valor. Usamos [ o [[?
    2.  Los elementos en posiciones pares.
    3.  Todos los elementos menos el último.
    4.  Sólo <span class="underline">números</span> impares (sin NAs).
3.  Qué pasa si se hace subset con un entero positivo mayor a la longitud del vector? Y que pasa si
    se hace subset con un nombre que no existe?

