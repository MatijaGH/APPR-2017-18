# 3. faza: Vizualizacija podatkov

#Tabele:

izvoz2013 <- izvoz %>% filter(Leto == '2013')
uvoz2013 <- uvoz %>% filter(Leto == '2013')
BDP2013 <- BDP %>% filter(Leto == '2013')


#Grafi:
graf.uvoz2013 <- ggplot(uvoz2013, aes(x = Drzava, y = Vrednost)) + 
  geom_col() + xlab('Država') + ylab('Uvoz') + ggtitle('Uvoz držav')

histogram_uvoza <- hist(t(uvoz2013[3]),breaks = 8)






# Uvozimo zemljevid.
#zemljevid <- uvozi.zemljevid("http://baza.fmf.uni-lj.si/OB.zip",
#                             "OB/OB", encoding = "Windows-1250")
#levels(zemljevid$OB_UIME) <- levels(zemljevid$OB_UIME) %>%
#  { gsub("Slovenskih", "Slov.", .) } %>% { gsub("-", " - ", .) }
#zemljevid$OB_UIME <- factor(zemljevid$OB_UIME, levels = levels(obcine$obcina))
#zemljevid <- pretvori.zemljevid(zemljevid)

# IzraÄunamo povpreÄno velikost druÅ¾ine
#povprecja <- druzine %>% group_by(obcina) %>%
#  summarise(povprecje = sum(velikost.druzine * stevilo.druzin) / sum(stevilo.druzin))

#uvozimo zemljevid sveta
#zemljevid <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_map_units.zip",
#                             "ne_110m_admin_0_map_units", encoding = "UTF-8") %>%
#  pretvori.zemljevid()





