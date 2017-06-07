--- 
layout: default 
title: Clase 13
--- 


# Profe invitado: Dr. Diego Bustos - Bioinformática


# R en Biología

Existe una enorme intersección entre estadística y algunas áreas de la biología, como la
genética. Por esto, la bioinformática fue una de las principales áreas en adoptar R fuera de la
comunidad estadística inicial.


## R en Bioestadística

Análisis estadístico (tradicional) aplicado a biología, en particular en áreas como la farmacéutica,
la epidemiología, etc. con énfasis en datos empíricos. Incluye temas generales como:

-   Tests de hipótesis
-   Estimación de intervalos
-   Análisis de Variancia
-   Modelado
-   Diseño experimental y métodos de *sampling*
-   etc.

<span class="underline">Referencias</span> (#bibliografía)

1.  "Biostatistical Design and Analysis Using R: A Practical Guide", Logan, 2010
2.  "Introduction to Biostatistics", Winner,  2004


## R en Bioinformática


### [Bioconductor](http://www.bioconductor.org/)

-   Es un proyecto de código libre y abierto para la comprensión y el análisis de datos genéticos
    generados en laboratorio en experimentos de biología molecular.
-   Está basado en R y funciona desde 2001.
-   Tiene su propio gestor de paquetes, \`biocLite()\`
-   Contiene (1200+) paquetes para:
    -   Análisis estadistico
    -   Métodos gráficos
    -   Secuenciamiento y *Gene annotation* - mapeo de la ubicación y función de genes
    -   Acceso a otros tipos de metadata
    -   Cursos y otros recursos
    -   Soporte/Comunidad

-   Ejemplo: paquete GenomicRanges

    Representación y manipulación de intervalos genómicos y variables definidas a lo largo de un genoma
    
    <img style="WIDTH:500px; HEIGHT:420px; border:0" src="./figs/genomicranges.png">
    
    -   Contiene funciones como findOverlaps(), nearest(), y otras operaciones útiles basadas en rangos del genoma
    -   Más en este [link](http://bioconductor.org/packages/release/bioc/vignettes/GenomicRanges/inst/doc/GenomicRangesIntroduction.R)


### Genética

-   Paquete core [*genetics*](https://cran.r-project.org/web/packages/genetics/index.html)
-   [Genética de poblaciones con R](https://grunwaldlab.github.io/Population_Genetics_in_R/index.html)
-   [CRAN Task View: Statistical Genetics](https://cran.r-project.org/web/views/Genetics.html): genética de poblaciones, filogenética, linkage, GWAS, etc.
-   [R packages from Divison of Biostatistics, Mayo Clinic](http://www.mayo.edu/research/departments-divisions/department-health-sciences-research/division-biomedical-statistics-informatics/software/s-plus-r-functions)

