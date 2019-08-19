# 3. faza: Vizualizacija podatkov

#Tabele:

izvoz2013 <- izvoz %>% filter(Leto == '2013')
uvoz2013 <- uvoz %>% filter(Leto == '2013')
BDP2013 <- BDP %>% filter(Leto == '2013')


#Grafi:
graf.uvoz2013 <- ggplot(uvoz2013, aes(x = Drzava, y = Vrednost)) + 
  geom_col() + xlab('Država') + ylab('Uvoz') + ggtitle('Uvoz dr?av')

#histogram_uvoza <- hist(t(uvoz2013[3]),breaks = 8)

ggplot(uvoz2013, aes(dist, delay)) + 
  geom_point(aes(size = count),alpha = 1/2) + 
  geom_smooth() + scale_size_area()


#Graf uvoza za ZDA in Kitajsko

# graf.uvoz.obe <- ggplot(data=uvoz.ZDA, 
#                         aes(x=Leto,
#                             y=Vrednost, group=1)) +
#   geom_line(color = 'blue')+
#   geom_point(color = 'blue') +
#   geom_point(data = uvoz.kitajska,
#              aes(x = Leto, y = Vrednost),
#              color = 'red') + 
#   geom_line(data = uvoz.kitajska, color = 'red') + 
#   scale_colour_manual('',breaks = c('ZDA', 'Kitajska'),
#                       values = c('blue','red')) +
#   labs(title = 'Uvoz')

#Graf izvoza za Irak in Savdsko Arabijo

# graf.izvoz.obe <- ggplot(data=izvoz.irak, 
#                          aes(x=Leto,
#                              y=Vrednost, group=1)) +
#   geom_line(color = 'green')+
#   geom_point(color = 'green') +
#   geom_point(data = izvoz.SA,
#              aes(x = Leto, y = Vrednost),
#              color = 'black') + 
#   geom_line(data = izvoz.SA, color = 'black') + 
#   scale_colour_manual('',breaks = c('Irak', 'Savdska Arabija'),
#                       values = c('green','black')) +
#   labs(title = 'Izvoz')

#Graf BDP-ja Iraka in Savdske Arabije

# graf.BDP.obe <- ggplot(data=BDP.irak, 
#                        aes(x=Leto,
#                            y=BDP, group=1)) +
#   geom_line(color = 'green')+
#   geom_point(color = 'green') +
#   geom_point(data = BDP.SA,
#              aes(x = Leto, y = BDP),
#              color = 'black') + 
#   geom_line(data = BDP.SA, color = 'black') + 
#   scale_colour_manual('',breaks = c('Irak', 'Savdska Arabija'),
#                       values = c('green','black')) +
#   labs(title = 'BDP')

#Graf cen
# graf.cen <- ggplot(Cene, aes(Datum, Vrednost)) + 
#   geom_line() + xlab('Cas') + ylab('Cena nafte')

#Grafi za valute
# graf.valut.evro <- ggplot(tabela.evro, aes(Datum, Vrednost)) + 
#   geom_line() + xlab('Cas') + ylab('Vrednost evra')
# 
# graf.valut.SA <- ggplot(tabela.SA, aes(Datum, Vrednost)) + 
#   geom_line() + xlab('Cas') + ylab('Vrednost SA riala')
# 
# graf.vrednosti <- ggplot(data=tabela.evro, 
#                         aes(x=Datum,
#                             y=Vrednost, group=1)) +
#   geom_line(color = 'blue')+
#   geom_line(data = tabela.SA, color = 'red') + 
#   geom_line(data = tabela.dolar, color = 'green') +
#   labs(title = 'Vrednost')







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
zemljevid <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_map_units.zip",
                            "ne_110m_admin_0_map_units", encoding = "UTF-8") %>%
  pretvori.zemljevid()

zemljevid.BDP <- ggplot() + geom_polygon(data=zemljevid %>% left_join(BDP2013, by=c("SOVEREIGNT"="Drzava")),
                        aes(x=long, y=lat, group=group, fill=BDP / 1e12)) +
  guides(fill=guide_colorbar("BDP v milijardah dolarjev"))






