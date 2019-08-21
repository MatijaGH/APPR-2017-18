# 4. faza: Analiza podatkov

#podatki <- obcine %>% transmute(obcina, povrsina, gostota,
#                                gostota.naselij = naselja/povrsina) %>%
#  left_join(povprecja, by = "obcina")
#row.names(podatki) <- podatki$obcina
#podatki$obcina <- NULL

# Število skupin
#n <- 5
#skupine <- hclust(dist(scale(podatki))) %>% cutree(n)

#Še model linearne regresije
#Aproksimirali bomo izvoz
izvoz.analiza1 <- izvoz %>% filter(Drzava == 'Saudi Arabia') %>% filter(Leto %in% c(2003:2015))
BDP.analiza1 <- BDP %>% filter(Drzava == 'Saudi Arabia') %>% filter(Leto %in% c(2003:2015))
korelacija_izvoz_BDP.SA <- cor(izvoz.analiza1$Vrednost, BDP.analiza1$BDP)

izvoz.analiza2 <- izvoz %>% filter(Drzava == 'Iraq') %>% filter(Leto %in% c(2004:2015))
BDP.analiza2 <- BDP %>% filter(Drzava == 'Iraq') %>% filter(Leto %in% c(2004:2015))
korelacija_izvoz_BDP.irak <- cor(izvoz.analiza2$Vrednost, BDP.analiza2$BDP)

#Korelacija za valuto kuvajtski dolar in nafto
korelacija_KD <- cor(tail(tabela.kuvajt$Vrednost %>% na.omit(),150), tail(Cene$Vrednost,150))
korelacija_evro <- cor(tail(tabela.evro$Vrednost %>% na.omit(),150), tail(Cene$Vrednost,150))
korelacija_dolar <- cor(tail(tabela.dolar$Vrednost %>% na.omit(),150), tail(Cene$Vrednost,150))

#Model za glajenje časovne vrste in napoved
#Podatki
casovna_vrsta <- ts(data = Cene$Vrednost)
# graf_casovna_vrsta <- ts.plot(casovna_vrsta,main = 'Cena sodčka nafte v dolarjih',ylab = 'Cena')


#Funkcija
G <- function(vrsta, k){
  T = length(vrsta)
  zaporedje <- c()
  for (i in (k+1):(T+1)){
    zaporedje[i] <- sum(vrsta[(i-1):(i-k)])/k
  }
  return(zaporedje) 
}

zglajena_vrsta <- G(casovna_vrsta,8)
napoved <- tail(zglajena_vrsta,1)
zglajena_vrsta <- ts(zglajena_vrsta)


graf.drsenje <- ts.plot(zglajena_vrsta, casovna_vrsta, main = "Drsece povprecje", ylab = "Dolarji", lwd = c(2,1), col = c("red", "black"))
legend("topright", c("Zglajena vrsta", "Prava vrsta"),
       col = c("red","black"), lty = c(1, 1),
       lwd=2, box.lty = 0)

#Eksponentno glajenje
EG <- function(vrsta,alpha){
  L <- c()
  L[2] <- vrsta[1]
  T <- length(vrsta)
  for(t in 2:T){
    L[t + 1] <- alpha * vrsta[t] + (1 - alpha) * L[t]
  }
  return(L)
}

alfa = 0.2
eg <- ts(EG(casovna_vrsta,alfa))

graf_EG <- ts.plot(eg, casovna_vrsta, main = "Eksponentno glajenje", ylab = "EUR", lwd = c(2,1), col = c("red", "black"))

exp_vrsta <- EG(casovna_vrsta,0.2)
napoved_exp <- tail(exp_vrsta,1)
exp_vrsta <- ts(exp_vrsta)

#Še linearni model
BDP.analiza1.2 <- BDP.analiza1
BDP.analiza1.2$BDP <- BDP.analiza1.2$BDP / 1000000000
napoved_za_SA <- ggplot(BDP.analiza1.2, aes(x = Leto, y = BDP)) + 
  geom_point() +
  stat_smooth(method = "lm", col = "red") +
  geom_abline(intercept = 2.158e+2, slope = 4.293e+1) +
  ylab('BDP v milijardah dolarjev')


#Pa še za cene
napoved_cene <- ggplot(Cene, aes(x =Datum, y = Vrednost)) +
  geom_line() + stat_smooth(method = 'lm', col = "red")

napoved1 <- predict(lm(Cene$Vrednost ~ Cene$Datum), Cene, interval = 'confidence')

#napovedano <- plot(napoved)


#Spreminjanje deleža izvoza v BDPju 

nova <- merge(BDP.analiza2, izvoz.analiza2) %>% transform(del = Vrednost / BDP * 1000000000)
nova2 <- merge(BDP.analiza1, izvoz.analiza1) %>% transform(del = Vrednost / BDP * 1000000000)
graf_delez <- ggplot(nova, aes(x = Leto, y = del)) + geom_point(color = 'red') +
  geom_point(data = nova2, color = 'green')







