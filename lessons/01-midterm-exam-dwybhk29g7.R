## # 1er parcial


## ## Instrucciones

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


## ## Problema

## 1.  `DATOS`
##     1.  Cargar los datos "economics" del paquete ggplot2 en la sesión (o verificar si ya se encuentran disponibles).
##         Consejo: Lean la ayuda (?economics), como para tener una idea sobre que son los datos.

##     2.  Renombrar el dataframe a "`e`" &#x2014;sin comillas&#x2014; (o sea, asignar el objeto `economics` al objeto `e`).

## 2.  `PRIMER ANÁLISIS`
##     1.  Qué estructura tienen los datos? (teníamos un comandito para eso).

##     2.  Cuántas filas y columnas tenemos?

##     3.  Cómo son los tipos de datos de cada columna?

##     4.  `PhD` Para que variable es mayor la razón entre media y mediana? (No considerar la variable `date`)

## 3.  `GRAFICAR` (con `ggplot2`)
##     1.  Hacer un *scatterplot* (i.e., gráfico con puntos) de la variable de desempleo (`unemploy`) en función del tiempo (`date`).

##     2.  Colorear los puntos del gráfico que tengan la variable `psavert` menor que el promedio total
##         de `psavert` a lo largo de los años (es decir, el promedio de todos los elementos de la
##         columna).

##     3.  Ponerle texto explicativo a los ejes x e y.

##     4.  `PhD`: mejorar la "leyenda" con un título y descripción de los dos colores.

## 4.  `PREGUNTAS`
##     1.  De cuándo a cuándo van los datos temporales? (o sea, obtenter fecha mínima y fecha máxima).

##     2.  Aproximadamente, cuantos "picos" se ven en el desempleo? Tip: hacerlo gráficamente.

##     3.  Se encuentran "picos" de ese estilo en alguna de las otras variables (`pce`, `pop`, `psavert`, `uempmed`)? En
##         alguna variable coinciden (más o menos) los "picos"? Decir cuál o cuales.

##     4.  Separar la columna 'date' en tres columnas "d", "m" y "y".

##     5.  Hacer una tabla con el desempleo medio por año (o sea, una columna "año" y otra de "desempleo
##         medio" de ese año).

##     6.  En qué años se registran el mayor y menor valor de desempleo?

##     7.  Usar los datos 'presidential' &#x2014;ver data()&#x2014; para ver a que administración corresponden esos
##         dos extremos de desempleo encontrados.

##     8.  `PhD`: Hacer una columna extra con desempleo per cápita (consejo, vean en la ayuda de
##         economics donde está la variable de población). Cambian los años de mayor y menos desempleo
##         para esta nueva variable?

