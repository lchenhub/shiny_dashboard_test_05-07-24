# generate wildfire hazard potential map through a function
generate_whp_map <- function(whp_crop, school_buffer, school_point) {
  
  # map code here
  tm_shape(whp_crop) +
    tm_raster(title = "wildfire hazard potential",
              breaks = 0:6, 
              labels = labels,
              palette = palette,
              alpha = .5) +
    tm_shape(school_buffer) +
    tm_borders(alpha = .3, title = "school area") +
    # map the school point
    tm_shape(school_point) +
    tm_dots(size = .5, fill = "red", shape = 19) +
    # add custom legend for school point and buffer area
    tm_add_legend(type = "fill", labels = "school community area", col = "black", fill = "transparent") +
    tm_add_legend(type = "fill", labels = "school point", col = "red", fill = "red", shape = 19)
  
}