server <- function(input, output){
  
  #-------------------Reactive school filtering--------------------------------
  
  ## hazards summary -----
  # function to filter school and pivot longer into form for lollipop chart
  school_filtered <- function(data, input_school) {
    data %>%
      # filter for school
      filter(SchoolName %in% c(input_school)) %>%
      # pivot hazard score columns to convert data to long format
      pivot_longer(cols = c(whp, heat_score, precip_score, flood_score, slr_score), 
                   names_to = "variable", values_to = "value")
  }
  
  # filter school for hazard summary plot based on user input
  filtered_data <- reactive({
    school_filtered(sb_hazards_test, input$school_input)
  })
  
  ## mapping for flooding, coastal flooding, and wildfire
  # 
  school_filtered_map <- function(schools, input_school, whp_raster) {
    # filter for school name
    selected_school <- schools %>% 
      filter(SchoolName %in% c(input_school))
    # crop whp raster to selected school
    whp_school <- crop(whp_raster, selected_school)
      
  }
  
  
  # Update hazards tab title based on the selected school
  output$school_name <- renderUI({
    # Ensure there is a selection to avoid errors
    if (!is.null(input$school_input) && input$school_input != "") {
      h2(tags$strong(input$school_input))
    } else {
      h2(tags$strong("Select a school"))
    }
  })

  #-------------------Hazards plot---------------------------------------------
  
  # source script that filters the hazard scores dataframe and creates a plot
  source("servers_hazards_plotting/hazard_summary_test.R")
  
  # filter school to build hazard summary plot 
  filtered_data <- reactive({
    school_filtered(sb_hazards_test, input$school_input)
  })
  
  # output hazard summary plot
  output$hazard_summary <- renderPlot({
    generate_hazard_summary_plot(filtered_data())
  })
  
  #--------------------Extreme Heat ---------------------------------------------
  
  output$extreme_heat <- renderPlotly({
    # Develop plot 
    heat <- ggplot(data = extreme_heat1,
                   aes(x = year, y = total, color = scenario)) +
      geom_line() +
      theme_classic() +
      labs(x = "Year",
           y = "Number of Extreme Heat Days") +
      theme(legend.position = "top",
            legend.title = element_blank())
    
    ggplotly(heat) %>%
      layout(legend = list(orientation = "h", y = 1.1,
                           title = list(text = 'Scenarios')),
             margin = list( t = 60))
    
  })
  
  
  #--------------------Extreme Precipitation-------------------------------------
  
  output$precip <- renderPlot({
    source("servers_hazards_plotting/extreme_precipitation.R",
           local = TRUE,
           echo = FALSE, 
           print.eval = FALSE)[1]})  
  
  
  #---------------------Wildfire--------------------------------------------------
  
  # source script that filters the hazard scores dataframe and creates a plot
  source("servers_hazards_plotting/wildfire.R")
  
  # filter schools buffers to plot on wildfire map
  filter_whp <- reactive({
    school_filtered(schools_buffers, input$school_input)
  })
  
  # output wildfire map
  output$wildfire_map <- renderLeaflet({
    generate_whp_map(whp_crop(), school_buffer(), school_point())
  }) 
  
  #---------------------Flooding--------------------------------------------------
  
  output$flooding <- renderPlot({
    source("servers_hazards_plotting/flooding.R",
           local = TRUE,
           echo = FALSE, 
           print.eval = FALSE)[1]})  
  
  #---------------------Coastal Flooding------------------------------------------
  
  output$coastal <- renderPlot({
    source("servers_hazards_plotting/coastal_inundation.R",
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
 
