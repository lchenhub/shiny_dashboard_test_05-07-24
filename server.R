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


  # output$map <- renderLeaflet({
  #   leaflet() %>% 
  #     addTiles() %>%
  #     setView(lng = -122.4194, lat = 37.7749, zoom = 10) %>%
  #     #addMarkers(data = school_points) %>% 
  #     addProviderTiles("OpenStreetMap")
  # })
  # Reactive output for district based on selected city
  
  #Here, we will create the output variables that feed into outputs used in the ui.R file
  output$districtMenu <- renderUI({
    req(input$city)
    selectInput("district", "Choose a district:", 
                choices = unique(school_points$DistrictNa[school_points$City== input$city]))
  })
  
  # Reactive output for school based on selected district
  output$schoolMenu <- renderUI({
    req(input$district)
    selectInput("school", "Choose a school:", 
                choices = unique(school_points$SchoolName[school_points$DistrictNa == input$district]))
  })
  
  # Render Leaflet map
  output$map <- renderLeaflet({
    req(input$school)
    selectedSchool <- school_points[school_points$SchoolName == input$school, ]
    leaflet(data = selectedSchool) %>%
      addTiles() %>%
      addMarkers(~Longitude, ~Latitude, popup = ~SchoolName)
  })
}
 
