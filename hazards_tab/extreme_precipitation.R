fluidRow(
  tags$style(".nav-tabs-custom {box-shadow:none;}"),
  
  # plot output
  box(
    width = 6,
    style = "border: none; border-width:0;",
    plotlyOutput(outputId = 'extreme_precip1')
  ),
  
  # text output
  column(
    width = 6,
    box(
      width = NULL,
      
      # Load in text 
      includeMarkdown("text/precipitation.md")
      
    )
  )
  
)
