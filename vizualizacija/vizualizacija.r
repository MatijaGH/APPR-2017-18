# 3. faza: Vizualizacija podatkov

# Uvozimo zemljevid.
#zemljevid <- uvozi.zemljevid("http://baza.fmf.uni-lj.si/OB.zip",
#                             "OB/OB", encoding = "Windows-1250")
#levels(zemljevid$OB_UIME) <- levels(zemljevid$OB_UIME) %>%
#  { gsub("Slovenskih", "Slov.", .) } %>% { gsub("-", " - ", .) }
#zemljevid$OB_UIME <- factor(zemljevid$OB_UIME, levels = levels(obcine$obcina))
#zemljevid <- pretvori.zemljevid(zemljevid)

# Izračunamo povprečno velikost družine
#povprecja <- druzine %>% group_by(obcina) %>%
#  summarise(povprecje = sum(velikost.druzine * stevilo.druzin) / sum(stevilo.druzin))

#uvozimo zemljevid sveta
zemljevid <- uvozi.zemljevid('https://www.cia.gov/library/publications/the-world-factbook/attachments/images/large/world-political.jpg?1547145656',,encoding = '')
uvozi.zemljevid <- function(url, pot.zemljevida, mapa = "../zemljevidi",
                            encoding = "UTF-8", force = FALSE)
  