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
    menuItem(text = h4(HTML("Explore Your Hazards")), tabName = "hazards", icon = icon("school"))
    
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
    tabItem(tabName = "hazards",
            
            # Fluidrow ----
            fluidRow(
              # input box
              box(
                width = 12,
                
                title = h2(tags$strong("Santa Paula Unified School district")),
                
                
                mainPanel(
                  tabsetPanel(
                    tabPanel(h4("Extreme Heat")),
                    tabPanel(h4("Extreme Precipitation")),
                    tabPanel(h4("Wildfire")),
                    tabPanel(h4("Flooding")),
                    tabPanel(h4("Sea Level Rise"))
                    
                    
                  )#END of tabsetPanel
                ),#END mainPanel
                
                
                box(
                  width = 10,
                  style = "margin-bottom:1000px",
                  
                 

                )

                
                
                
                
                
                
              )#End input box
              
            )#END Fluidrow
            
    
  )#END of tabItems
  
  
) #END dashboard Body
)

# -------- Combine all in dashboardPage----------------
dashboardPage(header, sidebar, body, skin = "yellow")
