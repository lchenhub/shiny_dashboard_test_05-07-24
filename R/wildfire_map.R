# Define the function that will create and return the Leaflet map object
wildfire_map <- function(input_school) {
  
  # Process the data
  # Filter for one school (can be parameterized based on 'input')
  school_buffer <- school_filtered2(schools_buffers, input_school) %>% 
    st_transform(crs = 4326)
  
  # Calculate the centroid of the school buffer and convert to WGS 1984
  school_point <- st_centroid(school_buffer) %>% 
    st_transform(crs = 4326)
  
  # Select the wildfire hazard potential cells that overlap
  whp_school <- crop(whp_reclass, school_buffer)
  
  # Define color palette and labels for wildfire hazard potential
  labels <- c("non-burnable", "very low", "low", "moderate", "high", "very high", "")
  whp_colors <- c("white", "#fee391", "#fec44f", "#fe9929", "#d95f0e", "#993404", "transparent")
  whp_palette <- colorFactor(palette = whp_colors,
                             domain = values(whp_school),  # This will be updated after reading data
                             na.color = "transparent")
  
  
    
    # create wildfire map
    wildfire_map <- leaflet() %>% 
      addProviderTiles(providers$Esri.WorldTopoMap) %>% 
      addRasterImage(whp_school, colors = whp_palette, 
                     opacity = .7, group = "wildfire hazard potential") %>% 
      addPolygons(data = school_buffer, color = "black", fill = FALSE, 
                  weight = 2, group = "school community area") %>% 
      addCircleMarkers(data = school_point, color = "blue", stroke = FALSE, 
                       weight = 3, radius = 5, fillOpacity = 1, group = "school point") %>% 
      addLegend("bottomright", colors = whp_colors, labels = labels, 
                title = "wildfire hazard potential", opacity = 0.5)
    
    return(wildfire_map)

}
