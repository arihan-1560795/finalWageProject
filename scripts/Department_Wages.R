library(dplyr)
library(plotly)

wage.df <- read.csv('data/annualsalary.csv', stringsAsFactors = FALSE)

colnames(wage.df)[7] <- "Sal2014"

clean.commas <- function(column) {
  as.numeric(gsub(",","",column))
}

wage.df[5:8] <- lapply(wage.df[5:8], clean.commas)

Department_Wages <- function(vector.1) {
  
  avg.wage <- function(column) {
    round(sum(column)/sum(column > 0), digits = 2)
  }
  
  wage.df <- wage.df %>% 
    group_by(Agency_Title) %>% 
    summarise_each(funs(avg.wage), 5:8)
  
  years <- as.character(c(2012:2015))
  overall.avg.wages <- round(colMeans(wage.df[-1], na.rm = TRUE), digits = 2)
  
 
  # date, number of employees, dept, avg salar
   p <- plot_ly(x = ~years, 
               y = ~overall.avg.wages, 
               name = "Overall",
               hoverinfo = "text",
               text = paste0("In ", years, " the average salary in<br>", 
                             "Washington State<br>",
                             "was ", "$", overall.avg.wages), 
               type = "scatter", 
               mode = "markers and lines") %>% 
    
    layout(title = "Average Wages of Govt. Depts.",
           xaxis = list(title = "Years"), 
           yaxis = list(title = "Average Wage"))
  
  for(i in vector.1) {
    
    salary <- wage.df %>% 
      filter(row_number() == i) %>% 
      select(-1) %>% 
      as.numeric() %>% 
      as.vector()
    
    agency <- wage.df %>% 
      filter(row_number() == i) %>% 
      select(1)
    
    p <- add_trace(p, 
                   y = salary, 
                   name = agency,
                   hoverinfo = "text",
                   text = paste0("In ", years, " the average salary in the<br>", 
                                 agency, "<br>", 
                                 "was ", "$", salary), 
                   mode = "markers and lines")
  }
  
  return(p)
  
}