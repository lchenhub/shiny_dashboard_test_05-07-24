# -------- dashboard Header--------------------------
header <- dashboardHeader(
  
  title = "CASA Schools",
  titleWidth = 188
) #END dashboardHeader

# -------- dashboard Sidebar--------------------------
sidebar <- dashboardSidebar(
  # sidebarMenu ----
  sidebarMenu(
    menuItem(text = h4("Welcome"), tabName = "welcome", icon = icon("star")),
    menuItem(text = h4(HTML("Explore Your Hazards")), tabName = "hazards", icon = icon("school")),
    #menuItem(text = h4("Hazard Summary Metric"), tabName = "index", icon = icon("map")),
    menuItem(text = h4("Adaptation"), tabName = "adapt", icon = icon("person")),
    menuItem(text = h4("User guide"), tabName = "guide", icon = icon("users"))
    
  )#END sidebarMENU
  
  
)#END dashboard Sidebar


# -------- dashboard Body-----------------------------
body <- dashboardBody(
  
  
  # ---------- Welcome tab -----------------------------    
  tabItems(
    tabItem(tabName = "welcome",
            fluidPage(
              box(width = NULL,
                  title = h3(tags$strong("Welcome to the CASAschools Climate Hazards Dashboard!")),
                  includeMarkdown("text/about_text.md"),
                  h3(tags$strong("Getting Started")),
                  sidebarLayout(
                    sidebarPanel(
                      uiOutput("cityMenu"),
                      uiOutput("districtMenu"),
                      uiOutput("schoolMenu")
                    ),
                    mainPanel(
                      leafletOutput("map")
                    )
                  )))
    ),
    
    
    # ---------- Hazards tab -----------------------------
    tabItem(tabName = "hazards",
            fluidPage(
              box(
                width = NULL,
                title = div(style = "display: flex; align-items: center; justify-content: space-between;",
                            
                            # school name
                            uiOutput("school_name"),
                            
                            # school picker for the hazards tab, note the different inputId than the school picker in the welcome
                            box(width = NULL,
                                pickerInput(inputId = "school_input",
                                            label = "Select school",
                                            choices = unique(sb_hazards_test$SchoolName),
                                            options = pickerOptions(actionsBox = TRUE),
                                            selected = "Dos Pueblos Senior High", 
                                            multiple = FALSE)
                            )
                ), # END TITLE AND PICKER INPUT
                
                tabsetPanel(
                  
                  # START EXTREME HEAT TAB
                  
                  tabPanel(h4("Extreme Heat"),
                           # Load extreme heat script
                           source("hazards_tab/extreme_heat.R",
                                  local = TRUE, 
                                  echo = FALSE, 
                                  print.eval = FALSE)[1]
                           
                           
                  ), # END Extreme Heat
                  
                  # START EXTREME PRECIPITATION TAB
                  
                  tabPanel(h4("Extreme Precipitation"),
                           # Load extreme precipitation script
                           source("hazards_tab/extreme_precipitation.R", 
                                  local = TRUE,
                                  echo = FALSE,
                                  print.eval = FALSE)[1]
                           
                           
                  ), # END EXTREME PRECIPITATION
                  
                  # START WILDFIRE TAB
                  
                  tabPanel(h4("Wildfire"),
                           # Load wildfire script
                           source("hazards_tab/wildfire.R", 
                                  local = TRUE,
                                  echo = FALSE,
                                  print.eval = FALSE)[1]
                           
                           
                  ), # END WILDFIRE
                  
                  # START FLOODING TAB
                  
                  tabPanel(h4("Flooding"),
                           # Load flooding script
                           source("hazards_tab/flooding.R", 
                                  local = TRUE,
                                  echo = FALSE,
                                  print.eval = FALSE)[1]
                           
                  ), # END FLOODING
                  
                  # START COASTAL INUNDATION TAB
                  
                  tabPanel(h4("Coastal Inundation"),
                           # Load coastal inundation script
                           source("hazards_tab/coastal_inundation.R", 
                                  local = TRUE,
                                  echo = FALSE,
                                  print.eval = FALSE)[1]
                           
                  ), # END COASTAL INUNDATION
                  
                  # START HAZARD SUMMARY TAB
                  
                  tabPanel(h4("Hazard Summary"),
                           #load hazard summary script
                           source("hazards_tab/hazard_summary.R",
                                  local = TRUE,
                                  echo = FALSE,
                                  print.eval = FALSE)[1]
                           
                  ) # END HAZARD SUMMARY
                  
                ) # END Tabset Panel
                
              ) # END Box
              
            ) # END Fluid Pages
            
    ), # END HAZARDS TAB
    
    
    # --------- Index tab --------------------------------   
    tabItem(tabName = "index",
            # Content for the index tab
            fluidPage(
              
              
              box(width = NULL,
                  title = h2(tags$strong("Dos Pueblos Senior High Hazards Summary Metric"))
              )
              
            )#END FLUIDPAGE
            
    ),#END INDEX
    
    
    # ------- Socioeconomic tab ---------------------
    tabItem(tabName = "adapt",
            fluidPage(
              box(width = NULL,
                  includeMarkdown("text/socio.md"),
              )
            )#END FLUIDPAGE
    ),#END SOCIOECONOMIC TAB
    # ------- User guide tab -----------------------
    tabItem(tabName = "guide",
    )#END USER GUIDE
    
  ),#END TABS CONTENT
  
)#END BODY

# -------- Combine all in dashboardPage----------------
dashboardPage(header, sidebar, body,skin = "yellow")
