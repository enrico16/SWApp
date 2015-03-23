library(shiny)
library(dplyr)

stopgap <- readRDS("data/smallgap.rds")

shinyServer(function(input, output) {
  
  output$table <- renderDataTable({
      
    data <- stopgap %>%
        filter(Pvalue >= input$pvalue[1] & Pvalue <= input$pvalue[2],
               GeneRank >= input$generank[1] & GeneRank <= input$generank[2],
               GeneScore >= input$genescore[1] & GeneScore <= input$genescore[2])
    
    if (input$gene != "All"){
      data <- data[data$Gene == input$gene,]
    }
    if (input$trait != "All"){
      data <- data[data$Trait == input$trait,]
    }
    if (input$snp != "All"){
      data <- data[data$SNP == input$snp,]
    }
    
    data
  },
  options = list(pageLength = 10))
})
