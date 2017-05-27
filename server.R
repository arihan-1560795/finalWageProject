library(dplyr)
library(plotly)
library(shiny)

setwd('~/GitHub/finalWageProject')
wage.df <- read.csv('data/annualsalary.csv', stringsAsFactors = FALSE)

shinyServer(function(input, output) { 
  output$GraphName <- renderPlotly({
    #process information here
    return(plot_ly(
      #Graph data here (data = a, x = b, ...)
    ))
  })
  
  #Ideas:
  #Find person, and give all information about them (graph of salary)
  #median/ average/ diff wage bw depts.
  #Quartile salary graph
  #Filter professions by growth/ size; see stats for a particular title
  output$findPerson <- renderPlotly({
    name.vec <- unlist(strsplit(toupper(input$person), split=" "))
    person.df <- wage.df[sapply(strsplit(wage.df$employee_name, split=", "), function(str) all(name.vec %in% str)), ]
    person.df <- head(person.df, 1)
    return(plot_ly(
      #Graph data here (data = a, x = b, ...)
    ))
  })
  
})


#Following code is scrap; meant to be used for finding stuff about agencies
# "    person.df <- wage.df %>% filter(grepl(name.vec, employee_name))
#     group.df <- wage.df %>% group_by(Agency_Title)
#     group.df <- group.df %>% mutate(test1 = select(as.numeric(gsub(",", "", "23,222")), starts_with("Sal")))
#     
#         group.df <- group.df %>% mutate(test1 = select(as.numeric(gsub(",", "", .)), starts_with("Sal")) %>%
#                rowMeans(na.rm = TRUE))
#     
#     group.df <- group.df %>% mutate(average_salary = mean(
#                                          as.numeric(gsub(",", "", Sal2012)), 
#                                          as.numeric(gsub(",", "", Sal2013)), 
#                                          as.numeric(gsub(",", "", Sal20141)), 
#                                          as.numeric(gsub(",", "", Sal2015))))
# "    
# myFun <- function(x) {
#   c(min = min(x), max = max(x), 
#     mean = mean(x), median = median(x), 
#     std = sd(x))
# }
