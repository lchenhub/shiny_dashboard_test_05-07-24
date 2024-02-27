# -------- dashboard Header--------------------------
header <- dashboardHeader(
  
  title = "CASA Schools Climate Hazards",
  titleWidth = 400
) #END dashboardHeader


# -------- dashboard Sidebar--------------------------
sidebar <- dashboardSidebar(
  # sidebarMenu ----
  sidebarMenu(
    
    menuItem(text = "Welcome", tabName = "welcome", icon = icon("star")),
    menuItem(text = "Index", tabName = "index", icon = icon("map")),
    menuItem(text = "Dashboard", tabName = "dashboard", icon = icon("school"))
    
  )#END sidebarMENU
  
  
)#END dashboard Sidebar
  

# -------- dashboard Body-----------------------------
body <- dashboardBody(
  
  #tabItems ----
  tabItems(
    
    tabItem(tabName = "welcome",
            
            # left hand column
            column(width = 10,
                   
                   # background info box
                   box(width = NULL,
                       
                       title = tags$strong("About")
                       
                   )# END background info box
                   
            ) #END left-hand column
    ),#END welcome tabItem
    
    #Index tabItem ----
    tabItem(tabName = "index"
            
            
            ## Add index map
            
            
    ),#END of Index tabItem
    
    # Dashboard tabItem ----
    tabItem(tabName = "dashboard",
            
            # Fluidrow ----
            fluidRow(
              # input box
              box(
                width = 10,
                
                title = tags$strong("Santa Paula Unified School district"),
                
                "In 2017, Santa Paula Unified School District had a total of
                  139 closed school days due to Natural Disasters and Weather.",
                
                
                mainPanel(
                  tabsetPanel(
                    tabPanel("Extreme Heat"),
                    tabPanel("Extreme Precipitation"),
                    tabPanel("Wildfire"),
                    tabPanel("Flooding"),
                    tabPanel("Coastal Inundation")
                    
                    
                  )#END of tabsetPanel
                ),#END mainPanel
                
                box(
                  width = 10,
                  style = "margin-bottom:1000px"
                  
                )
                
                
                
                
                
                
                
              )#End input box
            )#END Fluidrow
            
            
    )
    
  )#END of tabItems
  
  
) #END dashboard Body


# -------- Combine all in dashboardPage----------------
dashboardPage(header, sidebar, body, skin = "yellow")
