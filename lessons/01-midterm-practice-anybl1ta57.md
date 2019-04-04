

# Dataset *nycflights13*

1.  Instalar el paquete *nycflights13* y cargarlo a la sesión.
2.  El paquete contiene un objeto de datos llamados "flights". Ver el help de "flights" para ver de que se tratan.
3.  Calcular cuantos vuelos salen de NYC por día. Hacerlo de dos maneras: una con `summarise()` + `n()` y
    otra con `tally()`. Pensar de antemano las dimensiones del dataframe que van a generar y chequear
    las dimensiones después de generarlo.
4.  Agregarle a este último dataframe una columna con el día de la semana (o sea, 'lunes', 'martes', etc.).
5.  Hacer un `boxplot`, para cada día de la semana, del número de vuelos salientes (cada 'box' representará todos los vuelos del dataset que hayan salido un lunes, todos los de los días martes). Tip: ver en la ayuda como funciona `boxplot` cuando, además de la variable que determina el 'box', le paso otra variable de factores. ¿Cuál es el día menos similar al resto?
6.  ¿Qué dia de la semana tiene mayor demora en las salidas de los vuelos?
7.  ¿Para cuál destino hay mayor demora en los vuelos de salida?

