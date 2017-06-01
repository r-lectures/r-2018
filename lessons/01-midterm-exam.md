--- 
layout: default 
title: Parcial 1
--- 


# 1er parcial


## Instrucciones

-   El parcial dura como máximo dos horas.
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


## Problema 1

1.  DATOS 
    1.  Cargar los datos "economics" del paquete ggplot2 en la sesión (o verificar si ya se encuentran disponibles).
        Consejo: Lean la ayuda (?economics), como para tener una idea sobre que son los datos.
    2.  Renombrar el dataframe a "e" &#x2014;sin comillas&#x2014; (o sea, asignar el objeto economics al objeto e).
2.  PRIMER ANÁLISIS
    1.  Qué clase de estructura de datos es? 
        1.  Es un vector atómico?
        2.  Contiene vectores atómicos? Cuáles?
        3.  Cuántos atributos tiene y como se llaman?
    2.  Cuántas filas y columnas tiene?
    3.  Cómo son los tipos de datos de cada columna?
3.  GRAFICAR (preferiblemente con ggplot2)
    1.  Hacer un scatterplot de la variable de desempleo (`unemploy`) en función del tiempo (`date`).
    2.  Colorear los puntos que tengan la variable `psavert` menor que el promedio de `psavert` a lo largo de
        los años (es decir, el promedio de todos los elementos de la columna).
    3.  Ponerle texto explicativo a los ejes x e y.
    4.  `PhD`: mejorar la "leyenda" con un título y descripción de los dos colores.
4.  PREGUNTAS
    1.  De cuándo a cuándo van los datos temporales? (o sea, fecha mínima y fecha máxima).
    2.  Aproximadamente cuantos "picos" se ven en el desempleo? (consejo: verlo gráficamente).
    3.  Se encuentran "picos" de ese estilo en las otras variables (`pce`, `pop`, `psavert`, `uempmed`)? En
        alguna variable coinciden (más o menos) los "picos"? Decir cuál (consejo: verlo gráficamente).
    4.  Separar la columna 'date' en tres columnas "d", "m" y "y".
    5.  Hacer una tabla con el desempleo medio por año (o sea, una columna "año" y otra de "desempleo
        medio" de ese año).
    6.  En qué años se registran el mayor y menor valor de desempleo?
    7.  Usar los datos de 'presidential' &#x2014;ver data()&#x2014; para ver a que administración corresponden esos
        dos extremos de desempleo encontrados.
    8.  `PhD`: Hacer una columna extra con desempleo per cápita (consejo, vean en la ayuda de
        economics donde está la variable de población). Cambian los años de mayor y menos desempleo
        para esta nueva variable?


## Problema 2

1.  DATOS
    En data() tenemos dos datasets (separados) sobre la temperatura corporal de dos castores: beaver1
    y beaver2. La temperatura está en Celsius. 
    1.  Hacer una función llamada `c2f()` que reciba un valor (double) representando una temperatura en
        Celsius y que devuelva un valor (double) representando una temperatura en
        Fahrenheit (consejo: usar wikipedia o google para recordar como se hace la conversión de una
        unidad a otra).
2.  PRIMER ANÁLISIS
    1.  Qué estructura son beaver1 y beaver2?
    2.  Tienen las mismas columnas (en número, en tipo y en significado de datos)?
    3.  Tienen las mismas filas u observaciones?
3.  PREGUNTAS
    1.  Usar la función del primer punto `c2f()` para generar una columna extra en cada dataset que
        tenga la temperatura en Fahrenheit. Conviene que la columna tenga nombre para poder
        manipularla después. Pueden generar la nueva columna con las funciones de `dplyr` o con
        *subsetting* de base. En las preguntas subsiguientes siempre me refiero a esta temperatura.
    2.  Cuál es la temperatura promedio del castor 1 y cuál la del castor 2?
    3.  Cuál es la temperatura promedio de cada castor estando en actividad y cuál estando en reposo?
        O sea, para cada castor, queremos dos columnas: `activ` y temperatura media, con
        dos filas solamente.
    4.  Porqué esta distinción es útil en el caso de un castor y no en el del otro?
    5.  `PhD`: para el castor 2, calcular cuál es la diferencia entre los promedios de la temperatura
        entre los dos estados de actividad
4.  GRAFICAR (preferiblemente con `ggplot2`)
    1.  Para cada dataset (beaver1 y beaver2), graficar dos histogramas de temperatura <span class="underline">pero en la
        misma figura</span> (en el mismo "lienzo", es decir, sin usar *facetting*). Cada histograma
        representará cada una de las dos temperaturas.
    2.  Poner un título y nombre a los ejes.
    3.  Colorear ambos histogramas, por ejemplo en azul y rojo, con la opción `fill`.
    4.  `PhD`: Usen la opción transparencia `alpha` (consejo, vean machete de `ggplot2` y/o
        `?ggplot2::alpha`, y prueben distintos valores de `alpha` para ver el efecto que tiene). Porque
        la opción `alpha` es útil en este caso? Qué cosa me permite ver, que sin `alpha` no podría ver
        bien?

