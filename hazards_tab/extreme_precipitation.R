fluidRow(
  tags$style(".nav-tabs-custom {box-shadow:none;}"),
  box(
    width = 6,
    
    # Plot here
    plotOutput('precip')
  ),
  column(
    width = 6,
    box(
      width = NULL,
      
      # Load in text 
      includeMarkdown("text/precipitation.md")
      
    )
  )
  
)
