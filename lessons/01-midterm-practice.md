--- 
layout: default 
title: Práctica para parcial
--- 


# Práctica para recuperatorio


## Dataset nycflights13

1.  Instalar el paquete "nycflights13" y cargarlo en la sesión.
2.  El paquete contiene un objeto de datos llamados "flights". Ver el help de flights para ver de que se tratan.
3.  Calcular cuantos vuelos salen de NYC por dia. Hacerlo de dos maneras: una con summarise() + n() y
    otra con tally(). Pensar de antemano las dimensiones del dataframe que van a generar y chequear
    las dimensiones después de generarlo.
4.  Agregarle a este último dataframe una columna con el día de la semana.
5.  Hacer un boxplot, para cada día de la semana, de los vuelos por dia. Tip: le paso estas dos
    variables al aes() de la capa boxplot. Cuál es el día menos similar al resto?
6.  Qué dia de la semana tiene mayor demora en las salidas de los vuelos?
7.  Para qué destino hay mayor demora en los vuelos de salida?

