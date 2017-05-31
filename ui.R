library(shiny)
library(plotly)
library(dplyr)

wage.df <- read.csv('data/annualsalary.csv', stringsAsFactors = FALSE)

vals <- unique(wage.df$Agency_Title)
depts <- seq(1:137)
names(depts) <- vals
depts <- as.list(depts)

shinyUI(navbarPage('Washington Department Wages',
 #Loads a plotly graph for the given person's salary from 2011 to 2015
 tabPanel('WA Employee wage',
          sidebarLayout(
            sidebarPanel(
              textInput(inputId = "person", label = h3("See a WA employee's salary!"), value = "Person's first & last name only")
            ),
            mainPanel(
              plotlyOutput("findPerson"),
              br(),
              br(),
              tags$a(href="http://fiscal.wa.gov/WaStEmployeeHistSalary.txt", "Data Source"))
          )
 ),
 
  tabPanel("Department Wages",
           sidebarPanel(
             checkboxGroupInput("selectDepts", 
                                label = h3("Choose the Departments"), 
                                choices = depts,
                                selected = 125)
           ),
           
           mainPanel(
             #plots the department wise average wage comparison over the years
             plotlyOutput("dept"),
             br(),
             br(),
             tags$a(href="http://fiscal.wa.gov/WaStEmployeeHistSalary.txt", "Data Source")
           )
  )
    
))