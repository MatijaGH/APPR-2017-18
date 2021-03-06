library(shiny)

# shinyServer(function(input, output) {
#   output$druzine <- DT::renderDataTable({
#     dcast(druzine, obcina ~ velikost.druzine, value.var = "stevilo.druzin") %>%
#       rename(`Občina` = obcina)
#   })
#   
#   output$pokrajine <- renderUI(
#     selectInput("pokrajina", label="Izberi pokrajino",
#                 choices=c("Vse", levels(obcine$pokrajina)))
#   )
#   output$naselja <- renderPlot({
#     main <- "Pogostost števila naselij"
#     if (!is.null(input$pokrajina) && input$pokrajina %in% levels(obcine$pokrajina)) {
#       t <- obcine %>% filter(pokrajina == input$pokrajina)
#       main <- paste(main, "v regiji", input$pokrajina)
#     } else {
#       t <- obcine
#     }
#     ggplot(t, aes(x = naselja)) + geom_histogram() +
#       ggtitle(main) + xlab("Število naselij") + ylab("Število občin")
#   })
# })

server <- function(input, output) {
  output$graf.cen <- renderPlot({
    graf.cen <- ggplot(Cene, aes(Datum, Vrednost)) + 
      geom_line() + xlab('Cas') + ylab('Cena nafte')
    print(graf.cen)
  })
  
  output$graf.BDP <- renderPlot({
    BDP1 <- tail(BDP.drzava <- BDP %>% filter(Drzava == input$Drzava),15)
    BDP1$BDP <- BDP1$BDP / 1000000000
    graf1 <- ggplot(data = BDP1, aes(x = Leto, y = BDP)) +
                      geom_line(color = 'green') +
                      geom_point(color = 'green', size = 3) +
      ylab('BDP v milijardah dolarjev')
    print(graf1)
  })
  
  output$graf.valuta <- renderPlot({
    Valuta1 <- valute %>% filter(Valuta == input$Valuta)
    graf2 <- ggplot(data = Valuta1, aes(Datum, Vrednost)) + 
      geom_line() + xlab('Cas') + ylab('Vrednost valute')
    print(graf2)
  })
  
  output$BDPsvet <- renderPlot({
    zemljevid <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_map_units.zip",
                                 "ne_110m_admin_0_map_units", encoding = "UTF-8") %>%
      fortify()
    
    zemljevid.BDP <- ggplot() + geom_polygon(data=zemljevid %>% left_join(BDP %>% filter(Leto == input$Leto), by=c("SOVEREIGNT"="Drzava")),
                                             aes(x=long, y=lat, group=group, fill=BDP / 1e12)) +
      guides(fill=guide_colorbar("BDP v bilijonih dolarjev"))
    
    print(zemljevid.BDP)
  })
  
  output$tabela.uvoz.izvoz <- renderTable(uvoz.izvoz %>%
                                      filter(Drzava == input$Drzava1 & tip == input$UvozIzvoz) %>% rename('Vrednost (v milijardah dolarjev)' = Vrednost) %>%
                                    select(2,3))
} 

