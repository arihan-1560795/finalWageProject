library(shiny)
library(plotly)

shinyUI(navbarPage('FinalProjectName',
  # tabPanel('TabName',
  #   titlePanel('TitleBelowTab'),
  #   mainPanel(p(paste0("TabDescription")))
  # ),

  # #Copy the following code as a template---------------
  # tabPanel('GraphDescriptionInTabName',
  # titlePanel('TitleOfGraph'),
  # sidebarLayout(
  #   #Sidebar controls go here
  #   sidebarPanel(),
  #   #Generate graph here (change according to name, type of gaph you want)
  #   mainPanel(plotlyOutput("GraphName"))
  # )),
  # #End of copy----------------------------------------                   

  #Loads a plotly graph for the given person's salary from 2011 to 2015
  tabPanel('WA Employee wage',
   sidebarLayout(
     sidebarPanel(
       textInput(inputId = "person", label = h3("See a WA employee's salary!"), value = "Person's first & last name only")
     ),
     mainPanel(plotlyOutput("findPerson"))
   )
   )

    
))