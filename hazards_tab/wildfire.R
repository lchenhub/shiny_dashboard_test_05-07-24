fluidRow(
  tags$style(".nav-tabs-custom {box-shadow:none;}"),
  
  # box for map output
  box(
    width = 8,
    
    # wildfire map output -----
    leafletOutput(outputId = "wildfire_map")
  ),
  
  # column for text
  column(
    width = 4,
    box(
      width = NULL,
      
      # Load text in 
      includeMarkdown("text/wildfire.md")
      
    )
  )
  
)
