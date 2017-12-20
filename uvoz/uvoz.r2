# 2. faza: Uvoz podatkov

# Uvozim podatke o uvozu in izvozu iz excela


uvoz <- read_excel(file = 'importFuel.xls')


izvoz <- read_excel(file = 'exportFuel.xls')






#Uvozim podatke o BDPju

BDP <- read.csv(file = 'BDPpodatki.csv',
              header = TRUE,
              skip = 3, na = c('',' ','-'))
              
              
#Uvozim podatke o gibanju cen nafte
#ne znam, treba iz formata xml, praši asistenta

#Uvozim podatke o gibanju vrednosti valut v primerjavi s SDR

valute <- read.csv(file = 'PodatkiOValutah.csv')
