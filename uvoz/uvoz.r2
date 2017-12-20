# 2. faza: Uvoz podatkov

# Uvozim podatke o uvozu in izvozu iz excela


uvoz <- read_excel('importFuel.xls')


izvoz <- read_excel('exportFuel.xls')






#Uvozim podatke o BDPju

BDP <- read_excel('BDPpodatki.xlsx',
              header = TRUE,
              skip = 3, na = c('',' ','-'))
              
              
#Uvozim podatke o gibanju cen nafte

nafta <- xmlParse('http://www.opec.org/basket/basketDayArchives.xml')
xml_nafta <- xmlToList(nafta)


#Uvozim podatke o gibanju vrednosti valut v primerjavi s SDR

valute <- read.csv(file = 'PodatkiOValutah.csv', 
              header = TRUE,
              na = c('',' ','-'))
