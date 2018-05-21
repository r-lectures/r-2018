--- 
layout: default 
title: Clase 12
--- 


# Manejando listas con `purrr`


# Funciones `*map*()` de `purrr`

<img style="WIDTH:800px; HEIGHT:600px; border:0" src="./figs/purrr-apply.png">


## `map(.x, .f, ...)`

Como `lapply`, aplica la función `f` a los elementos de la lista `x`.

    x1 <- list(
      c(0.27, 0.37, 0.57, 0.91, 0.20),
      c(0.90, 0.94, 0.66, 0.63, 0.06), 
      c(0.21, 0.18, 0.69, 0.38, 0.77)
    )
    map(x1, max)
    [[1]]
    [1] 0.91
    
    [[2]]
    [1] 0.94
    
    [[3]]
    [1] 0.77


## Atajos

Puedo pasar fórmulas, nombres o posiciones a `map()`:

    ## Puedo pasar funciones:
    models <- mtcars %>% 
      split(.$cyl) %>% 
      map(function(df) lm(mpg ~ wt, data = df))
    
    ## O directamente una *fórmula de un solo lado*:
    models <- mtcars %>% 
      split(.$cyl) %>% 
      map(~lm(mpg ~ wt, data = .))

    ## Puedo pasar argumentos con subsetting:
    models %>% 
      map(summary) %>% 
      map_dbl(~.$r.squared)
    
    ## O pasar directamente el nombre:
    models %>% 
      map(summary) %>% 
      map_dbl("r.squared")

    ## Finalmente, puedo hacer pasar posiciones:
    x <- list(list(1, 2, 3), list(4, 5, 6), list(7, 8, 9))
    x %>% map_dbl(2)
    #[1] 2 5 8


## Funciones `*map*()` de `purrr`

Con `purrr`, uno siempre elige explícitamente el tipo de salida.

<img style="WIDTH:800px; HEIGHT:450px; border:0" src="./figs/purrr-apply-output.png">


### Ejemplos de salidas de `map()`

    map_dbl(x1, max)
    [1] 0.91 0.94 0.77
    map_chr(x1, max)
    [1] "0.910000" "0.940000" "0.770000"


## `map2(.x, .y, .f, ...)`

Si tengo dos listas como input, uso `map2`.

    mu <- list(5, 10, -3)
    sigma <- list(1, 5, 10)
    map2(mu, sigma, rnorm, n = 5) %>% str()
    #> List of 3
    #>  $ : num [1:5] 4.78 5.59 4.93 4.3 4.47
    #>  $ : num [1:5] 10.85 10.57 6.02 8.82 15.93
    #>  $ : num [1:5] -1.12 7.39 -7.5 -10.09 -2.7

<img style="WIDTH:450px; HEIGHT:200px; border:0" src="./figs/lists-map2.png">


## `pmap(.l, .f, ...)`

Para más argumentos que dos, tenemos `pmap()`.

    n <- list(1, 3, 5)
    mu <- list(5, 10, -3)
    sigma <- list(1, 5, 10)
    
    args1 <- list(n, mu, sigma)
    args1 %>%
      pmap(rnorm) %>% 
      str()
    #> List of 3
    #>  $ : num 4.55
    #>  $ : num [1:3] 13.4 18.8 13.2
    #>  $ : num [1:5] 0.685 10.801 -11.671 21.363 -2.562

<img style="WIDTH:450px; HEIGHT:200px; border:0" src="./figs/lists-pmap-named.png">


## Varias funciones? Entonces `invoke_map(.f, .x, ...)`

    f <- c("runif", "rnorm", "rpois")
    param <- list(
      list(min = -1, max = 1), 
      list(sd = 5), 
      list(lambda = 10)
    )
    invoke_map(f, param, n = 5) %>% str()
    #> List of 3
    #>  $ : num [1:5] 0.762 0.36 -0.714 0.531 0.254
    #>  $ : num [1:5] 3.07 -3.09 1.1 5.64 9.07
    #>  $ : int [1:5] 9 14 8 9 7

<img style="WIDTH:450px; HEIGHT:200px; border:0" src="./figs/lists-invoke.png">


# `walk()`, `walk2()` y `pwalk()`

Uso estas funciones cuando no me importa el valor de retorno, si no un efecto secundario como una información en pantalla o un archivo que se guarda. Estas funciones devuelven (invisiblemente) el mismo objeto que reciben, por lo que es posible usarlas en medio de un *pipe*.

    library(ggplot2)
    plots <- mtcars %>% 
      split(.$cyl) %>% 
      map(~ggplot(., aes(mpg, wt)) + geom_point())
    
    ## usamos str_c para agregar extensión
    paths <- stringr::str_c(names(plots), ".pdf")
    
    ## ejecuto ggsave(filename, plot) simultáneamente
    pwalk(list(paths, plots), ggsave, path = tempdir())


# Filtros

Tenemos un número de funciones para filtrar listas, de acuerdo a *predicados* `.p`.

<img style="WIDTH:400px; HEIGHT:450px; border:0" src="./figs/purrr-filter.png">


# Resúmenes

Del mismo modo, tenemos algunas funciones para seleccionar subconjuntos de elementosm de acuerdo a criterios.

<img style="WIDTH:400px; HEIGHT:450px; border:0" src="./figs/purrr-summarise.png">


# Trasformaciones

Finalmente, podemos modificar subconjuntos de elementos de acuerdo a criterios (posición, etc.).

<img style="WIDTH:500px; HEIGHT:500px; border:0" src="./figs/purrr-transform.png">


# Datos anidados: `nest()`

A veces es útil tener listas rectangulares donde el contenido de las celdas son a su vez listas. Es una manera de jerarquizar los datos conservando sus relaciones.

<img style="WIDTH:500px; HEIGHT:500px; border:0" src="./figs/purrr-nest.png">


# Datos anidados: `nest()`

Ejemplo de *workflow* en el que usamos listas anidadas y manipulamos con `purrr`.

<img style="WIDTH:1600px; HEIGHT:450px; border:0" src="./figs/purrr-nest2.png">


# Práctica `purrr`

1.  Usar las funciones `map()` para:
    -   Calcular la media de cada columna de `mtcars`.
    -   Determinar el tipo de cada columna de `nycflights13::flights`.
    -   Calcular la cantidad de valores únicos de cada columna de `iris`.
    -   Generar 10 números aleatorios para  mu=−10, 0, 10, y 100.
2.  Con los datos de `airqualilty`, para cada mes, hacer una regresión
    lineal del ozono como variable respuesta y temperatura como
    variable explicativa. Del resultado, extraer un vector de *doubles*
    que contenga el elemento 'adj.r.squared' del modelo
    resultante. Preferentemente, escribir todo el procesado en una
    línea utilizando *pipes* y `purrr`.

