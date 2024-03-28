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
    menuItem(text = h4("User guide"), tabName = "guide", icon = icon("users"))
    
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
                
                  tabsetPanel(
                    tabPanel(h4("Extreme Heat"),
                             
                             # Extreme Heat Plot
                             fluidRow(
                               tags$style(".nav-tabs-custom {box-shadow:none;}
                                          "),
                               
                               # extreme heat plot ---
                               box(width = 6,
                                   style = "border: none; border-width:0,",
                                   plotOutput('hazard_plot')
                                   
                               ), #END extreme heat plot
                               
                               # Text on the right of graph description ---
                               column(width = 6,
                                      
                                      box(
                                        width = NULL,
                                        style = "border: none; border-width:0;",
                                        h3("What does this graph tell us?"),
                                        p("The Santa Paula Unified School District
                                          will see an increase in extreme heat days 
                                          in the upcoming years."),
                                        h3("How is extreme heat measured?"),
                                        p("Extreme heat is measured as days 
                                          where the daily maximum temperature is
                                          above the 98th percentile of observed 
                                          historical temperatures"),
                                        h3("Source:")
                                      )
                                      
                                      )
                             )
                             
                             ),
                    tabPanel(h4("Extreme Precipitation")),
                    tabPanel(h4("Wildfire")),
                    tabPanel(h4("Flooding")),
                    tabPanel(h4("Sea Level Rise"))
                    
                    
                  ),#END of tabsetPanel
                
                
                
                
                
              )#End input box
              
            )#END Fluidrow
            
    
  )#END of tabItems
  
  
) #END dashboard Body
)

# -------- Combine all in dashboardPage----------------
dashboardPage(header, sidebar, body, skin = "yellow")
