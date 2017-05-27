library(shiny)
library(plotly)

shinyUI(navbarPage('FinalProjectName',
  tabPanel('TabName',
    titlePanel('TitleBelowTab'),
    mainPanel(p(paste0("TabDescription")))
  ),

  #Copy the following code as a template---------------
  tabPanel('GraphDescriptionInTabName',
  titlePanel('TitleOfGraph'),
  sidebarLayout(
    #Sidebar controls go here
    sidebarPanel(),
    #Generate graph here (change according to name, type of gaph you want)
    mainPanel(plotlyOutput("GraphName"))
  )),
  #End of copy----------------------------------------                   

  #Copy the following code as a template---------------
  tabPanel('Person',
   titlePanel('Person1'),
   sidebarLayout(
     sidebarPanel(
       textInput("person", label = h3("Text input"), value = "Enter text..."),
       mainPanel(plotlyOutput("findPerson"))
   ))
  #End of copy----------------------------------------                   
  
    
))