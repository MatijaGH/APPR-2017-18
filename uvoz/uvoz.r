# 2. faza: Uvoz podatkov

# Uvozim podatke o uvozu in izvozu iz excela
uvoz <- read_excel('podatki/importFuel1.xls') %>% 
  rename(Drzava = `Country Name`) %>%
  melt(id.vars = "Drzava", variable.name = "Leto",
       value.name = "Vrednost") 
#   %>% mutate(Leto = parse_number(Leto))



izvoz <- read_excel('podatki/exportFuel1.xls') %>% 
  rename(Drzava = `Country Name`) %>%
  melt(id.vars = "Drzava", variable.name = "Leto",
       value.name = "Vrednost") 
#%>% mutate(Leto = parse_number(Leto))


uvoz.izvoz <- rbind(uvoz %>% mutate(tip = 'uvoz'),
                    izvoz %>% mutate(tip = 'izvoz'))

#Uvozim podatke o BDPju
BDP <- read_csv('podatki/BDP2podatki.csv',skip = 4,
                na = c('','NY.GDP.MKTP.CD')) %>%
  select(-2,-3,-4,-63) %>% rename(Drzava = 'Country Name') %>%
  melt(id.vars = 'Drzava', variable.name = 'Leto', value.name = 'BDP')
#%>% mutate(Leto = parse_number(Leto))


#Uvozim podatke o gibanju cen nafte
Cene <- read_xml("http://www.opec.org/basket/basketDayArchives.xml") %>%
  xml_children() %>% xml_attrs() %>% lapply(as.list) %>%
  bind_rows() %>% 
  transmute(Datum = parse_date(data),Vrednost = parse_number(val))



#Uvozim podatke o gibanju vrednosti valut v primerjavi z valuto SDR
datumi <- read_excel('podatki/PodatkiOValutah1.xlsx', 
                     range = 'A3:A3811',col_types = c('text')) %>%
  mutate(Date = parse_date(Date,format = '%d-%b-%Y',
                           locale = locale('en')))

Valute <- read_excel('podatki/PodatkiOValutah1.xlsx', range = 'A3:I3811',
                     col_types = c('date',rep('numeric',8))) %>%
  rename(Datum = Date) %>%
  #mutate(Datum = if_else(is.na(Datum),datumi$Date, parse_date(Datum))) %>%
  melt(id.vars = 'Datum', variable.name = 'Valuta', value.name = 'Vrednost')


#Za analize naredim še tabeli uvoza Kitajske in ZDA

uvoz.kitajska <- uvoz %>% filter(Drzava == 'China')
uvoz.ZDA <- uvoz %>% filter(Drzava == 'United States')
uvoz.obe <- uvoz %>% filter(Drzava == 'China' | Drzava == 'United States')

#Tabeli izvoza Iraka in Savdske Arabije

izvoz.irak <- izvoz %>% filter(Drzava == 'Iraq')
izvoz.SA <- izvoz %>% filter(Drzava == 'Saudi Arabia')

#Tabeli BDP-ja Iraka in Savdske Arabije
BDP.irak <- tail(BDP.irak <- BDP %>% filter(Drzava == 'Iraq'),15)
BDP.SA <- tail(BDP.SA <- BDP %>% filter(Drzava == 'Saudi Arabia'),15)

#Tabela za valute
tabela.evro <- valute %>% filter(Valuta == 'euro   (EUR)')
tabela.SA <- valute %>% filter(Valuta == 'Saudi Arabian riyal   (SAR)')
tabela.dolar <- valute %>% filter(Valuta == 'U.S. dollar   (USD)')
