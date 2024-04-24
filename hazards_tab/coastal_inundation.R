fluidRow(
  tags$style(".nav-tabs-custom {box-shadow:none;}"),
  box(
    width = 6,
    
    # Plot here
    
    #plotOutput('hazard_plot')
  ),
  column(
    width = 6,
    box(
      width = NULL,
      
      # Load in text
      includeMarkdown("text/coastal_inundation.md")
      
    )
  )
  
)
