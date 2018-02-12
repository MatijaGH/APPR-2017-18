# 2. faza: Uvoz podatkov

# Uvozim podatke o uvozu in izvozu iz excela
uvozi_excel <- function(mapa) {
  read_excel(mapa)
}
  

uvoz <- uvozi_excel('podatki/importFuel.xls')

izvoz <- uvozi_excel('podatki/exportFuel.xls')






#Uvozim podatke o BDPju
uvozi_BDP <- function(mapa) {
  BDP <- read.csv(file = mapa, skip = 4, header = TRUE,
                  na = c('','NY.GDP.MKTP.CD'),
                  colClasses = c(NA,'NULL','NULL','NULL'))
}

BDP <- uvozi_BDP('podatki/BDP2podatki.csv')

#Uvozim podatke o gibanju cen nafte

xmlfile <- xmlParse('http://www.opec.org/basket/basketDayArchives.xml')
xmltop <- xmlRoot(xmlfile)
Cene <- ldply(xmlToList('http://www.opec.org/basket/basketDayArchives.xml'),
              data.frame)
Cene <- Cene[,2]



#Uvozim podatke o gibanju vrednosti valut v primerjavi z valuto SDR
uvozi_valute <- function(mapa) {
  valute <- read.csv(file = mapa, header = TRUE, na = c('',' ','-'))
}

valute <- uvozi_excel('podatki/PodatkiOValutah.xlsx')