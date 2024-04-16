# -------- dashboard Header--------------------------
header <- dashboardHeader(
  
  title = "CASA Schools Climate Hazards",
  titleWidth = 400
) #END dashboardHeader


# -------- dashboard Sidebar--------------------------
sidebar <- dashboardSidebar(
  # sidebarMenu ----
  sidebarMenu(
    
    menuItem(text = h4("Welcome"), tabName = "welcome", icon = icon("star")),
    menuItem(text = h4("Index"), tabName = "index", icon = icon("map")),
    menuItem(text = h4(HTML("Explore Your Hazards")), tabName = "hazards", icon = icon("school")),
    menuItem(text = h4("Socioeconomic"), tabName = "socio", icon = icon("person")),
    menuItem(text = h4("User guide"), tabName = "guide", icon = icon("users"))
    
  )#END sidebarMENU
  
  
)#END dashboard Sidebar
  

# -------- dashboard Body-----------------------------
body <- dashboardBody(
  tabItems(
    tabItem(tabName = "welcome",
      column(width = 12,
        box(width = NULL,
          title = h3(tags$strong("Welcome!")),
          #includeMarkdown("text/about.md")
          "Filler"
        ),
        leafletOutput("map")
      )
    ),
    tabItem(tabName = "index",
      # Content for the index tab
    ),
    tabItem(tabName = "hazards",
      fluidRow(
        box(
          width = 12,
          title = h2(tags$strong("Santa Paula Unified School district")),
          tabsetPanel(
            tabPanel(h4("Extreme Heat"),
              fluidRow(
                tags$style(".nav-tabs-custom {box-shadow:none;}"),
                box(width = 6,
                  style = "border: none; border-width:0;",
                  plotOutput('hazard_plot')
                ),
                column(width = 6,
                  box(
                    width = NULL,
                    style = "border: none; border-width:0;",
                    h3("What does this graph tell us?"),
                    p("The Santa Paula Unified School District will see an increase in extreme heat days in the upcoming years."),
                    h3("How is extreme heat measured?"),
                    p("Extreme heat is measured as days where the daily maximum temperature is above the 98th percentile of observed historical temperatures"),
                    h3("Source:")
                  )
                )
              )
            ),
            tabPanel(h4("Extreme Precipitation")),
            tabPanel(h4("Wildfire")),
            tabPanel(h4("Flooding")),
            tabPanel(h4("Sea Level Rise"))
          )
        )
      )
    ),
    tabItem(tabName = "socio",
      fluidRow(
        box(width = 8,
          # Content for the socioeconomic tab
        )
      )
    )
  )
)


# -------- Combine all in dashboardPage----------------
dashboardPage(header, sidebar, body,skin = "yellow")
