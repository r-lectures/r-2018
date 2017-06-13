--- 
layout: default 
title: Clase 14
--- 


# Repaso de clase anterior

<span class="underline">R en Biología</span>

Existe una enorme intersección entre estadística y algunas áreas de la biología, como la
genética. Por esto, la bioinformática fue una de las principales áreas en adoptar R fuera de la
comunidad estadística inicial.

-   R en Bioestadística
-   R en Bioinformática
    -   [Bioconductor](http://www.bioconductor.org/)
    -   Bioinformática y Genética


# R y bases de datos

R puede acceder a distintos tipos de bases de datos (DBMSs - Database Management Systems): Microsoft
SQL Server, Microsoft Access, MySQL, Oracle, PostgreSQL, DB2 de IBM, Sybase, Teradata, and SQLite.

Se puede 'hablar' con estas bases de datos con interfaces (protocolos) como ODBC con el paquete
RODBC. Existen otras alternativas, por ejemplo, JODBC, RMySQL, ROracle, RPostgreSQL y RSQLite.

-   Ejemplo con RODBC. Asegurarse de instalar el paquete y los drivers OBDC correspondientes.

    library(RODBC)
    ## abro una conexión a la base de datos OBDC
    myconn <-odbcConnect("mydsn", uid="Rob", pwd="aardvark")
    ## bajo datos
    crimedat <- sqlFetch(myconn, Crime)
    ## hago una 'query': selecciono todo de la tabla Punishment
    pundat <- sqlQuery(myconn, "select * from Punishment")
    ## cierro conexión
    close(myconn)


# R en Física

Al igual que otras áreas, R es usado en Física directamente o a través de paquetes
especializados. Algunos ejemplos de [CRAN Task View: Chemometrics and Computational Physics](https://cran.r-project.org/web/views/ChemPhys.html):

-   Self-Organizing Maps
-   Differential Equations
-   Cellular Automata
-   Thermodynamics
-   Mass Spectrometry
-   Functional Magnetic Resonance Imaging
-   Carbon Dating
-   X-Ray Diffractograms
-   Optics and Scattering Approximations
-   Energy Modeling
-   Positron Emission Tomography
-   etc.


## Física computacional

-   [Computational Physics with Maxima or R](http://web.csulb.edu/~woollett/#cpmr): libro que hace uso de R en aplicaciones de Física.
-   [Data analysis and graphing in an introductory physics laboratory: spreadsheet versus statistics
    suite](http://iopscience.iop.org/article/10.1088/0143-0807/31/4/021/meta): comparación de softwares en el laboratorio. Meritos y limitaciones.


## Física de Partículas

-   [RootTreeToR](https://cdcvs.fnal.gov/redmine/projects/roottreetor/wiki) - paquete R para interactuar con ROOT ([Fermilab](http://user2007.org/program/presentations/lyon.pdf))
    -   Combina llamadas a ROOT para analizar datos pequeños en R
-   [ML in particle Physics with R](http://andrewjohnlowe.github.io/LHC-ML-WG-1/#/slide-1)
-   [aidar](https://github.com/apfeiffer1/aidar) - interface para AIDA (Abstract Interfaces for Data Analysis)


## Astronomía

[Paquetes para astronomía en ASAIP](https://asaip.psu.edu/forums/software-forum/459833927) - Astrostatistics and Astroinformatics Portal 

-   astro: Funciones astronómicas, herramientas y algoritmos
-   astrodatR: Datos astronomicos
-   astroFns: Funciones de tiempo y posición
-   astrolibR: Biblioteca de usuarios
-   celestial: Colección de algoritmos de conversión frecuentes
-   &#x2026; y 20 paquetes más


## Usos específicos de R:

1.  [soilphysics](https://cran.r-project.org/web/packages/soilphysics/index.html): Análisis y modelado de física de suelos
2.  [planar: Multilayer Optics](https://cran.r-project.org/web/packages/planar/index.html): Resuelve el problema electromagnético de reflexión y transmisión en una
    interface planar multicapa
3.  [simecol:](https://cran.r-project.org/web/packages/simecol/index.html) Simulación de sistemas dinámicos para ecología
4.  [igraph](http://igraph.org/r) - Grafos y redes
    
        library(igraph) # Cargo el paquete en la sesión
        ba <-  sample_pa(n=100, power=1, m=1,  directed=F) ## creo una red tipo modelo Barabási-Albert
        plot(ba, vertex.size=6, vertex.label=NA) ## hago una figura de la red
    
    <img style="WIDTH:400px; HEIGHT:300px; ANGLE:90" src="./figs/ba.png">

5.  etc.

