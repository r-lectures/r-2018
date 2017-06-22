--- 
layout: default 
title: Parcial 2
--- 


# 2do parcial


## Instrucciones

-   El parcial dura como máximo tres horas.
-   Tienen todo el material de clase y online disponible para consulta.
-   NO tienen a sus compañeros disponibles.
-   Tienen que resolver los ejercicios escribiendo las respuestas (tanto texto como código) en un
    archivo con extensión .R (evitar usar Word, si esto es un problema, avisenme por favor).
-   Cada pregunta y subpregunta están numeradas. **Importantísimo**: enumerar <span class="underline">de la misma manera</span> las
    respuestas (aún que estén vacías) y que coincidan correctamente.
-   Algunas preguntas tienen la palabra `PhD` adelante, que significan que son para los que cursan la
    materia como posgrado. Para el resto son opcionales, pero suman puntos.
-   Al final del parcial me mandan por favor el archivo .R por mail o por <span class="underline">canal privado</span> de Slack.
-   Si no saben o no les sale algo, intenten explicar todo lo que sí saben al respecto,
    aunque sea parcial. Si una línea de código les da algún error, expliquen la lógica de lo que
    quisieron hacer, ya que si es correcta, eso suma. Si identifican la causa del error, aunque no lo
    sepan corregir, nuevamente eso suma. En general, mejor poner de más que de menos.
-   No se estresen.


## 1er problema

Los datos *faithful* del paquete *datasets* describen los tiempos de espera entre erupciones y la
duración de las erupciones del geiser 'Old Faithful' en el parque nacional Yellowstone en Wyoming,
EEUU.

1.  Dividir el data.frame *faithful* en dos dataframes, *training* con 200 observaciones y el resto de las
    observaciones en otro llamado *testing*. (No necesitan, aunque pueden si uds. quieren, ser
    índices elegidos al azar.)
2.  Hacer una regresion lineal de la variable tiempo de erupción proporcional a tiempo de espera.
3.  Imprimir en pantalla un resumen del modelo generado.
    3.1 Qué coeficientes se obtienen? 
    3.2 Cuál es la mediana de los residuos?
4.  Hacer un scatterplot de *training* y agregarle una línea con el resultado de hacer predict()
    sobre *testing*. (para esto último armar un data.frame con esos datos y valores de x de
    *testing*.)
5.  `PhD` Hacer un histograma con los residuos del modelo.
    1.  El histograma está centrado en cero?
    2.  Es más o menos simétrico?
    3.  Es factible decir que los residuos se distribuyen normalmente?


## 2do problema

Dados los datos de terremotos *quakes* del paquete *datasets*: 

1.  Usando *for* e *if* y *else*, construir un vector con una nueva variable *depthcat* creada a partir de la
    variable *depth*, que valga 1 si *depth* es menor que 100, 2 si es menor que 300, o 3 si es mayor.
2.  Usar tapply para determinar el promedio de la magnitud (*mag*) para cada caso de *depthcat*.
    2.1 En cuál caso hay más magnitud y en cuál menos?
3.  `PhD` Usar tapply para determinar cuál es la estación (*station*) con más eventos sísmicos (o sea, más
    observaciones). Tip: internamente tapply forma *vectores* antes de aplicar la función elegida. Además,
    pueden ordenar el resultado final con *sort()*.


## 3er problema

En Álgebra Lineal, una *matriz ortogonal* U es una matriz cuadrada con elementos pertenecientes al
conjunto de los reales. Tienen la propiedad de que dicha matriz por su transpuesta es igual a la
matriz identidad, es decir UU'= I, donde U' es la transpuesta de U. 

1.  Escribir una función que tome un número *phi* y devuelva una matriz U con cos(*phi*) en su diagonal, sin(*phi*)
    en la fila 2/columna 1 y -sin(*phi*) en la fila 1/columna 2.
2.  Generar un valor aleatorio entre 0 y 2\*pi y usarlo en la función del punto 1 para generar la
    matriz U correspondiente.
3.  Confirmar la propiedad mencionada en el enunciado multiplicando U por su transpuesta U' y viendo
    si se obtiene la matriz identidad I.
4.  Con lapply, comprobar esta propiedad para 10 matrices generadas a partir de 10 valores aleatorios
    entre 0 y 2\*pi.
5.  `PhD` De la misma manera, también para los 10 valores aleatorios entre 0 y 2\*pi, calcular el valor absoluto
    (abs()) de los autovalores de las matrices generadas. Qué propiedad se deduce?

