server <- function(input, output){
  
#------------------- Hazards plot ---------------------------------------------
  
#--------------------Extreme Heat ---------------------------------------------
  
  output$hazard_plot <- renderPlot({
    ggplot(na.omit(penguins),
           aes(x = flipper_length_mm, y = bill_length_mm,
               color = species, shape = species)) +
      geom_point()
    
    
#--------------------Extreme Precipitation-------------------------------------
    
    
#---------------------Wildfire--------------------------------------------------
    

#---------------------Flooding--------------------------------------------------
    
#---------------------Coastal Flooding------------------------------------------
    
  })

  


# build leaflet map


  output$map <- renderLeaflet({
    leaflet() %>% 
      addTiles() %>%
      setView(lng = -122.4194, lat = 37.7749, zoom = 10) %>%
      #addMarkers(data = school_points) %>% 
      addProviderTiles("OpenStreetMap")
  })
} 
