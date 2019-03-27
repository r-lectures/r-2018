

# 1er parcial

`8 de Abril`


## El parcial

-   habrá dos problemas, con varios puntos cada uno
-   durará dos horas
-   estará disponible cualquier material online y offline
-   no podrán consultarse entre sí


# repaso de la clase anterior


## principales funciones dplyr

-   `select()`: seleccionar columnas
-   `arrange()`:reordenar filas
-   `filter()`: filtrar observaciones por sus valores
-   `mutate()`: crear variables a partir de otras
-   `summarise()`: reducir varios valores a uno solo
    (muchas veces agrupamos primero con `group_by`)


# %>%


## *Piping*  con  *Magrittr*

    x %>% f en vez de f(x) # el valor de x se direcciona a f()

    x %>% f(., arg2, arg3) # por default pasa al 1er argumento
    x %>% f(arg2, arg3)    # por lo tanto, puede obviarse el punto
    x %>% f(arg1, ., arg3) # puede usarse el punto para direccionar a otro lado


## Ejemplos

    arrange(filter(mutate(mean_by_state, frac = mean/overall_mean), frac >= 1), desc(frac))
    
    
    mean_by_state %>% # mi data.frame
    mutate(frac = mean/overall_mean) %>% # creo la columna frac
    filter(frac >= 1) %>% # filtro la columna frac
    arrange(desc(frac)) # ordeno de mayor a menor


# más dplyr


## combinando data.frames (sin llaves)

<img src="./figs/binds.png">


## combinando data.frames (con llaves)

<img style="WIDTH:500px; HEIGHT:420px; border:0" src="./figs/joins.png">

<img style="position:absolute; TOP:100px; LEFT:750px; WIDTH:400px; HEIGHT:150px; border:0" src="./figs/sets.png">

-   miren con cuidado el cheat-sheet de dplyr


# lectura/escritura

"read\_csv()" lee un archivo delimitado por comas.

    read_csv(readr_example("mtcars.csv"))
    read_csv(readr_example("mtcars.csv.zip"))
    read_csv(readr_example("mtcars.csv.bz2"))
    read_csv("https://github.com/tidyverse/readr/raw/master/inst/extdata/mtcars.csv")

Se pueden controlar cosas como col\_types, col\_names, delim, skip, n\_max, y otros. 

Existe una "write\_csv" equivalente.


# práctica 4

Descargar [práctica 4](https://r-lectures.github.io/assets/R2019-practice-4-fhpjfraw2t.pdf).

