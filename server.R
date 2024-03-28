server <- function(input, output){
  
  # Hazards plot
  output$hazard_plot <- renderPlot({
    ggplot(na.omit(penguins),
           aes(x = flipper_length_mm, y = bill_length_mm,
               color = species, shape = species)) +
      geom_point()
  })

  
}