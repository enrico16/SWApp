library(shiny)
library(DT)

shinyUI(
  fluidPage(
    titlePanel(title="", windowTitle="SWApp"),
    
    sidebarLayout(
        sidebarPanel(width=3,
                     
                     h1(strong("SWApp")),
                     h3(strong("STOPGAP Web App")),
                     
                     p(strong("SWApp"), "is a simple web application that makes using and querying",
                       a(strong("STOPGAP"), href="https://connect.gsk.com/sites/genetics/GeneticsWIKI/Wiki%20Pages/STOPGAP2.aspx"),
                       "easier."),
                     
            br(),
            
            selectInput("pvalue",
                        "PValue:",
                        choices = list(1e-100,
                                       1e-50,
                                       1e-30,
                                       1e-20,
                                       1e-10,
                                       1e-8,
                                       1e-5,
                                       0.001,
                                       0.01,
                                       0.05),
                        selected=1e-8),
            
            sliderInput("genescore",
                        "GeneScore:",
                        min = 0,
                        max = 20,
                        value = c(5, 20)),
            
            sliderInput("generank",
                        "GeneRank:",
                        min = 1,
                        max = 100,
                        value = c(1, 10)),
            
            submitButton("Submit"),
            
            br(),
            br(),
            
            p("SWApp is developed by",
              a(strong("Enrico Ferrero"), href="mailto:enrico.x.ferrero@gsk.com"),
              "using",
              a(strong("Shiny"), href="http://shiny.rstudio.com/")),
            
            p("STOPGAP is developed by",
              a(strong("Matt Nelson"), href="mailto:matthew.r.nelson@gsk.com"))
        ),
        
        mainPanel(

                  tabsetPanel(

                              tabPanel("Best LD",
                                       DT::dataTableOutput("table1"),
                                       downloadButton("download1", "Download")),

                              tabPanel("Gene MeSH",
                                       DT::dataTableOutput("table2"),
                                       downloadButton("download2", "Download"))

                              )
                  )
        )
    ))
