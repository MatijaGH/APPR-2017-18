# Analiza podatkov s programom R, 2017/18

Avtor: Matija Gubanec Hančič

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2017/18

## Tematika

V svojem projektu se bom osredotočil na cene naftnih derivatov in vpliv le teh na 
vrednosti dolarja in valut ostalih držav, ki so močno odvisne od trgovanja z nafto v obdobju od leta 2003 do danes.
Prav tako bom proučil vpliv cen naft na uvoz in izvoz, ter BDP teh držav.
Kot vire podatkov bom uporabil:
http://www.opec.org/opec_web/en/data_graphs/40.htm

https://www.imf.org/external/np/fin/ert/GUI/Pages/CountryDataBase.aspx

https://tradingeconomics.com/united-states/gdp

http://www.opec.org/opec_web/en/index.htm

http://www.imf.org/external/datamapper/PCPIPCH@WEO/OEMDC

Za izbrane evropske države bom prav tako preučil vpliv cen nafte na gibanje povpraševanja po naftnih dobrinah.
Podatke bom pridobil s pomočjo Eurostata na naslovih:

http://ec.europa.eu/eurostat/data/database

http://appsso.eurostat.ec.europa.eu/nui/submitViewTableAction.do

V tretji fazi bom dodal zemljevid sveta, na katerem bodo označene največje uvoznice in izvoznice nafte.

Projekt bo vseboval 5 tabel:

1. tabela:

  - Leto (dan)
  - Cena nafte
  
2. tabela:
  
  - Leto
  - Valute
  - Vrednost valute(upoštevajoč inflacijo...)
  
3. tabela:

  - Leto
  - Država
  - BDP

4. tabela:

  - Leto 
  - Država
  - Uvoz

5. tabela:

  - Leto
  - Država
  - Izvoz
  

S pomočjo svoje analize bom poskusil napovedati prihodnje gibanje naftnih cen in valut.

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
