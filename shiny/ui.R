library(shiny)

# shinyUI(fluidPage(
#   
#   titlePanel("Slovenske občine"),
#   
#   tabsetPanel(
#       tabPanel("Velikost družine",
#                DT::dataTableOutput("druzine")),
#       
#       tabPanel("Število naselij",
#                sidebarPanel(
#                   uiOutput("pokrajine")
#                 ),
#                mainPanel(plotOutput("naselja")))
#     )
# ))

shinyUI(fluidPage(
  titlePanel('Analiza vpliva cen nafte na izbrana gospodarstva'),
  
  tabsetPanel(
    tabPanel('Cena nafte',
             mainPanel(plotOutput('graf.cen'))),
    tabPanel('BDP',
             sidebarPanel(
               selectInput('Drzava', label = 'Izberi drzavo',
                           choices = unique(BDP$Drzava))),
             mainPanel(plotOutput('graf.BDP'))
             ),
    tabPanel('Primerjava BDPja po svetu',
             sidebarPanel(
               selectInput('Leto', label = 'Leto',
                           choices = unique(BDP$Leto))),
             mainPanel(plotOutput('BDPsvet'))),
    tabPanel('Vrednost valut',
             sidebarPanel(
               radioButtons('Valuta', label = 'Izberi valuto',
                            choices = unique(Valute$Valuta))
             ),
             mainPanel(plotOutput('graf.valuta'))),
    tabPanel('Uvoz in izvoz',
             sidebarPanel(
               selectInput('Drzava1', label = 'Izberi drzavo',
                           choices = unique(uvoz.izvoz$Drzava)),
               radioButtons('UvozIzvoz', label = 'Uvoz ali izvoz?',
                            choices = unique(uvoz.izvoz$tip)
                            )
             ),
             mainPanel(tableOutput('tabela.uvoz.izvoz')))
  )
)
)

