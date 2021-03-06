

# Recuperatorio 2do parcial


## Instrucciones

-   El parcial dura como máximo tres horas. **Gestionen bien su tiempo, si se traban intenten pasar a otra cosa y después vuelvan**.
-   Tienen todo el material de clase y online disponible para consulta.
-   NO tienen a sus compañeros disponibles. **Por favor, evitar mirar otras pantallas que no sean la propia**.
-   Tienen que resolver los ejercicios escribiendo las respuestas (tanto texto como código) en un archivo con extensión .R (evitar usar Word, si esto es un problema, avisenme por favor).
-   Cada pregunta y subpregunta están numeradas. **Importantísimo**: enumerar <span class="underline">de la misma manera</span> las respuestas (aún que estén vacías) y que coincidan correctamente.
-   Algunas preguntas tienen la palabra `PhD` adelante, que significa que son para los que cursan la materia como posgrado. Para el resto son opcionales, *pero suman puntos*.
-   Al final del parcial me mandan por favor el archivo .R por mail o por <span class="underline">canal privado</span> de Slack.
-   Si no saben o no les sale algo, intenten explicar todo lo que sí saben al respecto, aunque sea parcial. Si una línea de código les da algún error, expliquen la lógica de lo que quisieron hacer, ya que si es correcta, eso suma. Si identifican la causa del error, aunque no lo sepan corregir, nuevamente eso suma. En general, mejor poner de más que de menos.
-   No se estresen, pero no se atrasen.


## 1er ejercicio - 40p

El dataset `admissions` (que pueden bajar [acá](admissions.dat)) contiene 400 casos de alumnos que fueron evaluados para ser admitidos en una universidad, con las siguientes variables: *admit*, el alumno fue admitido (1) o no (0), *gre* y *gpa*, resultados de dos exámenes generales de conocimiento y finalmente *rank*, un puntaje de la institución de origen del alumno que va de 1 a 4, donde 1 significa mejor.

1.  Dividir los datos en dos dataframes, uno llamado *training* con 300 observaciones y otro llamado *testing* con 100 observaciones. Separar de manera que las filas queden al azar en uno u otro. O, por 3 puntos menos, separarlo en dos bloques contiguos.

2.  Utilizando *training*, hacer una regresión lineal generalizada, con una regresión logística, para la variable `admit`, como función de una combinación lineal (suma) de las otras variables `gre`, `gpa` y `rank`; luego guardar el resultado en la variable `modelo`.

3.  Usando el modelo recién generado, hacer una predicción de `admit` a partir del dataframe *testing*. El resultado es una probabilidad para cada observación. Con esa probabilidad, generar un vector cuyoes elementos contengan un 1 si el valor de la probabilidad es mayor a 0.5 o un 0 si es menor que 0.5. Guardar este vector binario como una columna adicional en *testing* llamada `admit.pred`, de manera de tener tanto el verdadero valor de admisión como el predicho por el modelo.

4.  Verificar cuantas observaciones fueron correctamente clasificadas y cuantas no, relativas al total de casos. En segundo lugar, distinguir entre verdaderos positivos (era 1 y predijo 1), verdaderos negativos ((era 0 y predijo 0)), falsos positivos (era 0 y predijo 1) y falsos negativos (era 1 y predijo 0). Tip: la función `table()` es una opción.

5.  `PhD`: Agrupar el dataframe `admissions` por `rank` y aplicar la regresión del punto 2 para cada grupo (esta vez sin `rank` en la formula). Obtener un dataframe con `rank` y el parámetro del modelo `AIC`, que determina la calidad del mismo. Tip: existe la función `AIC`.


## 2do ejercicio - 30p

El dataset `nasa` contiene dos listas: la primera (`mets`) es a su vez otra lista, cuyos elementos (`temperature`, `ozone`, `pressure`, etc.) contienen *arrays*, es decir, una generalización de matrices con más dimensiones. (Si una matriz típicamente es de `NxM`, un *array* puede ser por ejemplo de `SxTx...xUxV`.) Haciendo *subsetting* de `temperature`, verán que éste tiene dimensiones 24x24x12x6, correspondiente a las dimensiones `lat`, `long`, `month` y `year`. (Verifíquenlo!)

1.  Haciendo *subsetting* de la primera posición, tanto para latitud como para longitud (solamente), obtenemos una matriz. Usando la función apropiada de la familia `*apply`, hacer medias sobre la dimensión `year` (de manera de obtener un vector de 12 elementos). Luego repetir la operación, pero esta vez hacer medias de la dimensión `month`, de manera de obtener un vector de 6 elementos.

2.  Hacer una función para que el procedimiento del punto 2 funcione para cualquier índice en las posiciones de `lat`, `lon`.

3.  `PhD` Con `purrr`, extender el análisis anterior para todos los elementos de la lista `$mets` (es decir, `temperature`, `ozone`, `pressure`, etc.). Evaluar en el elemento [24, 24, ,]. Obtener un data.frame que debería tener 7 variables y 12 filas, correspondiendo a los meses.


## 3er ejercicio - 30p

Un empleado de banco, cansado de atender tantos clientes, quiere convencer al gerente de que hacen falta más empleados. Cómo hizo el curso de R, decide hacer algunas simulaciones.

El empleado calcula que en un día típico, en promedio entran 15 clientes cada 5 minutos. El número de clientes entrando cada 5 minutos (variable `nllegadas`) fluctúa, o sea que a veces llegan más, a veces menos, pero la <span class="underline">tasa promedio</span> de llegadas es 15 clientes/5 min. Después de contar de 8hs a 16hs en intervalos de 5 minutos, el empleado hace un histograma de esta variable y ve que <span class="underline">se ajusta bien a una distribución de *Poisson*</span>. Por otro lado, el empleado sabe que el *tiempo* que demora con cada cliente, a la que llama variable `tatencion`, es totalmente aleatorio, entre medio minuto y 4 minutos, donde cualquier valor en ese intervalo es igualmente probable.

1.  Generar un vector, llamado `nllegadas`, de números aleatorios tomados de una distribución de Poisson. Estos valores simularán el número de gente que entra al banco en cada intervalo de 5 minutos de un día.

2.  Generar *una lista* llamada `tatencion`, cuyos elementos contienen un vector con los tiempos de atención que necesita cada uno de los clientes que llegó en ese intervalo. Por ejemplo, si llegaron 3 clientes en el intervalo 78, el elemento 78 de `tatencion` tendrá un vector de 3 elementos conteniendo esos tiempos, etc. Cada elemento de la lista tendrá un vector de *doubles* de distinta longitud. Rellenar estos vectores con números aleatorios tomados de una distribución uniforme entre 0.5 y 4, que representarán el *tiempo de atención* que necesita cada cliente. Tip: para dar el primer paso, recordar que existe la función `list()`.

3.  Con `purrr`, sumar los elementos del vector en cada elemento de `tatencion`, de manera de obtener un vector con el tiempo total que necesitan los clientes que llegaron en cada uno de los intervalos, y asignar el resultado a un vector *double* llamado `ttot`. Por un tercio de los puntos hacerlo con `*apply`. Cuánto vale en promedio el tiempo de trabajo que entra en cada intervalo?

4.  `PhD`: Hacer una función englobando los pasos 1, 2 y 3, de manera de pasarle como argumento un número N de repeticiones, y devolver un vector `mean.ttot` con el promedio de los N vectores `ttot`. Por ejemplo, `mean.ttot[1]` es el promedio de `N` valores de `ttot[1]`, cada uno de una simulación diferente. Evaluar con N=10.

