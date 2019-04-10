

# 1er parcial - 2da fecha


## Instrucciones

-   Tienen dos horas+ para completar el parcial.
-   Tienen todo el material de clase y online disponible para consulta.
-   `NO` tienen a sus compañeros disponibles.
-   Tienen que resolver los ejercicios escribiendo las respuestas (tanto texto como código) en un archivo de texto (puede ser una notebook en markdown, evitar usar Word, si esto los complica, avísenme por favor).
-   Importantísimo: enumerar de la misma manera las respuestas (aunque estén vacías) para que coincidan correctamente. Notar que cada pregunta y subpregunta están numeradas.
-   Algunas preguntas son solo para los alumnos que cursan la materia como POSGRADO. Para el resto de los alumnos son opcionales, pero suman ;)
-   Al final del parcial me mandan el archivo de texto o notebook por mail o por mensaje privado en Google Classroom (o en un pendrive si no tienen Internet).
-   Si no saben o no les sale algo, intenten explicar todo lo que sí saben al respecto, aunque sea parcial o incompleto, porque puede sumarles puntos. Si una línea de código les da algún error, expliquen la lógica de lo que quisieron hacer, ya que si la lógica es correcta, eso también suma. Si identifican la causa del error, aunque no lo sepan corregir, nuevamente eso suma. En general, mejor poner de más que de menos.
-   No se estresen!


## Problema

1.  `DATOS`
    1.  Cargar los datos "economics" del paquete `ggplot2` en la sesión (o verificar si ya se encuentran disponibles).
        Consejo: Lean la ayuda del dataset, como para tener una idea sobre de qué son los datos.
    2.  Renombrar el dataframe a "`e`" &#x2014;sin comillas&#x2014; (o sea, asignar el objeto `economics` a la variable `e`).

2.  `PRIMER ANÁLISIS`
    1.  ¿Qué estructura tienen los datos? Poner la instrucción usada y escribir qué estructura es.
    2.  ¿Cuántas filas y columnas tenemos? Poner la instrucción usada y qué valores corresponden a cada uno.
    3.  ¿Cómo son los tipos de datos de cada columna? Poner la instrucción usada para ver esto e indicar los tipos de todas las columnas.
    4.  **POSGRADO** ¿Cuál de las variables tiene la mayor razón entre media y mediana? (No considerar la variable `date`).

3.  `PREGUNTAS`
    1.  ¿De cuándo a cuándo van los datos temporales? (o sea, obtenter fecha mínima y fecha máxima).
    2.  Aproximadamente, ¿cuantos "picos" se ven en el desempleo? Tip: hacerlo gráficamente.
        1.  ¿Se encuentran "picos" de ese estilo en alguna de las otras variables (`pce`, `pop`, `psavert`, `uempmed`)?
        2.  ¿En alguna variable coinciden (más o menos) los "picos"? Decir cuál o cuales.
    3.  Usar el comando `separate` del paquete `tidyr` para separar la columna 'date' en tres columnas "year", "month" y "day". (Avisar si este punto no les sale.)
    4.  Hacer una tabla con el desempleo promedio por año (o sea, una columna "año" y otra de "desempleo promedio" de ese año).
        1.  ¿En qué años se registran el mayor y menor valor de desempleo?
    5.  Usar los datos `presidential` &#x2014;ver `data()`&#x2014; para ver a que administración corresponden esos dos extremos de desempleo encontrados.
    6.  **POSGRADO**: Hacer una columna extra con desempleo per cápita (ver en la ayuda de `economics` a dónde está la variable población).
        1.  ¿Cambian los años de mayor y menos desempleo para esta nueva variable?

4.  `GRAFICAR` (con `ggplot2`)
    1.  Hacer un gráfico con puntos de la variable de desempleo (`unemploy`) en función del tiempo (`date`).
    2.  Colorear los puntos del gráfico que tengan la variable `psavert` menor que el promedio total de `psavert` a lo largo de los años (es decir, el promedio de todos los elementos de la
        columna).
    3.  Ponerle texto explicativo a los ejes x e y.
    4.  **POSGRADO**: Mejorar la referencia (*legend*) con un título de la misma y etiquetas que describan el significado de los dos colores.

