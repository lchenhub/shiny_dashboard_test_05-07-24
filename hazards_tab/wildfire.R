fluidRow(
  tags$style(".nav-tabs-custom {box-shadow:none;}"),
  
  # box for map output
  box(
    width = 6,
    
    # wildfire map output -----
    leafletOutput(outputId = "wildfire_map")
  ),
  
  # column for text
  column(
    width = 6,
    box(
      width = NULL,
      
      # Load text in 
      includeMarkdown("text/wildfire.md")
      
    )
  )
  
)
