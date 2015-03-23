library(shiny)
library(dplyr)

stopgap <- readRDS("data/smallgap.rds")

shinyUI(
  fluidPage(
    titlePanel(title="", windowTitle="SWApp"),
    
    sidebarLayout(
        sidebarPanel(width=3,
                     
                     h1(strong("SWApp")),
                     h3(strong("STOPGAP Web App")),
                     
                     p(strong("Swapp"), "is a simple web application that makes using and querying",
                       a(strong("STOPGAP"), href="https://connect.gsk.com/sites/genetics/GeneticsWIKI/Wiki%20Pages/STOPGAP2.aspx"),
                       "easier."),
                     
            br(),
            
            sliderInput("pvalue",
                        "Pvalue:",
                        min = 0,
                        max = 1e-2,
                        value = c(0, 1e-2),
                        step = 1e-3,
                        sep = ""),
            
            sliderInput("genescore",
                        "GeneScore:",
                        min = 0,
                        max = 20,
                        value = c(0, 20)),
            
            sliderInput("generank",
                        "GeneRank:",
                        min = 1,
                        max = 100,
                        value = c(1, 100)),
            
            br(),
            
            p("Swapp is developed by",
              a(strong("Enrico Ferrero"), href="mailto:enrico.x.ferrero@gsk.com"),
              "using",
              a(strong("Shiny"), href="http://shiny.rstudio.com/")),
            
            p("STOPGAP is developed by",
              a(strong("Matt Nelson"), href="mailto:matthew.r.nelson@gsk.com"))
        ),
        
        mainPanel(
            fluidRow(
              column(4, 
                  selectInput("gene", 
                              "Gene:", 
                              c("All", 
                                unique(sort(as.character(stopgap$Gene)))))
              ),
              column(4, 
                  selectInput("trait", 
                              "Trait:", 
                              c("All", 
                                unique(sort(as.character(stopgap$Trait)))))
              ),
              column(4, 
                  selectInput("snp", 
                              "SNP:", 
                              c("All", 
                                unique(sort(as.character(stopgap$SNP)))))
              )        
            ),
            fluidRow(
              dataTableOutput(outputId="table")
            )
        )
    )
  )
)

