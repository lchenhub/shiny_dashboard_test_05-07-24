fluidRow(
  tags$style(".nav-tabs-custom {box-shadow:none;}"),
  box(
    width = 6,
    style = "border: none; border-width:0;",
    plotOutput('hazard_plot')
  ),
  column(
    width = 6,
    box(
      width = NULL,
      style = "border: none; border-width:0;",
      includeMarkdown("text/heat.md")
      
    )
  ))