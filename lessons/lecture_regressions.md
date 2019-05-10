

# Regresiones


## Regresión lineal - función `lm()`

En R, para hacer una regresión lineal usamos la función `lm()`.

Al usar `lm()`, ya estamos *asumiendo* una relación lineal entre variables.

    y[i] ~ f(x[i,]) = b[1] x[i,1] + ... b[n] x[i,n]
    ## b[i] son los coeficientes, o betas

Construimos un "modelo" (una relación) entre variables dependientes e independientes optimizando
coeficientes. Son tres pasos:

1 - Propongo una relación de variables. (*Propongo una fórmula*.)

2 - Obtengo los coeficientes del modelo. (*Aplico* `lm()`.)

3 - Compruebo el ajuste a los datos. (*Obtengo el error del modelo*.)


### Ejemplito

    # Definimos una semilla, por reproducibilidad
    
    set.seed(42)
    
    # generamos valores para 'x'
    x<-seq(1, 100)
    
    # generamos 'y' siguiendo una recta, pero con ruido:
    # m*x + b
    m <- 3
    b <- 100
    y <- m*x + b
    
    plot(x, y)
    
    # agregamos 10% de ruido en cada coordenada
    # para simular una medición
    y <- y + runif(n=100, min=0, max=30)
    x <- x + runif(n=100, min=0, max=10)
    
    plot(x, y)
    
    # hacemos la regresión lineal
    modelo.lineal <- lm(y ~ x)
    
    # obtengo el error, entre otras cosas
    summary(modelo.lineal)
    
    # dibujo
    abline(modelo.lineal, col = 'red')


## Regresión no lineal

En R, para hacer una regresión no lineal usamos la función `nls()`.

Al usar `nls()`, tenemos que *definir* la función no lineal entre variables.

La lógica de la regresión, y la sintáxis del código, será similar a la vista en el caso de regresión lineal.

Construimos un "modelo" (una relación) entre variables dependientes e independientes optimizando
coeficientes. Son tres pasos:

1 - Propongo una relación de variables. (*Una fórmula + función no lineal*.)

2 - Obtengo los coeficientes del modelo. (*Aplico* `nls()`.)

3 - Compruebo el ajuste a los datos. (*Obtengo el error del modelo*.)


## Ejemplito

    # Definimos una semilla, por reproducibilidad
    
    set.seed(42)
    
    # generamos valores para 'x'
    x<-seq(1, 100)
    
    # generamos 'y' siguiendo una exponencial, pero con ruido:
    # a*exp(b*x) + c
    a <- 10
    b <- 0.03
    c <- 100
    y <- a*exp(b*x) + c
    
    plot(x, y)
    
    # agregamos 10% de ruido en cada coordenada
    # para simular una medición
    y <- y + runif(n=100, min=0, max=30)
    x <- x + runif(n=100, min=0, max=10)
    
    plot(x, y)
    
    # hacemos la regresión lineal
    modelo.nolineal <- nls(y ~ a*exp(b*x) + c, start = list(a=13, b=0.1, c=20))
    
    # obtengo el error, entre otras cosas
    summary(modelo.nolineal)
    
    # dibujo
    lines(x,predict(modelo.nolineal),col="blue")

