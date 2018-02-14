# 2. faza: Uvoz podatkov

# Uvozim podatke o uvozu in izvozu iz excela
uvoz <- read_excel('podatki/importFuel.xls') %>% 
  rename(Drzava = `Country Name`) %>%
  melt(id.vars = "Drzava", variable.name = "Leto",
       value.name = "Vrednost") %>%
  mutate(Leto = parse_number(Leto))
  
izvoz <- read_excel('podatki/exportFuel.xls') %>% 
  rename(Drzava = `Country Name`) %>%
  melt(id.vars = "Drzava", variable.name = "Leto",
       value.name = "Vrednost") %>%
  mutate(Leto = parse_number(Leto))
  

uvoz.izvoz <- rbind(uvoz %>% mutate(tip = 'uvoz'),
                    izvoz %>% mutate(tip = 'izvoz'))

#Uvozim podatke o BDPju
BDP <- read_csv('podatki/BDP2podatki.csv',skip = 4,
                na = c('','NY.GDP.MKTP.CD')) %>%
  select(-2,-3,-4,-63) %>% rename(Drzava = 'Country Name') %>%
  melt(id.vars = 'Drzava', variable.name = 'Leto', value.name = 'BDP') %>%
  mutate(Leto = parse_number(Leto))


#Uvozim podatke o gibanju cen nafte
Cene <- read_xml("http://www.opec.org/basket/basketDayArchives.xml") %>%
  xml_children() %>% xml_attrs() %>% lapply(as.list) %>%
  bind_rows() %>% 
  transmute(Datum = parse_date(data),Vrednost = parse_number(val))



#Uvozim podatke o gibanju vrednosti valut v primerjavi z valuto SDR
datumi <- read_excel('podatki/PodatkiOValutah.xlsx', 
                     range = 'A3:A3811',col_types = c('text')) %>%
  mutate(Date = parse_date(Date,format = '%d-%b-%Y',
                           locale = locale('en')))

valute <- read_excel('podatki/PodatkiOValutah.xlsx', range = 'A3:R3811',
                     col_types = c('date',rep('numeric',17))) %>%
  rename(Datum = Date) %>%
  mutate(Datum = if_else(is.na(Datum),datumi$Date, parse_date(Datum))) %>%
  melt(id.vars = 'Datum', vaiable.name = 'Valuta', value.name = 'Vrednost')
  

  
