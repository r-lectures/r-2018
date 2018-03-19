---
 layout: default
 title: Datos
 weight: 7
---


# Datasets

Se irán agregando items, sugerencias bienvenidas.

-   R built-in datasets - [credit: answer from Jaap in stackoverflow](http://stackoverflow.com/questions/33797666/how-to-get-a-list-of-built-in-data-sets-in-r)
    1.  Using data() will give you a list of the datasets of all loaded packages (and not only the ones
        from the datasets package); the datasets are order by package
    2.  Using data(package = .packages(all.available = TRUE)) will give you a list of all datasets in
        the available packages on your computer (i.e. also the not-loaded ones)
    3.  Using data(package = "packagename") will give you the datasets of that specific package, so
        data(package = "plyr") will give the datasets in the plyr package
        Example: 
        
            # Built-in datasets
            data()
            data(ToothGrowth)
            ?ToothGrowth
            ToothGrowth
            summary(ToothGrowth)
            plot(ToothGrowth)
-   [Explore Packages Currently on CRAN (search for "dataset")](https://mran.microsoft.com/packages/)
-   [open data mendoza](http://ckan.ciudaddemendoza.gov.ar/)
-   [buenos aires data](https://data.buenosaires.gob.ar/) - Iniciativa de Datos Públicos y Transparencia de la Ciudad Autónoma de Buenos Aires.
-   [data.gov.uk - opening up government](https://data.gov.uk)
-   [Dados Abertos Curitiba](http://www.curitiba.pr.gov.br/dadosabertos/consulta/)
-   [Berkeley Earth](http://berkeleyearth.org/data/)
-   [Linked Brazilian Amazon Rainforest](http://linkedscience.org/data/linked-brazilian-amazon-rainforest/)
-   [Kaggle Climate Change: Earth Surface Temperature Data](https://www.kaggle.com/berkeleyearth/climate-change-earth-surface-temperature-data)
-   [AWS Public Datasets](https://aws.amazon.com/datasets/)
-   [Stanford Large Network Dataset Collection](https://snap.stanford.edu/data/)
-   [Penn World Table](http://www.rug.nl/ggdc/productivity/pwt/) - University of Groningen
    -   data from the Penn World Tables 9.0.
    -   PWT version 9.0 is a database with information on relative levels of income, output, input and
        productivity, covering 182 countries between 1950 and 2014
    -   Install R package called "pwt9"
-   [Kaggle - 2016 US Election](https://www.kaggle.com/benhamner/2016-us-election)
-   [Death in the United States](https://www.kaggle.com/cdc/mortality)
-   [Data Gov -  191,705 datasets](https://catalog.data.gov/dataset)
    -   [U.S. Chronic Disease Indicators (CDI)](https://catalog.data.gov/dataset/u-s-chronic-disease-indicators-cdi-e50c9)
-   [Shelter Animal Outcomes](https://www.kaggle.com/c/shelter-animal-outcomes/data)
-   [Facebook V: Predicting Check Ins](https://www.kaggle.com/c/facebook-v-predicting-check-ins/data)
-   [Free ebooks by Project Gutenberg](http://www.gutenberg.org/)
-   [Football Stats and History](http://www.pro-football-reference.com/)
-   [Basketball Stats and History](http://www.basketball-reference.com/)
-   [Baseball Stats and History](http://www.baseball-reference.com/)
-   [Bag of Words Data Set](http://archive.ics.uci.edu/ml/datasets/Bag+of+Words)

