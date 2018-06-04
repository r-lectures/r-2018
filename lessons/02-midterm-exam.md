--- 
layout: default 
title: Parcial 2
--- 


# 2do parcial


## Instrucciones

-   El parcial dura como máximo tres horas. **Gestionen bien su tiempo, si se traban intenten pasar a otra cosa y después vuelvan**.
-   Tienen todo el material de clase y online disponible para consulta.
-   NO tienen a sus compañeros disponibles. **Por favor, evitar mirar otras pantallas que no sean la propia**.
-   Tienen que resolver los ejercicios escribiendo las respuestas (tanto texto como código) en un archivo con extensión .R (evitar usar Word, si esto es un problema, avisenme por favor).
-   Cada pregunta y subpregunta están numeradas. **Importantísimo**: enumerar <span class="underline">de la misma manera</span> las respuestas (aún que estén vacías) y que coincidan correctamente.
-   Algunas preguntas tienen la palabra `PhD` adelante, que significa que son para los que cursan la materia como posgrado. Para el resto son opcionales, *pero suman puntos*.
-   Al final del parcial me mandan por favor el archivo .R por mail o por <span class="underline">canal privado</span> de Slack.
-   Si no saben o no les sale algo, intenten explicar todo lo que sí saben al respecto, aunque sea parcial. Si una línea de código les da algún error, expliquen la lógica de lo que quisieron hacer, ya que si es correcta, eso suma. Si identifican la causa del error, aunque no lo sepan corregir, nuevamente eso suma. En general, mejor poner de más que de menos.
-   No se estresen.


## 1er ejercicio

Un géiser es un fenómeno natural donde sale un chorro de agua caliente
de la tierra espontáneamente. Los datos *faithful* (del paquete
*datasets*) describen los tiempos de espera entre erupciones
(*waiting*, en minutos) y la duración de las erupciones (eruptions,
también en minutos) del géiser 'Old Faithful', en el parque nacional
Yellowstone en Wyoming, EEUU.

1.  Dividir el data.frame *faithful* en dos dataframes, uno llamado *training* con 200 observaciones y el resto (72 observaciones) en otro llamado *testing*. (Las observaciones que van en uno u otro pueden (o no) ser elegidas al azar.)

2.  Para *testing*, hacer una regresión lineal de la variable `eruptions` (tiempo de erupción) como función de `waiting` (tiempo de espera) y luego guardar el resultado en la variable `modelo`.

3.  Explorar el modelo generado con *funciones auxiliares*, **mencionando en cada punto cuál función auxiliar se utilizó**:
    1.  Qué coeficientes se obtienen (correspondientes a `(Intercept)` y `waiting`)?
    2.  Cuál es el valor del parámetro 'Adjusted R-squared'?
    3.  Calcular la media y desviación estándar de los residuos.

4.  Hacer un único scatterplot con tres elementos: 
    1.  Los datos de *training*
    2.  Una línea azul con el resultado de la regresión (explorar como dibujar una recta con los coeficientes encontrados en *3.1*)
    3.  Una línea roja con los valores de predicción: `testing$waiting` en `x` y `predict(testing)` en `y`.

5.  `PhD` Hacer un histograma con los residuos del modelo:
    1.  El histograma está aproximadamente centrado en cero?
    2.  Es (más o menos) simétrico?
    3.  Porqué (o porqué no) sería factible decir que `lm()` está justificado?


## 2do ejercicio

Los datos de terremotos *quakes* del paquete *datasets*, contienen 1000 observaciones de terremotos cerca de Fiji desde 1965. Tiene como variables latitud `lat` y longitud `long`, magnitud `mag`, profundidad `depth` y número de estaciones `stations` que informaron cada terremoto.

1.  Usando loops (`for`, `if`, `else`, etc.), construir un vector con una nueva variable `case`, creada a partir de la variable `depth`, que valga 1 si `depth` es menor que 100, 2 si está entre 100 y 300, o 3 si es mayor que 300.

2.  Usar `tapply` para determinar el promedio de la magnitud (variable `mag`) para cada caso de `case`. En cuál caso los terremotos son más fuertes (o sea, hay más magnitud en promedio) y en cuál menos? Por un tercio de los puntos, hacerlo con `dplyr`.

3.  `PhD` Usar `tapply` para determinar cuál es la estación (variable `stations`) con más eventos sísmicos (o sea, más observaciones). *Tip*: Internamente, `tapply` forma *vectores* antes de aplicar la función elegida. Por un tercio de los puntos, hacerlo con `dplyr`.


## 3er ejercicio

En Álgebra Lineal, una *matriz ortogonal* `U` es una matriz cuadrada (`NxN`) de números reales. Tienen la **propiedad** de que dicha matriz por su transpuesta (la matriz que resulta de intercambiar filas por columnas) es igual a la matriz identidad, es decir `UU'= I`, donde `U'` es la transpuesta de `U` (recordar que existe una función para transponer una matriz). 

1.  Escribir una función que tome un número `x` y devuelva una matriz `U` tal como se indica a continuación:
    
    <table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
    
    
    <colgroup>
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    </colgroup>
    <tbody>
    <tr>
    <td class="org-left">cos(x)</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">-sin(x)</td>
    </tr>
    
    
    <tr>
    <td class="org-left">sin(x)</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">cos(x)</td>
    </tr>
    </tbody>
    </table>

2.  Evaluar la función con un valor aleatorio entre 0 y `2*pi`.

3.  Confirmar la propiedad mencionada en el enunciado multiplicando `U` por su transpuesta `U'` y viendo si se obtiene la matriz identidad `I`.

4.  A partir de una **lista** de 100 valores aleatorios distintos entre 0 y `2*pi` (es decir, cada elemento de la lista tiene un solo valor aleatório, numérico), comprobar usando `purrr` la propiedad descripta arriba (o, por un tercio del puntaje, usando `*apply`).

5.  `PhD` De la misma manera, también para 100 valores aleatorios entre 0 y `2*pi`, calcular el valor absoluto de los autovalores de las matrices generadas. Qué propiedad se deduce?

