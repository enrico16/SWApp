library(shiny)
library(dplyr)

load("../data/stopgap.RData")
stopgap <- stopgap %>%
	select(gene, msh, snp.ld, pvalue, gene.score, gene.rank.min, pubmedid) %>%
	rename(Gene=gene, Trait=msh, SNP=snp.ld, Pvalue=pvalue, GeneScore=gene.score, GeneRank=gene.rank.min, PubMedID=pubmedid) %>%
	unique

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
