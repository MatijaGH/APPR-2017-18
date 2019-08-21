# 3. faza: Vizualizacija podatkov

#Tabele:

izvoz2013 <- izvoz %>% filter(Leto == '2013')
uvoz2013 <- uvoz %>% filter(Leto == '2013')
BDP2013 <- BDP %>% filter(Leto == '2013')


#Grafi:
graf.uvoz2013 <- ggplot(uvoz2013, aes(x = Drzava, y = Vrednost)) + 
  geom_col() + xlab('Država') + ylab('Uvoz') + ggtitle('Uvoz dr?av')

#Graf uvoza za ZDA in Kitajsko

graf.uvoz.obe <- ggplot(data=uvoz.ZDA,
                        aes(x=Leto,
                            y=Vrednost, group=1)) +
  geom_line(color = 'blue')+
  geom_point(color = 'blue') +
  geom_point(data = uvoz.kitajska,
             aes(x = Leto, y = Vrednost),
             color = 'red') +
  geom_line(data = uvoz.kitajska, color = 'red') +
  scale_colour_manual('',breaks = c('ZDA', 'Kitajska'),
                      values = c('blue','red')) +
  labs(title = 'Uvoz')

#Graf izvoza za Irak in Arabski svet

graf.izvoz.obe <- ggplot(data=izvoz.irak,
                         aes(x=Leto,
                             y=Vrednost, group=1)) +
  geom_line(color = 'green')+
  geom_point(color = 'green') +
  geom_point(data = izvoz.arabci,
             aes(x = Leto, y = Vrednost),
             color = 'black') +
  geom_line(data = izvoz.arabci, color = 'black') +
  scale_colour_manual('',breaks = c('Irak', 'Arabski svet'),
                      values = c('green','black')) +
  labs(title = 'Izvoz') + ylab('Izvoz v milijardah dolarjev')

#Graf BDP-ja Indije, Iraka in Savdske Arabije

graf.BDP.vse <- ggplot(data=BDP.irak,
                       aes(x=Leto,
                           y=BDP, group=1)) +
  geom_line(color = 'green')+
  geom_point(color = 'green') +
  geom_point(data = BDP.SA,
             aes(x = Leto, y = BDP),
             color = 'black') +
  geom_line(data = BDP.SA, color = 'black') +
  geom_point(data = BDP.indija, color = 'red') + 
  geom_line(data = BDP.indija, color = 'red') +
  scale_colour_manual('',breaks = c('Irak', 'Savdska Arabija'),
                      values = c('green','black')) +
  labs(title = 'BDP') + ylab('BDP v milijardah dolarjev')

#Graf cen
graf.cen <- ggplot(Cene, aes(Datum, Vrednost)) +
  geom_line() + xlab('Cas') + ylab('Cena nafte')

#Grafi za valute

#Graf primerjave evra in cene nafte - ni v redu, 
#nekaj je v dolarjih, nekaj v SDR
primerjava.cena.BDP <- ggplot(data=tabela.kuvajt,
                              aes(x=Datum,
                                  y=Vrednost, group=1)) +
  geom_line(color = 'black')+
  geom_line(data = tabela.SA, color = 'red') +
  geom_line(data = tabela.dolar, color = 'green') +
  geom_line(data = tabela.evro, color = 'blue') +
  labs(title = 'Vrednost v primerjavi z SDR') + 
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(axis.title = element_text(size = (9)), 
        panel.background=element_rect(fill="#F5ECCE"), plot.title = element_text(size = (15)))


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
  fortify()

zemljevid.BDP <- ggplot() + geom_polygon(data=zemljevid %>% left_join(BDP %>% filter(Leto == '2013'), by=c("SOVEREIGNT"="Drzava")),
                                         aes(x=long, y=lat, group=group, fill=BDP / 1e12)) +
  guides(fill=guide_colorbar("BDP v bilijonih dolarjev"))

print(zemljevid.BDP)

