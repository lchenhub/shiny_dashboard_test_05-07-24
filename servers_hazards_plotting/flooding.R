# generate flooding risk map through a function
generate_flooding_map <- function(schools, input_school, FEMA_reclass) {
  
  # filter school buffers for school name
  selected_school <- schools %>% 
    filter(SchoolName %in% c(input_school))
  
  # crop to selected school
  flooding_school <- crop(FEMA_reclass, selected_school)
  
  # create school point based on centroid of buffer
  selected_school_point <- selected_school %>% 
    st_centroid()
  
  # overlay the school buffer and school point on the FEMA flood risk shapefile
  # plot it
  tmap_mode("view")
  
  tm_shape(flooding_school) +
    tm_polygons(fill = "flood_risk",
                title = "Flood Risk",
                labels = c("High", "Moderate to Low", "Undetermined"),
                palette = rev(brewer.pal(n = 4, name = "Blues")), style = "pretty",
                alpha = .5) +
    tm_shape(selected_school, alpha = .2) + 
    tm_borders(alpha = .3, title = "school area") +
    # map the school point
    tm_shape(selected_school_point) +
    tm_dots(size = .5, fill = "red", shape = 19) +
    # add custom legend for school point and buffer area
    tm_add_legend(type = "fill", labels = "school community area", col = "black", fill = "transparent") +
    tm_add_legend(type = "fill", labels = "school point", col = "red", fill = "red", shape = 19) +
    tm_polygons(fill = "flood_risk", alpha = .2, legend.show=FALSE, 
                palette = rev(brewer.pal(n = 4, name = "Blues")), style = "pretty")
}

