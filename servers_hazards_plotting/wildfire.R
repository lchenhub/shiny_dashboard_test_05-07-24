# generate wildfire hazard potential map through a function
generate_whp_map <- function(schools, input_school, whp_raster) {
 
   # filter school buffers for school name
  selected_school <- schools %>% 
    filter(SchoolName %in% c(input_school))
  
  # crop whp raster to selected school
  whp_school <- crop(whp_raster, selected_school)
  
  # create school point based on centroid of buffer
  selected_school_point <- selected_school %>% 
    st_centroid()
 
   # overlay the school buffer and school point on the wildfire hazard potential raster
  tm_shape(whp_school) +
    tm_raster(title = "wildfire hazard potential",
              breaks = 0:6, 
              labels = labels,
              palette = palette,
              alpha = .5) +
    tm_shape(selected_school) +
    tm_borders(alpha = .3, title = "school area") +
    # map the school point
    tm_shape(selected_school_point) +
    tm_dots(size = .5, fill = "red", shape = 19) +
    # add custom legend for school point and buffer area
    tm_add_legend(type = "fill", labels = "school community area", col = "black", fill = "transparent") +
    tm_add_legend(type = "fill", labels = "school point", col = "red", fill = "red", shape = 19)
}

