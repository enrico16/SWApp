library(shiny)
library(RMySQL)

con <- dbConnect(MySQL(), user="ef884766", host="localhost", dbname="stopgap")

shinyServer(function(input, output) {
  
  output$table <- renderDataTable({
    
    sqlCode <- paste0("select Gene, SNP, Trait, PValue, GeneScore, GeneRank, PubMedID from swapp",
                    " where PValue < ", input$pvalue,
                    " and GeneRank >= ", input$generank[1], " and GeneRank <= ", input$generank[2],
                    " and GeneScore >= ", input$genescore[1], " and GeneScore <= ", input$genescore[2],
                    " and Gene like ", "'", input$gene, "'",
                    " and Trait like ", "'", input$trait, "'",
                    " and SNP like ", "'", input$snp, "'",
                    ";")


    data <- dbGetQuery(con, sqlCode)

  },
  options = list(pageLength = 10))
})
