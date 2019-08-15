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
    tabPanel('Valute',
             DT::dataTableOutput('valute')),
    
    tabPanel('BDP',
             sidebarPanel(
               uiOutput('Drzave')
             ),
             mainPanel(plotOutput('Macki'))
             ))
  )
)
