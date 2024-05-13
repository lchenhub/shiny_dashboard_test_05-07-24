fluidRow(
  tags$style(".nav-tabs-custom {box-shadow:none;}"),
  
  # box for map output
  box(
    width = 8,
    
    # flooding map output -----
    leafletOutput(outputId = "flooding_map")
  ),
    
    #plotOutput('hazard_plot')
  column(
    width = 6,
    box(
      width = NULL,
      
      # Load in text
      includeMarkdown("text/flooding.md")
      
    )
  )
  
)
