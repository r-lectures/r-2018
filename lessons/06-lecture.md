--- 
layout: default 
title: Clase 6
--- 


# emma habla de caret


# repaso de la clase anterior


## RStudio

-   Working directory / Workspace
    
        getwd() # para saber donde estoy
        setwd("path/to/dir") # para decirle donde quiero estar
-   Proyectos: Conjunto de archivos que van juntos: miproyecto.Rproj, .RData, .Rsession, etc
-   Cómo grabo lo que hago?

<ol class="smallfont">
  <li>abrir un proyecto nuevo y grabar después</li>
  <li>grabar en algún directorio y después decirle que haga un proyecto ahí</li>
  <li>sin proyectos, gestionar todo uno mismo (no muy recomendado)</li>
</ol>

<div class="NOTES">
-   <https://support.rstudio.com/hc/en-us/articles/200526207-Using-Projects>
-   Usen atajos de teclado! Ver machete de RStudio (cheatsheet) en Slack

</div>


## Funciones

<div class="NOTES">
Una función tiene como propósito encapsular y automatizar tareas que se repetirón, posiblemente 
sobre objetos distintos cada vez. Por ejemplo, la función \`read\_csv\` o \`plot\` contiene código que no
querríamos escribir cada vez que queremos cargar datos de un archivo csv o hacer un gráfico. A su
vez, con ellas podemos cargar datos de cualquier archivo csv o hacer cualquier gráfico.

Más información en <http://r4ds.had.co.nz/functions.html>.

</div>

    # mi función se llama alta_funcion, con dos argumentos
    alta_funcion <- function(arg1 = 10, arg2 = TRUE, ...){
    
      # acá empieza mi código
      library(paquete_externo)
      x <- funcion_externa(arg_ext = arg1) 
      ...
      alto código
      código y más código
      ...
      alto_resultado <- mansa_funcion(arg2) # genero alto_resultado
    
      return(alto_resultado) # devuelvo alto resultado
    }

    # llamo a mi función de distintas maneras
    x_default <- alta_funcion() # uso arg1 = 10 y arg2 = TRUE
    x_100_F   <- alta_funcion(100, FALSE)
    x_200_T   <- alta_funcion(200, TRUE)
    mi_var    <- alta_funcion(arg2 = FALSE, arg_ext = 10.2) # uso arg1 = 10


# repaso de la práctica 5

Trabajamos sobre datos de ruido de Buenos Aires Data. 

1.  Escribir una función que devuelva el min, máx y promedio (mean) del ruido dependiendo del barrio
    
        myf <- function() {
           min  <- summarise(group_by(ruido_bsas, BARRIO), em = min(PROMEDIO_ENERGETICO_HORA, na.rm = TRUE))
           mean <- summarise(group_by(ruido_bsas, BARRIO), em = mean(PROMEDIO_ENERGETICO_HORA, na.rm = TRUE))
           max  <- summarise(group_by(ruido_bsas, BARRIO), em = max(PROMEDIO_ENERGETICO_HORA, na.rm = TRUE))
           return(list(min, mean, max)) # return(c(min, mean, max)) #
        }

2.  Porqué obtengo un `NA` en los resultados de la práctica anterior?
    
        # there are many empty measures
        which(is.na(ruido_bsas$PROMEDIO_ENERGETICO_HORA))
        # or, alternatively
        m2013 %>% group_by(PROMEDIO_ENERGETICO_HORA) %>% summarise(n()) %>% print( n = Inf ) # 2011, 2012 también tienen
        # and also, some TMIs in measures are missing in reference table (2012 and 2013)
        missing2011 <- m2011$TMI %>% unique %in% tmi$TMI
        tmi[which(!missing2011), ]
        missing2012 <- m2012$TMI %>% unique %in% tmi$TMI
        tmi[which(!missing2012), ]
        missing2013 <- m2013$TMI %>% unique %in% tmi$TMI
        tmi[which(!missing2013), ]
        # which ones? 
        anti_join(ruido_bsas, tmi, by = "TMI" ) %>% select(TMI) %>% unique()
    
    1.  Usar lo aprendido sobre joins para no tener este `NA`
    
        ruido_bsas_inner <- inner_join(ruido_bsas, tmi)
        ruido_barrios_inner <- ruido_bsas_inner %>% group_by(BARRIO) %>% summarise(ruido_avg = mean(PROMEDIO_ENERGETICO_HORA, na.rm = TRUE)) %>% arrange(desc(ruido_avg))
3.  Cómo puedo mejorar la columna FECHA de la práctica 3? Consejo: usar el paquete `stringr` más `tidyr::separate`
    
        expanded_ruido_bsas <- ruido_bsas_inner %>% separate(FECHA, into = c("date", "h"), sep = " ") %>% separate(date, into = c("d", "m", "y"), sep = "/")
4.  Cuál es la hora de mayor ruido del día? Cuál es el dia más ruidoso de la semana? Hay algún barrio
    con mucho más ruido durante el fin de semana que el resto?
    
        # hora del dia de más ruido
        summarise(group_by(expanded_ruido_bsas, h), mh = mean(PROMEDIO_ENERGETICO_HORA, na.rm = TRUE)) %>% arrange(desc(mh))
        
        # dia más ruidoso de la semana  
        semi_ruido_bsas <- ruido_bsas_inner %>% separate(FECHA, into = c("date", "h"), sep = " ") 
        daily_em <- summarise(group_by(semi_ruido_bsas, date), me = mean(PROMEDIO_ENERGETICO_HORA, na.rm = TRUE))
        daily_em_unique <- summarise( group_by( daily_em, date ), me = mean( me ) ) %>% separate(date, into = c("d", "m", "y"), sep = "/") %>% arrange( y, m, d)
        
        # 275 dias de 2011, 366 de 2012 y 212 de 2013, 853 dias en total
        # los datos empiezan el 1 de abril de 2011, un Viernes
        week <- c("Vie", "Sab", "Dom", "Lun", "Mar", "Mie", "Jue")
        wday <- tbl_df(rep(week, 122)[1:853]) # alternativamente dos concatenates, c(rep(week, 121),  c("Vie", "Sab", "Dom", "Lun", "Mar", "Mie"))
        names(wday) <- "wday"
        
        daily_em_unique <- bind_cols(daily_em_unique, wday)
        summarise( group_by(daily_em_unique, wday), me_wday = mean(me, na.rm = TRUE))
        
        # cuidado con las mediciones 
        ## semi_ruido_bsas %>% group_by(date) %>% separate(date, into = c("d", "m", "y"), sep = "/") %>% filter(y == '2013', m == '01') 
        ## semi_ruido_bsas %>% group_by(date) %>% separate(date, into = c("d", "m", "y"), sep = "/") %>% filter(y == '2013', m == '02') 
        ## semi_ruido_bsas %>% group_by(date) %>% separate(date, into = c("d", "m", "y"), sep = "/") %>% filter(y == '2013', m == '08')


# vectores

There are two types of vectors:

Atomic vectors, of which there are six types: logical, integer, double, character, complex, and raw. Integer and double vectors are collectively known as numeric vectors.

Lists, which are sometimes called recursive vectors because lists can contain other lists.

The chief difference between atomic vectors and lists is that atomic vectors are homogeneous, while
lists can be heterogeneous. There’s one other related object: NULL. NULL is often used to represent
the absence of a vector (as opposed to NA which is used to represent the absence of a value in a
vector). NULL typically behaves like a vector of length 0. 

<div class="html">
<img src="figs/data-structures-overview.png">

</div>


# tipos de datos


# *subsetting*

