# Analiza vpliva cen nafte na izbrana gospodarstva

Avtor: Matija Gubanec Hančič

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2017/18

* [![Shiny](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/MatijaGH/APPR-2017-18/master?urlpath=shiny/APPR-2017-18/projekt.Rmd) Shiny

* [![RStudio](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/MatijaGH/APPR-2017-18/master?urlpath=rstudio) RStudio

## Tematika

V svojem projektu se bom osredotočil na cene naftnih derivatov in vpliv teh na 
vrednost dolarja in valut izbranih ostalih držav, ki so močno odvisne od trgovanja z nafto v obdobjih, ki so zgodovinsko gledano močno zaznamovana z bojem za nafto in primerjal to z obdobji relativne mirnosti.
Prav tako bom preučil vpliv cen nafte na uvoz in izvoz ter BDP teh držav.

Za izbrane evropske države bom preučil vpliv cene nafte na gibanje povpraševanja po naftnih dobrinah.

V tretji fazi bom dodal zemljevid sveta, na katerem bodo označene največje uvoznice in izvoznice nafte.

## Zasnova podatkovnega modela

 ##### Tabela 1:  Cena nafte skozi leta

Stolpci:
 datum, cena nafte
  
 ##### Tabela 2:  Vrednosti valut

Stolpci:
 datum, valuta, vrednost valute(zanemarjajoč inflacijo)
  
 ##### Tabela 3:  BDPji držav

Stolpci:
 država, leto, BDP

 ##### Tabela 4:  Podatki o uvozu

Stolpci:
 država, leto, uvoz

 ##### Tabela 5:  Podatki o izvozu

Stolpci:
 država, leto, izvoz
  

S pomočjo svoje analize bom poskusil napovedati prihodnje gibanje naftnih cen in valut ter prikazati gibanje v preteklosti.

### Viri:

http://ec.europa.eu/eurostat/data/database

http://appsso.eurostat.ec.europa.eu/nui/submitViewTableAction.do

http://www.opec.org/opec_web/en/data_graphs/40.htm

https://www.imf.org/external/np/fin/ert/GUI/Pages/CountryDataBase.aspx

https://tradingeconomics.com/united-states/gdp

http://www.opec.org/opec_web/en/index.htm

http://www.imf.org/external/datamapper/PCPIPCH@WEO/OEMDC

https://data.worldbank.org/indicator/NY.GDP.MKTP.CD?end=2016&start=2016&view=bar

https://data.worldbank.org/indicator

## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`. Ko ga prevedemo,
se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Zemljevidi v obliki SHP, ki jih program pobere, se
shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr` - za izdelovanje poročila
* `rmarkdown` - za prevajanje poročila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `maptools` - za uvoz zemljevidov
* `sp` - za delo z zemljevidi
* `digest` - za zgoščevalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `readr` - za branje podatkov
* `rvest` - za pobiranje spletnih strani
* `reshape2` - za preoblikovanje podatkov v obliko *tidy data*
* `dplyr` - za delo s podatki
* `gsubfn` - za delo z nizi (čiščenje podatkov)
* `ggplot2` - za izrisovanje grafov
* `extrafont` - za pravilen prikaz šumnikov (neobvezno)

## Binder

Zgornje [povezave](#analiza-podatkov-s-programom-r-201819)
omogočajo poganjanje projekta na spletu z orodjem [Binder](https://mybinder.org/).
V ta namen je bila pripravljena slika za [Docker](https://www.docker.com/),
ki vsebuje večino paketov, ki jih boste potrebovali za svoj projekt.

Če se izkaže, da katerega od paketov, ki ji potrebujete, ni v sliki,
lahko za sprotno namestitev poskrbite tako,
da jih v datoteki [`install.R`](install.R) namestite z ukazom `install.packages`.
Te datoteke (ali ukaza `install.packages`) **ne vključujte** v svoj program -
gre samo za navodilo za Binder, katere pakete naj namesti pred poganjanjem vašega projekta.

Tako nameščanje paketov se bo izvedlo pred vsakim poganjanjem v Binderju.
Če se izkaže, da je to preveč zamudno,
lahko pripravite [lastno sliko](https://github.com/jaanos/APPR-docker) z želenimi paketi.

Če želite v Binderju delati z git,
v datoteki `gitconfig` nastavite svoje ime in priimek ter e-poštni naslov
(odkomentirajte vzorec in zamenjajte s svojimi podatki) -
ob naslednjem.zagonu bo mogoče delati commite.
Te podatke lahko nastavite tudi z `git config --global` v konzoli
(vendar bodo veljale le v trenutni seji).


