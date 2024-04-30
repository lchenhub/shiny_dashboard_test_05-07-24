server <- function(input, output){
  
#------------------- Hazards plot ---------------------------------------------
  
#--------------------Extreme Heat ---------------------------------------------
  
  output$extreme_heat <- renderPlot({
    source("servers_hazards/extreme_heat.R",
           local = TRUE,
           echo = FALSE,
           print.eval = FALSE)[1]

    })
    
#--------------------Extreme Precipitation-------------------------------------

  output$precip <- renderPlot({
    source("servers_hazards/extreme_precipitation.R",
           local = TRUE,
           echo = FALSE, 
           print.eval = FALSE)[1]})  
  
    
#---------------------Wildfire--------------------------------------------------
    
  output$wildfire <- renderPlot({
    source("servers_hazards/wildfire.R",
           local = TRUE,
           echo = FALSE, 
           print.eval = FALSE)[1]})  

#---------------------Flooding--------------------------------------------------
    
  output$flooding <- renderPlot({
    source("servers_hazards/flooding.R",
           local = TRUE,
           echo = FALSE, 
           print.eval = FALSE)[1]})  
#---------------------Coastal Flooding------------------------------------------
    
  output$coastal <- renderPlot({
    source("servers_hazards/coastal_inundation.R",
           local = TRUE,
           echo = FALSE, 
           print.eval = FALSE)[1]})  
  


# build leaflet map


  output$map <- renderLeaflet({
    leaflet() %>% 
      addTiles() %>%
      setView(lng = -122.4194, lat = 37.7749, zoom = 10) %>%
      #addMarkers(data = school_points) %>% 
      addProviderTiles("OpenStreetMap")
  })
  
}
 
