# 2. faza: Uvoz podatkov

# Uvozim podatke o uvozu in izvozu iz excela
uvozi_trgovanje <- function(mapa) {
  uvozeno <- read_excel(mapa,col_names = FALSE)
  visina <- dim(uvozeno)[1]
  sirina <- dim(uvozeno)[2]
  tabela <- array(,c(sirina-1,3))
  for(vrstica in 1:visina){
    for(stolpec in 2:sirina){
      tabela[stolpec-1,1] <- unlist(uvozeno[vrstica,1])
      tabela[stolpec-1,2] <- as.numeric(uvozeno[1,stolpec])
      tabela[stolpec-1,3] <- as.numeric(uvozeno[vrstica,stolpec])
    }
  }
  return(tabela)
}
  
uvoz <- uvozi_trgovanje('podatki/importFuel.xls')




izvoz <- uvozi_trgovanje('podatki/exportFuel.xls')






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

xmlfile2 <- xmlTreeParse('http://www.opec.org/basket/basketDayArchives.xml')
topxml <- xmlRoot(xmlfile2)
topxml <- xmlSApply(topxml,xmlValue)
xml_df <- data.frame(t(topxml),row.names = NULL)



#Uvozim podatke o gibanju vrednosti valut v primerjavi z valuto SDR
uvozi_valute <- function(mapa){
  uvozeno <- read_excel(mapa,col_names = FALSE)
  visina <- dim(uvozeno)[1]
  sirina <- dim(uvozeno)[2]
  tabela <- array(,c(visina-3,3))
  for(stolpec in 2:sirina){
    for(vrstica in 3:visina-1){
      tabela[vrstica-2,1] <- unlist(uvozeno[3,stolpec])
      tabela[vrstica-2,2] <- suppressWarnings(as.numeric(uvozeno[vrstica + 1,1]))
      tabela[vrstica-2,3] <- suppressWarnings(as.numeric(uvozeno[vrstica+1,stolpec]))
    }
  }
  return(tabela)
}

  
valute <- uvozi_valute('podatki/PodatkiOValutah.xlsx')
