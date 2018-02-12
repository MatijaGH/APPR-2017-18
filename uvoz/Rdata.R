# 2. faza: Uvoz podatkov

# Uvozim podatke o uvozu in izvozu iz excela
uvozi_excel <- function(mapa) {
  read_excel(mapa)
}
  

uvoz <- uvozi_excel('podatki/importFuel.xls')

izvoz <- uvozi_excel('podatki/exportFuel.xls')






#Uvozim podatke o BDPju
BDP <- read.csv(file = 'BDP2podatki.csv',skip = 4,header = TRUE,
                na = c('','NY.GDP.MKTP.CD'),
                colClasses = c(NA,'NULL','NULL','NULL'))


#Uvozim podatke o gibanju cen nafte

xmlfile <- xmlParse('http://www.opec.org/basket/basketDayArchives.xml')
xmltop <- xmlRoot(xmlfile)
Cene <- ldply(xmlToList('http://www.opec.org/basket/basketDayArchives.xml'),
              data.frame)
Cene <- Cene[,2]



#Uvozim podatke o gibanju vrednosti valut v primerjavi z valuto SDR

valute <- read.csv(file = 'PodatkiOValutah.csv', 
              header = TRUE,
              na = c('',' ','-'))