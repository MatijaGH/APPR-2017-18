# 2. faza: Uvoz podatkov

# Uvozim podatke o uvozu in izvozu iz excela
require('xlsx')
uvoz <- read_excel(file = 'importFuel.xls')


izvoz <- read_excel(file = 'exportFuel.xls')






#Uvozim podatke o BDPju
BDP <- read.csv(file = 'BDPpodatki.csv',
              header = TRUE,
              skip = 3, na = c('',' ','-'))
