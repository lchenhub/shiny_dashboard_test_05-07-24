server <- function(input, output){
  
  # Hazards plot
  output$hazard_plot <- renderPlot({
    ggplot(na.omit(penguins),
           aes(x = flipper_length_mm, y = bill_length_mm,
               color = species, shape = species)) +
      geom_point()
  })

  
}

# build leaflet map

function(input, output, session) {
  output$map <- renderLeaflet({
    leaflet() %>% 
      addTiles() %>%
      setView(lng = -122.4194, lat = 37.7749, zoom = 10) %>%
      addProviderTiles("Stamen.Toner") %>% 
      leaflet.extras::addSearchOSM(options = searchOptions(collapsed = TRUE))
  })
}