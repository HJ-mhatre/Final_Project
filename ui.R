#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Data analysis of Chronic desease and health Promotion data"),
  h4("This Data were provided by the Centers for Disease Control and Prevention (CDC), 
     Division of Population Health, Epidemiology and Surveillance Branch. 
     The project was funded by the Robert Wood Johnson Foundation (RWJF) 
     in conjunction with the CDC Foundation. 500 cities project city-level data 
     in GIS-friendly format can be joined with city spatial data 
     (https://chronicdata.cdc.gov/500-Cities/500-Cities-City-Boundaries/n44h-hy2j)"),
  
  h3("Souce of the data:"),
  h4("https://chronicdata.cdc.gov/500-Cities/500-Cities-City-level-Data-GIS-Friendly-Format-201/dxpw-cm5u"),
  
  
  # Sidebar with a slider input 
  sidebarLayout(
    
    
    sidebarPanel(
      
      h1("Upload a csv file used for the analysis") ,
      fileInput("file1", "Choose CSV File",
                accept = c(
                  "text/csv",
                  "text/comma-separated-values,text/plain",
                  ".csv")
      ),
      tags$hr(),
      checkboxInput("header", "Header", TRUE),
      
      
      h1("Move the slider"), 
      sliderInput("sliderSmoke","Choose Smoking prevalance(x)",8.5, 30.9, value = 10),
      
      h3("Smoking rate:"),
      textOutput("text1"),
      
      
      h1("Move the slider"), 
      sliderInput("sliderPop","Choose population(x)",42175, 8175133, value = 43000),
      
      h3("population:"),
      textOutput("text2")
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      
      tableOutput("contents"),
      
      plotOutput("plot1"),
      
      h2("Prediction1"),
      textOutput("prediction1"),
      h4("we found this as a good fit because we got adjusted R^2 is greater than others two and close to 1."),
      h4("In this model multiple R^2 is 0.6987. It means data variability in this data is good that is 69.87%"),
         
         h4("Coefficients:"),
           h4("___________________________________Estimate  Std.Error  t value Pr(>|t|)   ") ,
           h4("(Intercept)____________________________-0.232705   0.123020  -1.892   0.0591 .") , 
         h4("x___________________________________0.112247   0.005436  20.650   <2e-16 ***") ,
h4("ppl_BPHIGH_age_adjusted_prevalence____0.046371   0.004982   9.307   <2e-16 ***") ,
         
         
         h4("The intercept is the grand mean of stroke rate , calculated for all data regardless of smoking rate=0, here it is -0.232705"),
         h4("The data here shows that the coefficients for x (smoking rate) is 0.112247.  The coefficient indicates that for every additional 
         prevalence of smoke ,you can expect stroke prevalence increase by an average of 0.112247 keeping  ppl_BPHIGH_age_adjusted_prevalence 
         as constant."),
         h4("The p-value for x is less than <2e-16 here . A very small value means that x is probably an excellent addition to this model.
         "),
      
    
      
      plotOutput("plot2"),
      
      h2("prediction2"),
      textOutput("prediction2"),

h2("Question:what is the prevalence rate of cancer disease  among population?"),
h4("The data here shows that the coefficients for x (population) is -0.00000012459.  The coefficient indicates that for every additional population, you can expect cancer 
   prevalence decreases by an average of -0.00000012459, as it is negative value.")


    ))
  ))

